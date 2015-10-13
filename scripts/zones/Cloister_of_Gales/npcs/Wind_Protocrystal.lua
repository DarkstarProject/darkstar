-----------------------------------
-- Area: Cloister of Gales
-- NPC:  Wind Protocrystal
-- Involved in Quests: Trial by Wind, Trial Size Trial By Wind
-- @zone -361 1 -381 201
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Gales/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/zones/Cloister_of_Gales/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
		return;
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Emerald") == 1) then
		player:startEvent(0x0002);
	elseif (EventTriggerBCNM(player,npc)) then
		return;
	else
		player:messageSpecial(PROTOCRYSTAL);					
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if (EventUpdateBCNM(player,csid,option)) then
		return;
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	--printf("onFinish CSID: %u",csid);
	--printf("onFinish RESULT: %u",option);
	
	if (csid==0x0002) then
		player:delKeyItem(DOMINAS_EMERALD_SEAL);
		player:addKeyItem(EMERALD_COUNTERSEAL);
		player:messageSpecial(KEYITEM_OBTAINED,EMERALD_COUNTERSEAL);
		player:setVar("ASA4_Emerald","2");
	elseif (EventFinishBCNM(player,csid,option)) then
		return;
	end
	
end;