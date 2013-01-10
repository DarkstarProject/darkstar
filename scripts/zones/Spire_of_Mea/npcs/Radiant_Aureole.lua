-----------------------------------
-- Area: Spire_of_Mea
-- NPC:  Radian Aureole

-----------------------------------
package.loaded["scripts/zones/Spire_of_Mea/TextIDs"] = nil;

-----------------------------------

require("scripts/zones/Spire_of_Mea/TextIDs");


function onTrade(player,npc,trade)
	

	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:startEvent(0x000E)
	
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
	if (csid==0x000E and option==1)then
	player:setPos(179 ,35 ,256 ,63 ,117 );
	end

	
end;