-----------------------------------
-- Area: Selbina
-- NPC:  Mathilde
-- Involved in Quest: Riding on the Clouds
-- @pos 12.578 -8.287 -7.576 248
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_3") == 1) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_3",0);
            player:tradeComplete();
            player:addKeyItem(SOMBER_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SOMBER_STONE);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) ==MORE_QUESTIONS_THAN_ANSWERS and player:getVar("PromathiaStatus")==2) then
        player:startEvent(0x2715);
    else
        player:startEvent(0x00ab);
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
   if (csid == 0x2715) then
      player:setVar("PromathiaStatus",0);
      player:completeMission(COP,MORE_QUESTIONS_THAN_ANSWERS);
      player:addMission(COP,ONE_TO_BE_FEARED);
   end
end;