-----------------------------------
-- Area: Giddeus
-- NPC: Uu Zhoumo
-- Involved in Mission 2-3
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	count = trade:getItemCount();
	gil = trade:getGil();

	if (trade:hasItemQty(ASPIR_KNIFE,1) and count == 1 and gil == 0) then
		player:startEvent(0x0029);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	pNation = player:getNation();
	missionActive = player:hasCurrentMission(pNation);

	if (missionActive) then
		if (player:hasKeyItem(DULL_SWORD)) then
			player:startEvent(0x0028);
		elseif (player:hasKeyItem(SHIELD_OFFERING)) then
			player:startEvent(0x002a);
		elseif (player:getCurrentMission(1) == 7 and player:getVar("MissionStatus") == 13) then
			player:startEvent(0x002b);
		else
			player:startEvent(0x002c);
		end
	else
		player:startEvent(0x002c);
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

	if (csid == 0x0028) then
		player:setVar("MissionStatus",13);
		player:delKeyItem(DULL_SWORD);
	elseif (csid == 0x0029) then
		player:tradeComplete();
		player:setVar("MissionStatus",14);
	elseif (csid == 0x002a) then
		player:setVar("MissionStatus",12);
		player:delKeyItem(SHIELD_OFFERING);
	end
end;



