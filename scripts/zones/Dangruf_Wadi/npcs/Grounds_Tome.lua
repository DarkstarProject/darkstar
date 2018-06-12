-----------------------------------
-- Area: Dangruf Wadi
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_DANGRUF_WADI,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,639,640,641,642,643,644,645,646,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,639,640,641,642,643,644,645,646,0,0,GOV_MSG_DANGRUF_WADI);
end;
