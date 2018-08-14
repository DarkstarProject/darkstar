-----------------------------------
-- Area: The Boyahda Tree
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_BOYAHDA_TREE,player);
end;

function onEventUpdate(player,csid,option)
    updateGov(player,csid,option,719,720,721,722,723,724,725,726,0,0);
end;

function onEventFinish(player,csid,option)
    finishGov(player,csid,option,719,720,721,722,723,724,725,726,0,0,GOV_MSG_BOYAHDA_TREE);
end;
