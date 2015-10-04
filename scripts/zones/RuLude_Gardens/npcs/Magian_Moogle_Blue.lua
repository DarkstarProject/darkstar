-----------------------------------
-- Area: Ru'Lude Gardens
-- NPC:  MagianMoogle
-- Type: Standard NPC
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/RuLude_Gardens/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------



-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   player:startEvent(0x278D);
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

   if (csid == 0x278D and option == 1002) then
      player:tradeComplete();
      player:addItem(objecttrade);
      player:messageSpecial(ITEM_OBTAINED,objecttrade);
      
      
   end
end;		 