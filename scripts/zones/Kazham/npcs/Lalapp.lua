-----------------------------------
-- Area: Kazham
-- NPC: Lalapp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");
require("scripts/globals/pathfind");

local path = {
-63.243702, -11.000023, -97.916130,
-63.970551, -11.000027, -97.229286,
-64.771614, -11.000030, -96.499062
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

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
    local goodtrade = trade:hasItemQty(1147,1);
    local badtrade = (trade:hasItemQty(483,1) or trade:hasItemQty(22,1) or trade:hasItemQty(1157,1) or trade:hasItemQty(1158,1) or trade:hasItemQty(904,1) or trade:hasItemQty(1008,1) or trade:hasItemQty(905,1) or trade:hasItemQty(4599,1) or trade:hasItemQty(4600,1));

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if progress == 8 or failed == 9 then
            if goodtrade then
                player:startEvent(0x00E3);
            elseif badtrade then
                player:startEvent(0x00ED);
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
            player:startEvent(0x00CD);
            npc:wait(-1);
        elseif (progress == 8 or failed == 9) then
                player:startEvent(0x00D6);  -- asking for ancient salt
        elseif (progress >= 9 or failed >= 10) then
            player:startEvent(0x00FA); -- happy with ancient salt
        end
    else
        player:startEvent(0x00CD);
        npc:wait(-1);
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

function onEventFinish(player,csid,option,npc)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x00E3) then    -- correct trade, onto next opo
        if player:getVar("OPO_OPO_PROGRESS") == 8 then
            player:tradeComplete();
            player:setVar("OPO_OPO_PROGRESS",9);
            player:setVar("OPO_OPO_FAILED",0);
        else
            player:setVar("OPO_OPO_FAILED",10);
        end
    elseif (csid == 0x00ED) then              -- wrong trade, restart at first opo
        player:setVar("OPO_OPO_FAILED",1);
        player:setVar("OPO_OPO_RETRY",9);
    else
        npc:wait(0);
    end
end;



