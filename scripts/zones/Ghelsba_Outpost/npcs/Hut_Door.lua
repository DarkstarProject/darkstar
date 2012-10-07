-----------------------------------
-- Area: Ghelsba_Outpost
-- NPC:  Hut Door
-------------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

	---- 0: 
	---- 1: 
	---- 2: 
	---- 3: 
	---- 4: 
	---- 5: 
	---- 6: 



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