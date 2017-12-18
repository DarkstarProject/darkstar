-----------------------------------
-- Area: Bastok Mines
-- NPC: Gerbaum
-- Starts & Finishes Repeatable Quest: Minesweeper (100%)
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();
ZeruhnSoot = trade:hasItemQty(560,3);

    if (ZeruhnSoot == true and count == 3) then
        MineSweep = player:getQuestStatus(BASTOK,MINESWEEPER);
        if (MineSweep >= 1) then
            player:tradeComplete();
            player:startEvent(109);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

MineSweep = player:getQuestStatus(BASTOK,MINESWEEPER);

    if (MineSweep == 0) then
        player:startEvent(108);
    else
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(22);
        else
            player:startEvent(23);
        end
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

MineSweep = player:getQuestStatus(BASTOK,MINESWEEPER);

    if (csid == 108) then
        if (MineSweep == 0) then
            player:addQuest(BASTOK,MINESWEEPER);            
        end            
    elseif (csid == 109) then
        if (MineSweep == 1) then
            player:completeQuest(BASTOK,MINESWEEPER);
            player:addFame(BASTOK,75);
            player:addTitle(ZERUHN_SWEEPER);
        else
            player:addFame(BASTOK,8);
        end
        player:addGil(GIL_RATE*150);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*150);
    end

end;


