-----------------------------------
-- Area: Giddeus
-- NPC:  Uu Zhoumo
-- Involved in Mission 2-3
-- @pos -179 16 155 145
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getCurrentMission(BASTOK) == THE_EMISSARY_WINDURST and player:getVar("MissionStatus") == 5 and trade:hasItemQty(16509,1) and trade:getItemCount() == 1) then -- Trade Aspir Knife
		player:startEvent(0x0029);
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local pNation = player:getNation();
	local currentMission = player:getCurrentMission(pNation);
	local MissionStatus = player:getVar("MissionStatus");
	
	if(pNation == (SANDORIA))then
		if(currentMission == JOURNEY_TO_WINDURST and player:hasKeyItem(SHIELD_OFFERING)) then
			player:startEvent(0x002a);
		end
	elseif(pNation == (BASTOK)) then
		if(currentMission == THE_EMISSARY_WINDURST and MissionStatus == 4 and player:hasKeyItem(DULL_SWORD)) then
			player:startEvent(0x0028);
		elseif(currentMission == THE_EMISSARY_WINDURST and MissionStatus == 5) then
			player:startEvent(0x002b);
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

	if(csid == 0x0028) then
		player:setVar("MissionStatus",5);
		player:delKeyItem(DULL_SWORD);
	elseif(csid == 0x0029) then
		player:tradeComplete();
		player:setVar("MissionStatus",6);
	elseif(csid == 0x002a) then
		player:setVar("MissionStatus",6);
		player:delKeyItem(SHIELD_OFFERING);
	end
end;



