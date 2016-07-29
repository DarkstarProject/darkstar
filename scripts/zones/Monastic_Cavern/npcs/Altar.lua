-----------------------------------
-- Area: Monastic Cavern
-- NPC:  Altar
-- Involved in Quests: The Circle of Time
-- @pos 109 -3 -145 150
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Monastic_Cavern/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   local circleOfTime = player:getQuestStatus(JEUNO,THE_CIRCLE_OF_TIME);

   if (circleOfTime == QUEST_ACCEPTED and player:getVar("circleTime") >= 7) then
       if (player:hasKeyItem(STAR_RING1) and player:hasKeyItem(MOON_RING)) then
           if (player:getVar("circleTime") == 7) then
               SpawnMob(17391804,180):updateClaim(player); -- Spawn bugaboo
           elseif (player:getVar("circleTime") == 8) then
               player:startEvent(0x03); -- Show final CS  
           end  
       end
     else
        player:messageSpecial(ALTAR)     
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

   if (csid == 0x03) then
       player:setVar("circleTime",9); -- After bugaboo is killed, and final CS shows up
       player:delKeyItem(MOON_RING);
       player:delKeyItem(STAR_RING1);
   end
end;