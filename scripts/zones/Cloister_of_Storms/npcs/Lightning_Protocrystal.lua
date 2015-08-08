-----------------------------------
-- Area: Cloister of Storms
-- NPC:  Lightning Protocrystal
-- Involved in Quests: Trial by Lightning
-- @pos 534.5 -13 492 202
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Storms/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Cloister_of_Storms/TextIDs");

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

	if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:getVar("ASA4_Violet") == 1) then
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
	--printf("onFinish CSID: %u",csid);
	--printf("onFinish RESULT: %u",option);

	if (csid==0x0002) then
		player:delKeyItem(DOMINAS_VIOLET_SEAL);
		player:addKeyItem(VIOLET_COUNTERSEAL);
		player:messageSpecial(KEYITEM_OBTAINED,VIOLET_COUNTERSEAL);
		player:setVar("ASA4_Violet","2");
	elseif (EventFinishBCNM(player,csid,option)) then
		return;
	end
end;