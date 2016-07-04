-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Taumila
-- Starts and Finishes Quest: Tiger's Teeth (R)
-- @pos -140 -5 -8 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,TIGER_S_TEETH) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(884,3) and trade:getItemCount() == 3) then 
            player:startEvent(0x023c);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local tigersTeeth = player:getQuestStatus(SANDORIA,TIGER_S_TEETH);
    
    if (player:getFameLevel(SANDORIA) >= 3 and tigersTeeth == QUEST_AVAILABLE) then
        player:startEvent(0x023e);
    elseif (tigersTeeth == QUEST_ACCEPTED) then
        player:startEvent(0x023f);
    elseif (tigersTeeth == QUEST_COMPLETED) then
        player:startEvent(0x023d);
    else
        player:startEvent(0x023b);
    end
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x023e and option == 0) then
        player:addQuest(SANDORIA,TIGER_S_TEETH);
    elseif (csid == 0x023c) then
        player:tradeComplete();
        player:addTitle(FANG_FINDER);
        player:addGil(GIL_RATE*2100);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2100)
        if (player:getQuestStatus(SANDORIA,TIGER_S_TEETH) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,TIGER_S_TEETH);
        else
            player:addFame(SANDORIA,5);
        end
    end

end;