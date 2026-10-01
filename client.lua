local ESX = exports['es_extended']:getSharedObject()

local function startDuel(targetPlayerId)
    ESX.TriggerServerCallback('brainrotduel:startDuel', function(success, message)
        if success then
            ESX.ShowNotification('Duel started!')
        else
            ESX.ShowNotification(message)
        end
    end, targetPlayerId)
end

RegisterCommand('startduel', function(source, args)
    local targetPlayerId = tonumber(args[1])
    if targetPlayerId then
        startDuel(targetPlayerId)
    else
        ESX.ShowNotification('Invalid player ID.')
    end
end, false)

-- UI for initiating a duel
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(0, 38) then -- E key
            local player, distance = ESX.Game.GetClosestPlayer()
            if distance ~= -1 and distance <= 3.0 then
                startDuel(GetPlayerServerId(player))
            end
        end
    end
end)