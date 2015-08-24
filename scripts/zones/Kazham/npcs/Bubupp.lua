-----------------------------------
-- Area: Kazham
-- NPC: Bubupp
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
    local goodtrade = trade:hasItemQty(904,1);
    local badtrade = (trade:hasItemQty(483,1) or trade:hasItemQty(22,1) or trade:hasItemQty(1008,1) or trade:hasItemQty(1157,1) or trade:hasItemQty(1158,1) or trade:hasItemQty(4599,1) or trade:hasItemQty(905,1) or trade:hasItemQty(1147,1) or trade:hasItemQty(4600,1));

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if progress == 5 or failed == 6 then
            if goodtrade then
                player:startEvent(0x00E0);
            elseif badtrade then
                player:startEvent(0x00EA);
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
            player:startEvent(0x00CA);
        elseif (progress == 5 or failed == 6) then
                player:startEvent(0x00D3);  -- asking for giant fish bones
        elseif (progress >= 6 or failed >= 7) then
            player:startEvent(0x00F7); -- happy with giant fish bones
        end
	else
        player:startEvent(0x00CA);
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

    if (csid == 0x00E0) then    -- correct trade, onto next opo
        if player:getVar("OPO_OPO_PROGRESS") == 5 then
            player:tradeComplete();
            player:setVar("OPO_OPO_PROGRESS",6);
            player:setVar("OPO_OPO_FAILED",0);
        else
            player:setVar("OPO_OPO_FAILED",7);
        end
    elseif (csid == 0x00EA) then              -- wrong trade, restart at first opo
        player:setVar("OPO_OPO_FAILED",1);
        player:setVar("OPO_OPO_RETRY",6);
    end
end;



