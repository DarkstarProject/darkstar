-----------------------------------
-- Area: Ru'Aun Gardens
-- NPC:  ??? (Seiryu's Spawn)
-- Allows players to spawn the HNM Seiryu with a Gem of the East and a Springstone.
-- !pos 569 -70 -80 130
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, {1418, 1419}) and npcUtil.popFromQM(player, npc, ID.mob.SEIRYU) then -- Gem of the East and Springstone
        player:showText(npc,ID.text.SKY_GOD_OFFSET + 9)
        player:confirmTrade()
    end
end

function onTrigger(player,npc)
    player:messageSpecial(ID.text.SKY_GOD_OFFSET + 1)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
