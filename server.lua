local ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback('brainrotduel:startDuel', function(source, cb, targetPlayerId)
    local xPlayer = ESX.GetPlayerFromId(source)
    local targetPlayer = ESX.GetPlayerFromId(targetPlayerId)

    if not xPlayer or not targetPlayer then
        cb(false, 'Player not found.')
        return
    end

    if xPlayer.getAccount('bank').money < Config.DuelCost then
        cb(false, 'Not enough money.')
        return
    end

    xPlayer.removeAccountMoney('bank', Config.DuelCost)
    MySQL.Async.execute('INSERT INTO brainrot_duels (player1_id, player2_id, status) VALUES (@player1_id, @player2_id, @status)', {
        ['@player1_id'] = xPlayer.source,
        ['@player2_id'] = targetPlayer.source,
        ['@status'] = 'pending'
    }, function(rowsChanged)
        if rowsChanged > 0 then
            cb(true, 'Duel started.')
        else
            cb(false, 'Failed to start duel.')
        end
    end)
end)

-- Handle duel outcomes
RegisterServerEvent('brainrotduel:endDuel')
AddEventHandler('brainrotduel:endDuel', function(winnerId, loserId)
    local winner = ESX.GetPlayerFromId(winnerId)
    local loser = ESX.GetPlayerFromId(loserId)

    if winner and loser then
        winner.addAccountMoney('bank', Config.DuelReward)
        MySQL.Async.execute('UPDATE brainrot_duels SET status = @status WHERE player1_id = @player1_id AND player2_id = @player2_id', {
            ['@status'] = 'completed',
            ['@player1_id'] = winnerId,
            ['@player2_id'] = loserId
        })
    end
end)