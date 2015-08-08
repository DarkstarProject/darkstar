-----------------------------------
--  Area: Batallia Downs
--  NPC: qm4 (???)
--  
-----------------------------------
package.loaded["scripts/zones/Batallia_Downs/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	if (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 5) then	
	 player:startEvent(0x0000);
	elseif (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Tenzen_s_Path") == 6 and player:hasKeyItem(DELKFUTT_RECOGNITION_DEVICE) == false) then	
	 player:addKeyItem(DELKFUTT_RECOGNITION_DEVICE);
	 player:messageSpecial(KEYITEM_OBTAINED,DELKFUTT_RECOGNITION_DEVICE);
	end

end;

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
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
   if (csid == 0x0000) then
       player:setVar("COP_Tenzen_s_Path",6);
   end
end;