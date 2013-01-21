
-----------------------------------
-- Area: Monarch_Linn
-- NPC:  spatial displacement
-- @pos -35 -1 -539 31
-----------------------------------
package.loaded["scripts/zones/Monarch_LinnTextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Monarch_Linn/TextIDs");

-----------------------------------
-- onTrade
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

	local npcid = npc:getID();
	--printf("npcid : %u",npcid);
	
	if(npcid == 16904288 or npcid == 16904293) then
		player:setPos(-507,-8,-384,88,30);
	elseif(npcid == 16904292 or npcid == 16904291 or npcid == 16904290)then
		player:startEvent(0x7d03);  -- leave the battlefield
	elseif(EventTriggerBCNM(player,npc))then  -- enter the battlefield
		return 1;
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