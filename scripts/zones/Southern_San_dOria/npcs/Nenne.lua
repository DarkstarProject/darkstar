-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Nenne
-- Starts and Finishes Quest: To Cure a Cough
-- !pos -114 -6 102 230
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

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    medicineWoman = player:getQuestStatus(SANDORIA,THE_MEDICINE_WOMAN);
    toCureaCough = player:getQuestStatus(SANDORIA,TO_CURE_A_COUGH);

    if (toCureaCough == QUEST_AVAILABLE and player:getVar("toCureaCough") == 0 and medicineWoman == QUEST_COMPLETED) then
        player:startEvent(538);
    elseif (player:hasKeyItem(dsp.ki.COUGH_MEDICINE) == true) then
        player:startEvent(647);
    else
        player:startEvent(584);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 538) then
        player:setVar("toCureaCough",1);
    elseif (csid == 647) then
        player:addTitle(dsp.title.A_MOSS_KIND_PERSON);
        player:setVar("toCureaCough",0);
        player:setVar("DiaryPage",0);
        player:delKeyItem(dsp.ki.COUGH_MEDICINE);
        player:addKeyItem(dsp.ki.SCROLL_OF_TREASURE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.SCROLL_OF_TREASURE);
        player:addFame(SANDORIA,30);
        player:completeQuest(SANDORIA,TO_CURE_A_COUGH);
    end

end;
