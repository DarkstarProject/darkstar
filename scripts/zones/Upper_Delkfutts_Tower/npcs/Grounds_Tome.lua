-----------------------------------
-- Area: Upper Delkfutt's Tower
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_UPPER_DELKFUTTS_TOWER,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,785,786,787,788,789,0,0,0,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,785,786,787,788,789,0,0,0,0,0,GOV_MSG_UPPER_DELKFUTTS_TOWER);
end;
