ESX = exports["es_extended"]:getSharedObject()

local isBoosted = false

-- Event to activate the speed boost
RegisterNetEvent("kilian_speed:activateSpeed")
AddEventHandler("kilian_speed:activateSpeed", function()
    if isBoosted then return end

    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    isBoosted = true

    -- Notify the player
    TriggerEvent('notifications', '#A020F0', 'Speed Boost', 'You are now faster!')

    -- Increase run and movement speed
    SetRunSprintMultiplierForPlayer(playerId, 1.4)
    SetPedMoveRateOverride(playerPed, 1.4)

    -- Countdown notifications (every 5 seconds)
    for i = 60, 1, -5 do
        TriggerEvent('notifications', '#A020F0', 'Speed Boost', 'Speed boost expires in ' .. i .. ' seconds.')
        Wait(5000)
    end

    -- Reset to normal speed
    SetRunSprintMultiplierForPlayer(playerId, 1.0)
    SetPedMoveRateOverride(playerPed, 1.0)
    isBoosted = false

    -- Notify the player
    TriggerEvent('notifications', '#A020F0', 'Speed Boost', 'Your speed is back to normal.')
end)
