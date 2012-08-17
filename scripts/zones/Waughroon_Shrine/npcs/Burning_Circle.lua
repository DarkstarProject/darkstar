-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Burning Circle
-- Waughroon Shrine Burning Circle
-- @pos -345 104 -260 144
-------------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Waughroon_Shrine/TextIDs");

	---- 0: Rank 2 Final Mission for Bastok "The Emissary" and Sandy "Journey Abroad"
	---- 1: Worms Turn
	---- 2: Grimshell Shocktroopers
	---- 3: On my Way
	---- 4: Thief in Norg
	---- 5: 3, 2, 1
	---- 6: Shattering Stars (RDM)
	---- 7: Shattering Stars (THF)
	---- 8: Shattering Stars (BST)
	---- 9: 
	---- 10: 
	---- 11: 
	---- 12: 
	---- 13: 
	---- 14: 
	---- 15: 
	---- 16: 
	---- 17: 

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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if(EventFinishBCNM(player,csid,option))then
		return;
	end
	
end;