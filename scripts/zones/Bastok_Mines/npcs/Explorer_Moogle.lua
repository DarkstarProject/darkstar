-----------------------------------
-- Area: Bastok Mines
--  NPC: Explorer Moogle
-----------------------------------
require("scripts/globals/teleports")
-----------------------------------

local eventId = 585

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    dsp.teleport.explorerMoogleOnTrigger(player, eventId)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    dsp.teleport.explorerMoogleOnEventFinish(player, csid, option, eventId)
end