-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Nenne
-- Starts and Finishes Quest: To Cure a Cough
-- @zone 230
-- @pos -114 -6 102
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
    toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);
    
    if (toCureaCough == QUEST_AVAILABLE and player:getVar("toCureaCough") == 0 and medicineWoman == QUEST_COMPLETED) then
        player:startEvent(0x021A);
    elseif (player:hasKeyItem(COUGH_MEDICINE) == true) then
        player:startEvent(0x0287);
    else
        player:startEvent(0x0248);
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x021A) then
        player:setVar("toCureaCough",1);
    elseif (csid == 0x0287) then
        player:addTitle(A_MOSS_KIND_PERSON);
        player:setVar("toCureaCough",0);
        player:setVar("DiaryPage",0);
        player:delKeyItem(COUGH_MEDICINE);
        player:addKeyItem(SCROLL_OF_TREASURE);
        player:messageSpecial(KEYITEM_OBTAINED,SCROLL_OF_TREASURE);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,TO_CURE_A_COUGH);
    end
    
end;
