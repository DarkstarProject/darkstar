-----------------------------------
-- Area: Cloister of Storms
-- NPC:  Lightning Protocrystal
-- Involved in Quests: Trial by Lightning
-- @zone 202
-- @pos 534.5 -13 492
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Storms/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Cloister_of_Storms/TextIDs");

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