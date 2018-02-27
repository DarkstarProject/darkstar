-----------------------------------
-- Area: Caedarva Mire
--  NPC: qm10
-- Involved in quest: Operation Teatime
-- !pos  473 -31 75 79
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs");
require("scripts/zones/Caedarva_Mire/MobIDs");
require("scripts/globals/quests");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local OperationTeatime = player:getQuestStatus(AHT_URHGAN,OPERATION_TEATIME);
    local OperationTeatimeProgress = player:getVar("OperationTeatimeProgress");

    if (OperationTeatime == QUEST_ACCEPTED and OperationTeatimeProgress == 3) then
        player:startEvent(15);-- Event ID 14 for CS after toad        
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 15) then
        if (player:getFreeSlotsCount() ~= 0) then
            player:completeQuest(AHT_URHGAN,OPERATION_TEATIME);
            player:addItem(15602); --Pup. Churidars 
            player:messageSpecial(ITEM_OBTAINED,15602); -- Pup. Churidars 
            player:setVar("OperationTeatimeProgress",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,15602);
        end
       
    end
end;