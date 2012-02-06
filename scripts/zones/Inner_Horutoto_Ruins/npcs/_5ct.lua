-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Magical Gizmo #5 (T out of P, Q, R, S, T, U)
--  Involved In Mission: The Horutoto Ruins Experiment
--	Working ???%
-----------------------------------

package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/titles");
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
	random_value = player:getVar("windurst_mission_1_1_rv");
	magical_gizmo_no = 5; -- of the 6
	
	-- Check if we are on Windurst Mission 1-1
	if(player:getCurrentMission(WINDURST) == THE_HORUTOTO_RUINS_EXPERIMENT) then
		windurst_mission_1_1 = player:getVar("windurst_mission_1_1");
		if(windurst_mission_1_1 == 3) then
			-- Check if we found the correct Magical Gizmo or not
			if( random_value == magical_gizmo_no ) then
				player:startEvent(0x38);
				-- Set the progress
				player:setVar("windurst_mission_1_1",4);
			else
				already_opened = player:getVar("windurst_mission_1_1_op5");
				if(already_opened == 2) then
					-- We've already examined this
					player:messageSpecial(EXAMINED_RECEPTACLE);
				else
					-- Opened the wrong one
					player:startEvent(0x39);
				end
			end
		else
			-- Nothing
		end
	else
		-- Nothing
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

	-- If we just finished the cutscene for Windurst Mission 1-1
	-- The cutscene that we opened the correct Magical Gizmo
	if(csid == 0x38) then
		-- Give the player the key item
		player:addKeyItem(CRACKED_MANA_ORBS);
		player:messageSpecial(KEYITEM_OBTAINED,CRACKED_MANA_ORBS);
		-- Delete the random value we created for the Magic Gizmo's
		player:setVar("windurst_mission_1_1_rv", 0);
	elseif(csid == 0x39) then
		-- Opened the wrong one
		player:setVar("windurst_mission_1_1_op5", 2);
		-- Give the message that thsi orb is not broken
		player:messageSpecial(NOT_BROKEN_ORB);
	end
end;




