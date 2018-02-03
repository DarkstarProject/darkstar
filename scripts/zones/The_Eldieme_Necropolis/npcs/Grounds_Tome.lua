-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Grounds Tome
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/groundsofvalor");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    startGov(GOV_EVENT_ELDIEME_NECROPOLIS,player);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    updateGov(player,csid,option,671,672,673,674,675,676,677,678,0,0);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    finishGov(player,csid,option,671,672,673,674,675,676,677,678,0,0,GOV_MSG_ELDIEME_NECROPOLIS);
end;
