-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  _5cq (Magical Gizmo) #2 
--  Involved In Mission: The Horutoto Ruins Experiment
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- The Magical Gizmo Number, this number will be compared to the random
	-- value created by the mission The Horutoto Ruins Experiment, when you
	-- reach the Gizmo Door and have the cutscene
	local magical_gizmo_no = 2; -- of the 6
	
	-- Check if we are on Windurst Mission 1-1
	if (player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT and player:getVar("MissionStatus") == 2) then
		-- Check if we found the correct Magical Gizmo or not
		if (player:getVar("MissionStatus_rv") == magical_gizmo_no) then
			player:startEvent(0x0032);
		else
			if (player:getVar("MissionStatus_op2") == 2) then
				-- We've already examined this
				player:messageSpecial(EXAMINED_RECEPTACLE);
			else
				-- Opened the wrong one
				player:startEvent(0x0033);
			end
		end
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	-- If we just finished the cutscene for Windurst Mission 1-1
	-- The cutscene that we opened the correct Magical Gizmo
	if (csid == 0x0032) then
		player:setVar("MissionStatus",3);
		player:setVar("MissionStatus_rv", 0);
		player:addKeyItem(CRACKED_MANA_ORBS);
		player:messageSpecial(KEYITEM_OBTAINED,CRACKED_MANA_ORBS);
	elseif (csid == 0x0033) then
		-- Opened the wrong one
		player:setVar("MissionStatus_op2", 2);
		-- Give the message that thsi orb is not broken
		player:messageSpecial(NOT_BROKEN_ORB);
	end
	
end;