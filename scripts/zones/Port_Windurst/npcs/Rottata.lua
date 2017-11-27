-----------------------------------
-- Area: Port Windurst
-- NPC:  Rottata
-- Outpost Teleporter NPC
-- !pos 193.111 -12.999 215.638 240
-----------------------------------
require("scripts/globals/conquest");
function onTrigger(player,npc)
    nationTeleportNpcTrigger(player, npc, 552, NATION_WINDURST)
end

function onEventUpdate(player,csid,option)
    nationTeleportNpcEventUpdate(player, csid, option)
end

function onEventFinish(player,csid,option)
    nationTeleportNpcEventFinish(player, csid, option)
end