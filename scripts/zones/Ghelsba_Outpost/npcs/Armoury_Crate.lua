-----------------------------------
-- Area: Ghelsba_Outpost
-- NPC:  Armoury Crate
-- Ghelsba_Outpost Armoury_Crate
-------------------------------------
require("scripts/globals/bcnm");
-------------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:getBCNMloot();
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
