-----------------------------------
--  Area: Jugner Forest
--  NPC:  qm2 (???)
--  Involved in Quest: Sin Hunting - RNG AF1
--  @pos -10.946,-1.000,313.810 104
-----------------------------------
package.loaded["scripts/zones/Jugner_Forest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Jugner_Forest/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
   
  	local SinHunting = player:getVar("sinHunting");	-- RNG AF1 
   
	if (SinHunting == 4 and IsMoonFull() == true) then
		player:startEvent(0x000d, 0, 1107);		
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

	if (csid == 0x000d) then
		player:setVar("sinHunting",5);
    end
end;