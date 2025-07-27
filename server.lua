ESX = exports["es_extended"]:getSharedObject()

local cooldowns = {}

-- Register the usable item: "speed"
ESX.RegisterUsableItem("speed", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local playerName = xPlayer.getName()           -- In-game character name
    local steamName = GetPlayerName(source)        -- Steam name (if visible)
    local currentTime = os.time()

    -- Check cooldown: 300 seconds (5 minutes)
    if cooldowns[source] and (currentTime - cooldowns[source]) < 300 then
        local remainingTime = 300 - (currentTime - cooldowns[source])
        TriggerClientEvent("esx:showNotification", source, "You can use this item again in " .. remainingTime .. " seconds!")
        return
    end

    -- Set cooldown and activate speed boost
    cooldowns[source] = currentTime
    TriggerClientEvent("kilian_speed:activateSpeed", source)

    -- Log to Discord
    local time = os.date('%d.%m.%Y %H:%M:%S')
    local message = {
        username = "Speed Usage Logs",
        embeds = {
            {
                title = "🚀 Speed Item Used",
                description = string.format("**%s** used the speed item!", steamName),
                color = 16776960,
                fields = {
                    { name = "⏰ Time", value = time, inline = true },
                    { name = "👤 In-Game Name", value = playerName, inline = true },
                    { name = "🆔 Steam Name", value = steamName, inline = true }
                }
            }
        }
    }

    PerformHttpRequest(
        "https://discord.com/api/webhooks",
        function(err, text, headers) end,
        'POST',
        json.encode(message),
        { ['Content-Type'] = 'application/json' }
    )
end)
