-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Jeanvirgaud
-- Outpost Teleporter NPC
-- !pos 111 -0.199 -6 231
-----------------------------------
require("scripts/globals/conquest");

function onTrigger(player,npc)
    nationTeleportNpcTrigger(player, npc, 716, NATION_SANDORIA)
end

function onEventUpdate(player,csid,option)
    nationTeleportNpcEventUpdate(player, csid, option)
end

function onEventFinish(player,csid,option)
    nationTeleportNpcEventFinish(player, csid, option)
end