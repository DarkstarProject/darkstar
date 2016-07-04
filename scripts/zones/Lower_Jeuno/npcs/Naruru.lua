-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Naruru
-- Starts and Finishes Quests: Cook's Pride
-- @pos -56 0.1 -138 245
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TheWonderMagicSet = player:getQuestStatus(JEUNO,THE_WONDER_MAGIC_SET);
    local CooksPride = player:getQuestStatus(JEUNO,COOK_S_PRIDE);
    local TheKindCardian = player:getQuestStatus(JEUNO,THE_KIND_CARDIAN);
    local WildcatJeuno = player:getVar("WildcatJeuno");

    if (player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,13) == false) then
        player:startEvent(10053);
    elseif (TheWonderMagicSet == QUEST_COMPLETED and CooksPride == QUEST_AVAILABLE) then 
        if (player:getVar("CooksPrideVar") == 0) then
            player:startEvent(0x00BD); -- Start quest "Cook's pride" Long CS
         else
            player:startEvent(0x00BC); -- Start quest "Cook's pride" Short CS
        end
    elseif (CooksPride == QUEST_ACCEPTED and player:hasKeyItem(SUPER_SOUP_POT) == false) then 
        player:startEvent(0x00BA); -- During quest "Cook's pride"
    elseif (player:hasKeyItem(SUPER_SOUP_POT) == true) then 
        player:startEvent(0x00BB); -- Finish quest "Cook's pride"
    elseif (CooksPride == QUEST_COMPLETED and TheKindCardian == QUEST_AVAILABLE) then 
        if (player:getVar("theLostCardianVar") == 0) then 
            player:startEvent(0x001f); -- During quests "The lost cardian"
        else
            player:startEvent(0x0047); -- During quests "The lost cardian"
        end
    elseif (CooksPride == QUEST_COMPLETED and TheKindCardian ~= QUEST_COMPLETED) then
        player:startEvent(0x0047); -- During quests "The kind cardien"
    elseif (TheKindCardian == QUEST_COMPLETED) then
        player:startEvent(0x0048); -- New standard dialog after the quest "The kind cardien"
    else
        player:startEvent(0x0062); -- Standard dialog
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
    if ((csid == 0x00BD or csid == 0x00BC) and option == 0) then 
        player:addQuest(JEUNO,COOK_S_PRIDE);
    elseif (csid == 0x00BD and option == 1) then 
        player:setVar("CooksPrideVar",1);
    elseif (csid == 0x00BB) then 
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13446);
        else
            player:addTitle(MERCY_ERRAND_RUNNER);
            player:delKeyItem(SUPER_SOUP_POT);
            player:setVar("CooksPrideVar",0);
            player:addGil(GIL_RATE*3000);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*3000);
            player:addItem(13446);
            player:messageSpecial(ITEM_OBTAINED,13446); -- Mythril Ring
            player:addFame(JEUNO, 30);
            player:completeQuest(JEUNO,COOK_S_PRIDE);
        end
    elseif (csid == 10053) then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",13,true);
    end
end;