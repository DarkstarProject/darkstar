-----------------------------------
-- Area: Kazham
-- NPC: Nenepp
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
require("scripts/zones/Kazham/TextIDs");
require("scripts/globals/pathfind");

local path = {
29.014000, -11.00000, -183.884000,
31.023000, -11.00000, -183.538000,
33.091000, -11.00000, -183.738000
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
    local goodtrade = trade:hasItemQty(4600,1);
    local badtrade = (trade:hasItemQty(483,1) or trade:hasItemQty(22,1) or trade:hasItemQty(1157,1) or trade:hasItemQty(1158,1) or trade:hasItemQty(904,1) or trade:hasItemQty(1008,1) or trade:hasItemQty(905,1) or trade:hasItemQty(4599,1) or trade:hasItemQty(1147,1));

    if (OpoOpoAndIStatus == QUEST_ACCEPTED) then
        if progress == 9 or failed == 10 then
            if goodtrade then
                player:startEvent(0x00F1);
            elseif badtrade then
                player:startEvent(0x00EE);
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
            player:startEvent(0x00CE);
            npc:wait(-1);
        elseif (progress == 9 or failed == 10) then
                player:startEvent(0x00D4);  -- asking for lucky egg
        elseif (progress >= 10 or failed >= 11) then
            player:startEvent(0x00FA); -- happy with lucky egg
        end
	else
        player:startEvent(0x00CE);
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

    if (csid == 0x00F1) then    -- correct trade, finished quest and receive opo opo crown and 3 pamamas
        local FreeSlots = player:getFreeSlotsCount();
        if (FreeSlots >= 4) then
            player:tradeComplete();
            player:addFame(KAZHAM, WIN_FAME*75);
            player:completeQuest(OUTLANDS, THE_OPO_OPO_AND_I);
            player:addItem(13870);   -- opo opo crown
            player:messageSpecial(ITEM_OBTAINED,13870);
            player:addItem(4468,3);  -- 3 pamamas
            player:messageSpecial(ITEM_OBTAINED,4468,3);
            player:setVar("OPO_OPO_PROGRESS",0);
            player:setVar("OPO_OPO_FAILED", 0);
            player:setVar("OPO_OPO_RETRY", 0);
            player:setTitle(257);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
        end
    elseif (csid == 0x00EE) then              -- wrong trade, restart at first opo
        player:setVar("OPO_OPO_FAILED",1);
        player:setVar("OPO_OPO_RETRY",10);
    else
        npc:wait(0);
    end
end;



