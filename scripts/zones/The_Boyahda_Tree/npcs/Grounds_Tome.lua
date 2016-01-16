-----------------------------------
-- Area: The Boyahda Tree
-- NPC:  Grounds Tome
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    startGov(GOV_EVENT_BOYAHDA_TREE,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,719,720,721,722,723,724,725,726,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,719,720,721,722,723,724,725,726,0,0,GOV_MSG_BOYAHDA_TREE);
end;
