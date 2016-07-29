-----------------------------------
--  Area: Metalworks
--   NPC: Baldric
--  Type: Quest Giver
-- @zone: 237
--  @pos -50.858 1.777 -31.141
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings")
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(BASTOK,STARDUST) ~= QUEST_AVAILABLE) then
        if (trade:hasItemQty(503,1) and trade:getItemCount() == 1) then
            player:startEvent(0x022B);
        end
    end
            
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(BASTOK,STARDUST) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then
        player:startEvent(0x022A);    
    else
        player:startEvent(0x0228);
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
    
    if (csid == 0x022A) then
        player:addQuest(BASTOK,STARDUST);
    elseif (csid == 0x022B) then
        player:tradeComplete();
        player:addGil(300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*300);
        player:completeQuest(BASTOK,STARDUST);
    end
end;

