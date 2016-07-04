-----------------------------------
-- Area: Toraimarai Canal
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
    startGov(GOV_EVENT_TORAIMARAI_CANAL,player);
end;

-----------------------------------
-- onEventSelection
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,618,619,620,621,622,623,624,625,0,0);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,618,619,620,621,622,623,624,625,0,0,GOV_MSG_TORAIMARAI_CANAL);
end;
