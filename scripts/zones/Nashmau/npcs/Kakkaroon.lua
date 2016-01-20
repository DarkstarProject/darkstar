-----------------------------------
-- Area: Nashmau
-- NPC: Kakkaroon
-- Standard Info NPC
-- @pos 13.245 0.000 -25.307 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local ratrace = player:getQuestStatus(AHT_URHGAN,RAT_RACE);
    local ratRaceProg = player:getVar("ratraceCS");
    if (ratrace == QUEST_AVAILABLE) then
       player:startEvent(0x0134);
    elseif (ratRaceProg == 6) then  
       player:startEvent(0x0138);
    elseif (ratrace == QUEST_ACCEPTED) then  
       player:startEvent(0x0139);

    elseif (ratrace == QUEST_COMPLETED) then  
       player:startEvent(0x013a);
    end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0134) then
       player:setVar("ratraceCS",1);
       player:addQuest(AHT_URHGAN,RAT_RACE);
    elseif (csid == 0x0138) then
        if (player:getFreeSlotsCount() <= 2) then
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINEDX,2187,2);
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINEDX,2186,2);
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINEDX,2185,3);
        else
           player:setVar("ratraceCS",0);
           player:addItem(2187,2);
           player:addItem(2186,2);
           player:addItem(2185,3);
           player:messageSpecial(ITEM_OBTAINEDX,2187,2);
           player:messageSpecial(ITEM_OBTAINEDX,2186,2);
           player:messageSpecial(ITEM_OBTAINEDX,2185,3);
           player:completeQuest(AHT_URHGAN,RAT_RACE);
        end
    end
end;



