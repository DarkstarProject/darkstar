-----------------------------------
-- Area: Bastok Mines
--  NPC: Parraggoh
-- Finishes Quest: Beauty and the Galka
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Bastok_Mines/IDs");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)

BeautyAndTheGalka       = player:getQuestStatus(BASTOK,dsp.quest.id.bastok.BEAUTY_AND_THE_GALKA);
BeautyAndTheGalkaDenied = player:getCharVar("BeautyAndTheGalkaDenied");
PalboroughMinesLogs     = player:hasKeyItem(dsp.ki.PALBOROUGH_MINES_LOGS);

    if (PalboroughMinesLogs == true) then
        player:startEvent(10);
    elseif (BeautyAndTheGalka == QUEST_ACCEPTED) then
        Message = math.random(0,1);

        if (Message == 1) then
            player:startEvent(8);
        else
            player:startEvent(9);
        end
    elseif (BeautyAndTheGalkaDenied == 1) then
        player:startEvent(7);
    elseif (BeautyAndTheGalka == QUEST_COMPLETED) then
        player:startEvent(12);
    else
        player:startEvent(11);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)

    if (csid == 7 and option == 0) then
        player:addQuest(BASTOK,dsp.quest.id.bastok.BEAUTY_AND_THE_GALKA);
    elseif (csid == 10) then
        FreeSlots = player:getFreeSlotsCount();

        if (FreeSlots >= 1) then
            player:completeQuest(BASTOK,dsp.quest.id.bastok.BEAUTY_AND_THE_GALKA);
            player:setCharVar("BeautyAndTheGalkaDenied",0);
            player:delKeyItem(dsp.ki.PALBOROUGH_MINES_LOGS);
            player:addFame(BASTOK,75);
            player:addItem(16465);
            player:messageSpecial(ID.text.ITEM_OBTAINED,16465);
        else
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,16465);
        end
    end

end;
