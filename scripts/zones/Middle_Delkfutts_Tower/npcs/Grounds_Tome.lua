-----------------------------------
-- Area: Middle Delkfutt's Tower
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_MIDDLE_DELKFUTTS_TOWER,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,782,783,784,0,0,0,0,0,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,782,783,784,0,0,0,0,0,0,0,GOV_MSG_MIDDLE_DELKFUTTS_TOWER);
end;
