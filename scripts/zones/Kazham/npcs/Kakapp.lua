-----------------------------------
-- Area: Kazham
-- NPC: Kakapp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

-- item IDs
            -- 483       Broken Mithran Fishing Rod
            -- 22        Workbench
            -- 1008      Ten of Coins
            -- 1157      Sands of Silence
            -- 1158      Wandering Bulb
            -- 904       Giant Fish Bones
            -- 4599      Blackened Toad
            -- 905       Wyvern Skull
            -- 1147      Ancient Salt
            -- 4600      Lucky Egg
         
function onTrade(player,npc,trade)
    local OpoOpoAndIStatus = player:getQuestStatus(OUTLANDS, THE_OPO_OPO_AND_I);
    local progress = player:getVar("OPO_OPO_PROGRESS");
    local failed = player:getVar("OPO_OPO_FAILED");
    local goodtrade = trade:hasItemQty(905,1);
    local badtrade = (trade:hasItemQty(483,1) or trade:hasItemQty(22,1) or trade:hasItemQty(1008,1) or trade:hasItemQty(1157,1) or trade:hasItemQty(1158,1) or trade:hasItemQty(4599,1) or trade:hasItemQty(904,1) or trade:hasItemQty(1147,1) or trade:hasItemQty(4600,1));

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if progress == 7 or failed == 8 then
            if goodtrade then
                player:startEvent(0x00E2);
            elseif badtrade then
                player:startEvent(0x00EC);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local OpoOpoAndIStatus = player:getQuestStatus(OUTLANDS, THE_OPO_OPO_AND_I);
    local progress = player:getVar("OPO_OPO_PROGRESS");
    local failed = player:getVar("OPO_OPO_FAILED");
    local retry = player:getVar("OPO_OPO_RETRY");
    
    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if retry >= 1 then                          -- has failed on future npc so disregard previous successful trade
            player:startEvent(0x00CC);
        elseif (progress == 7 or failed == 8) then
                player:startEvent(0x00D5);  -- asking for wyvern skull
        elseif (progress >= 8 or failed >= 9) then
            player:startEvent(0x00F9); -- happy with wyvern skull
        end
	else
        player:startEvent(0x00CC);
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

    if (csid == 0x00E2) then    -- correct trade, onto next opo
        if player:getVar("OPO_OPO_PROGRESS") == 7 then
            player:tradeComplete();
            player:setVar("OPO_OPO_PROGRESS",8);
            player:setVar("OPO_OPO_FAILED",0);
        else
            player:setVar("OPO_OPO_FAILED",9);
        end
    elseif (csid == 0x00EC) then              -- wrong trade, restart at first opo
        player:setVar("OPO_OPO_FAILED",1);
        player:setVar("OPO_OPO_RETRY",8);
    end
end;



