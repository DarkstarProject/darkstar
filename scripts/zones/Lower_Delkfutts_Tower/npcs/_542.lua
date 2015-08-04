-----------------------------------
-- Area: Lower Delkfutt's Tower
-- NPC:  Cermet Door
-- Cermet Door for Basty Ambassador  
-- Bastok Mission 3.3 "Appointment to Jeuno"
-- @pos 596 16 -19 184
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getCurrentMission(BASTOK) == JEUNO_MISSION and player:getVar("MissionStatus") == 2) then
		if (trade:hasItemQty(549,1) and trade:getItemCount() == 1) then -- Trade Delkfutt Key
			player:startEvent(0x0001);
		end
	end
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local currentMission = player:getCurrentMission(BASTOK);
	
	if (currentMission == JEUNO_MISSION and player:getVar("MissionStatus") == 2 and player:hasKeyItem(DELKFUTT_KEY) == false) then
		player:messageSpecial(THE_DOOR_IS_FIRMLY_SHUT_OPEN_KEY);
	elseif (currentMission == JEUNO_MISSION and player:getVar("MissionStatus") == 2 and player:hasKeyItem(DELKFUTT_KEY)) then
		player:startEvent(0x0001);
	else
		player:messageSpecial(DOOR_FIRMLY_SHUT);
	end
	
	return 1;

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
--print("CSID:",csid);
--print("RESULT:",option);

	if (csid == 0x0001) then
		if (player:hasKeyItem(DELKFUTT_KEY) == false) then
			player:tradeComplete();
			player:addKeyItem(DELKFUTT_KEY);
			player:messageSpecial(KEYITEM_OBTAINED,DELKFUTT_KEY);
		end
		player:setVar("MissionStatus",3);
	end

end;