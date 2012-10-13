-----------------------------------
--  Area: Windurst Woods
--   NPC: Kopuro-Popuro
--  Type: Standard NPC
-- @zone: 241
--  @pos: -0.037 -4.749 -22.589
--
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
require("scripts/zones/Windurst_Woods/TextIDs");
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

allnew = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000);

   if (allnew == QUEST_ACCEPTED) then
      count = trade:getItemCount();
     if(trade:hasItemQty(856,1) and trade:hasItemQty(4368,1) and trade:hasItemQty(846,1) and count == 3) then
         player:startEvent(0x0124,GIL_RATE*200); -- Correct items given, complete quest.
      else
         player:startEvent(0x0120,0,856,846,4368); -- Incorrect or not enough items.
      end
   end
   
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

   allnew = player:getQuestStatus(WINDURST,THE_ALL_NEW_C_2000);

   if (allnew == QUEST_COMPLETED) then
      player:startEvent(0x0125); -- Post Quest Finish Text
   elseif (allnew == QUEST_ACCEPTED) then
      player:startEvent(0x0120,0,856,846,4368); -- Reminder Dialogue
   elseif (allnew == QUEST_AVAILABLE) then
      player:startEvent(0x011d,0,856,846,4368); -- Start Quest
   else
      player:startEvent(0x0114); -- No Quest Available
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

   if (csid == 0x011d and option ~= 2) then  -- option 2 is declining the quest for the second question
      player:addQuest(WINDURST,THE_ALL_NEW_C_2000);
   elseif (csid == 0x0124) then
      player:tradeComplete();
      player:addFame(WINDURST,WIN_FAME*80);
      player:addTitle(CARDIAN_TUTOR);
      player:addGil(GIL_RATE*200);
      player:completeQuest(WINDURST,THE_ALL_NEW_C_2000);
   end
   
end;