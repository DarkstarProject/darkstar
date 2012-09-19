-----------------------------------
-- Area: Cloister of Tides
-- NPC:  Water Protocrystal
-- Involved in Quests: Trial by Water, Trial Size Trial by Water
-- @zone 560 36 560 211
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Cloister_of_Tides/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(TradeBCNM(player,player:getZone(),trade,npc))then
		return;
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(EventTriggerBCNM(player,npc))then
		return;
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if(EventUpdateBCNM(player,csid,option))then
		return;
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(EventFinishBCNM(player,csid,option))then
		return;
	end
	
end;