-----------------------------------
-- Area: Port Bastok
--  NPC: Festive Moogle
-- Type: Event NPC
--  !pos 46.902 8.499 -242.276 236
-----------------------------------
require("scripts/globals/npc_util")

    local festiveItems = {
        [1] = function(player) return (player:getCharVar("festiveMoogleNomadCap")) end,
        [2] = function(player) return (player:getCharVar("festiveMoogleMoogleCap")) end,
        [3] = function(player) return (player:getCharVar("festiveMoogleMoogleRod")) end,
        [4] = function(player) return (player:getCharVar("festiveMoogleHarpsichord")) end,
        [5] = function(player) return (player:getCharVar("festiveMooglestuffedChocobo")) end,
        [6] = function(player) return (player:getCharVar("festiveMoogleTidalTalisman")) end,
        [7] = function(player) return (player:getCharVar("festiveMoogleDestrierBeret")) end,
        [8] = function(player) return (player:getCharVar("festiveMoogleChocoboShurt")) end,
    }
    local stock = {
        16119,  -- Nomad Cap
        16118,  -- Moogle Cap
        18401,  -- Moogle Rod
        320,    -- Harpsichord
        264,    -- Stuffed Chocobo
        11290,  -- Tidal Talisman
        11811,  -- Destrier Beret
        10293,  -- Chocobo Shirt
    }
    local availableItems = {}

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    for i = 1, #festiveItems, 1 do
        if festiveItems[i] == 1 then
            table.insert(availableItems, stock[i])
        end
    end
    player:startEvent(380, unpack(availableItems))
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 380 then
        npcUtil.giveItem(player, availableItems[option])
    end
end