-----------------------------------
-- Area: Temple of Uggalepih (159)
--  NPC: qm8 (???)
-- Note: Used to spawn Habetrot
-- !pos -57.434 -8.484 55.317 159
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    if npcUtil.tradeHas(trade, {{4366, 12}}) and not GetMobByID(ID.mob.HABETROT):isSpawned() and not GetMobByID(ID.mob.HABETROT + 1):isSpawned() then -- 12 La Theine Cabbages
        local mobToSpawn = (math.random(100) <= 20) and ID.mob.HABETROT or ID.mob.HABETROT + 1 -- 20% Chance to spawn Habetrot, else it's a Rumble Crawler
        npcUtil.popFromQM(player, npc, mobToSpawn)
        player:confirmTrade()
    end
end

function onTrigger(player, npc)
    player:messageSpecial(ID.text.BITS_OF_VEGETABLE)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
