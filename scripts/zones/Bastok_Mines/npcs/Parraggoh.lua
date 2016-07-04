-----------------------------------
-- Area: Bastok Mines
-- NPC: Parraggoh
-- Finishes Quest: Beauty and the Galka
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
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

BeautyAndTheGalka       = player:getQuestStatus(BASTOK,BEAUTY_AND_THE_GALKA);
BeautyAndTheGalkaDenied = player:getVar("BeautyAndTheGalkaDenied");
PalboroughMinesLogs     = player:hasKeyItem(2);

    if (PalboroughMinesLogs == true) then
        player:startEvent(0x000a);
    elseif (BeautyAndTheGalka == QUEST_ACCEPTED) then
        Message = math.random(0,1);
        
        if (Message == 1) then
            player:startEvent(0x0008);
        else
            player:startEvent(0x0009);
        end 
    elseif (BeautyAndTheGalkaDenied == 1) then
        player:startEvent(0x0007);
    elseif (BeautyAndTheGalka == QUEST_COMPLETED) then
        player:startEvent(0x000c);
    else
        player:startEvent(0x000b);
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

    if (csid == 0x0007 and option == 0) then
        player:addQuest(BASTOK,BEAUTY_AND_THE_GALKA);
    elseif (csid == 0x000a) then
        FreeSlots = player:getFreeSlotsCount();
        
        if (FreeSlots >= 1) then
            player:completeQuest(BASTOK,BEAUTY_AND_THE_GALKA);
            player:setVar("BeautyAndTheGalkaDenied",0);
            player:delKeyItem(PALBOROUGH_MINES_LOGS);
            player:addFame(BASTOK,75); 
            player:addItem(16465);
            player:messageSpecial(ITEM_OBTAINED,16465);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16465);
        end
    end
    
end;




