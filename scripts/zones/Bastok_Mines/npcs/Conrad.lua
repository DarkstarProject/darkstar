-----------------------------------
-- Area: Bastok Mines
-- NPC:  Conrad
-- Outpost Teleporter NPC
-- !pos 94.457 -0.375 -66.161 234
-----------------------------------
require("scripts/globals/conquest");

function onTrigger(player,npc)
    nationTeleportNpcTrigger(player, npc, 581, NATION_BASTOK)
end

function onEventUpdate(player,csid,option)
    nationTeleportNpcEventUpdate(player, csid, option)
end

function onEventFinish(player,csid,option)
    nationTeleportNpcEventFinish(player, csid, option)
end