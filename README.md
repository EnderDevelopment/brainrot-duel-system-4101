# Brainrot Duel System

Engage in thrilling brainrot duels with other players.

## Features

- Start duels with other players using a command or UI interaction
- Handle duel outcomes and manage duel rewards

## Requirements

- FiveM server with ESX framework
- MySQL database

## Installation

1. Download the script from the releases page.
2. Extract the files into your FiveM server's resources directory.
3. Add `start brainrotduel` to your server.cfg file.
4. Run the SQL script in your database to create the necessary tables.

## Usage

### Commands

- `/startduel [playerId]` - Start a duel with the specified player.

### UI Interaction

- Press the E key while looking at another player to start a duel.

## Configuration

The script can be configured by editing the `config.lua` file. The following options are available:

- `DuelCost` - The cost to start a duel.
- `DuelReward` - The reward for winning a duel.
- `DuelTimeout` - The timeout in seconds for a duel.
- `UI` - UI settings for the duel system.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=brainrot-duel-system&utm_content=bottom) — describe it in one sentence and get the full source code.