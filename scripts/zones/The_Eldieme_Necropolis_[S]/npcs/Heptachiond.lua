-----------------------------------
-- Area: The_Eldieme_Necropolis_[S]
--  NPC: Heptachiond
-- Starts and Finishes Quest: REQUIEM_FOR_THE_DEPARTED
-- @zone 175
-- !pos 256.196 -31.999 20.073
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    Rftd = player:getQuestStatus(CRYSTAL_WAR,REQUIEM_FOR_THE_DEPARTED);
    
	-- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if (Rftd == QUEST_AVAILABLE and player:hasKeyItem(dsp.ki.BRONZE_RIBBON_OF_SERVICE) == true and player:getMainLvl() >= 30) then
        player:startEvent(105); -- Start quest "Requiem for the Departed"
    elseif (Rftd == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.SHEAF_OF_HANDMADE_INCENSE) == true) then
            player:startEvent(107); -- During quest "Requiem for the Departed" (with Handmade Incense KI)
        else
            player:startEvent(106); -- During quest "Requiem for the Departed" (before retrieving KI Handmade Incense)
        end
    elseif (Rftd == QUEST_COMPLETED) then
        player:startEvent(108); -- New standard dialog after "Requiem for the Departed"
    else
        player:startEvent(104); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
    if (csid == 105 and option == 0) then
        player:addQuest(CRYSTAL_WAR,REQUIEM_FOR_THE_DEPARTED);
    elseif (csid == 107) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4689);
        else
            player:delKeyItem(dsp.ki.SHEAF_OF_HANDMADE_INCENSE);
            player:addItem(4689);
            player:messageSpecial(ITEM_OBTAINED,4689);
            player:completeQuest(CRYSTAL_WAR,REQUIEM_FOR_THE_DEPARTED);
        end
    end
end;

