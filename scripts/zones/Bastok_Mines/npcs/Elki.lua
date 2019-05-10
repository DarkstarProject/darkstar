-----------------------------------
-- Area: Bastok Mines
--  NPC: Elki
-- Starts Quests: Hearts of Mythril, The Eleventh's Hour
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/titles");
local ID = require("scripts/zones/Bastok_Mines/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

Fame = player:getFameLevel(BASTOK);
Hearts = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.HEARTS_OF_MYTHRIL);
HeartsVar = player:getVar("HeartsOfMythril");
Elevenths = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.THE_ELEVENTH_S_HOUR);
EleventhsVar = player:getVar("EleventhsHour");
HasToolbox = player:hasKeyItem(dsp.ki.OLD_TOOLBOX);

    if (Hearts == QUEST_AVAILABLE) then
        player:startEvent(41);
    elseif (Hearts == QUEST_ACCEPTED and HeartsVar == 1) then
        player:startEvent(42);
    elseif (Hearts == QUEST_COMPLETED and Elevenths == QUEST_AVAILABLE and Fame >=2 and player:needToZone() == false) then
        player:startEvent(43);
    elseif (Elevenths == QUEST_ACCEPTED and HasToolbox) then
        player:startEvent(44);
    else
        player:startEvent(31);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)

    if (csid == 41 and option == 0) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.HEARTS_OF_MYTHRIL);
        player:addKeyItem(dsp.ki.BOUQUETS_FOR_THE_PIONEERS);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BOUQUETS_FOR_THE_PIONEERS);
    elseif (csid == 42) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,12840);
        else
            player:addTitle(dsp.title.PURSUER_OF_THE_PAST);
            player:addItem(12840);
            player:messageSpecial(ID.text.ITEM_OBTAINED,12840);
            player:completeQuest(BASTOK,dsp.quest.id.bastok.HEARTS_OF_MYTHRIL);
            player:addFame(BASTOK,80);
            player:setVar("HeartsOfMythril",0);
            player:needToZone(true);
        end
    elseif (csid == 43 and option == 1) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.THE_ELEVENTH_S_HOUR);
    elseif (csid == 44) then
        player:setVar("EleventhsHour",1);
    end

end;
