-----------------------------------
-- Area: Bastok Mines
-- NPC: Elki
-- Starts Quests: Hearts of Mythril, The Eleventh's Hour
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

Fame = player:getFameLevel(BASTOK);
Hearts = player:getQuestStatus(BASTOK,HEARTS_OF_MYTHRIL);
HeartsVar = player:getVar("HeartsOfMythril");
Elevenths = player:getQuestStatus(BASTOK,THE_ELEVENTH_S_HOUR);
EleventhsVar = player:getVar("EleventhsHour");
HasToolbox = player:hasKeyItem(0x18);

    if (Hearts == QUEST_AVAILABLE) then
        player:startEvent(0x0029);
    elseif (Hearts == QUEST_ACCEPTED and HeartsVar == 1) then
        player:startEvent(0x002a);
    elseif (Hearts == QUEST_COMPLETED and Elevenths == QUEST_AVAILABLE and Fame >=2 and player:needToZone() == false) then
        player:startEvent(0x002b);
    elseif (Elevenths == QUEST_ACCEPTED and HasToolbox) then
        player:startEvent(0x002c);
    else
        player:startEvent(0x001f);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0029 and option == 0) then
        player:addQuest(BASTOK,HEARTS_OF_MYTHRIL);
        player:addKeyItem(0x17);
        player:messageSpecial(KEYITEM_OBTAINED,0x17);
    elseif (csid == 0x002a) then
        player:addTitle(84);
        player:addItem(12840);
        player:messageSpecial(ITEM_OBTAINED,12840);
        player:completeQuest(BASTOK,HEARTS_OF_MYTHRIL);
        player:addFame(BASTOK,80);
        player:setVar("HeartsOfMythril",0);
        player:needToZone(true);
    elseif (csid == 0x002b and option == 1) then
        player:addQuest(BASTOK,THE_ELEVENTH_S_HOUR);
    elseif (csid == 0x002c) then
        player:setVar("EleventhsHour",1);
    end

end;




