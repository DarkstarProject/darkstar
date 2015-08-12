-----------------------------------
-- Area: Spire of Vahzl
-- NPC:  Radiant Aureole
-----------------------------------
package.loaded["scripts/zones/Spire_of_Vahzl/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Spire_of_Vahzl/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x000F)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if (csid == 0x000F and option == 1) then
		player:setPos(-379.947, 48.045, 334.059, 192, 9); -- To Pso'Xja {R}
	end
	
end;