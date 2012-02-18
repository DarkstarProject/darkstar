-----------------------------------
--	Area: Windurst Woods
--	NPC:  Rakoh Buuma
--	Starts Windurst Missions
--	Working ???% 
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Woods/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- If the player is from Windurst
	if(player:getNation() == WINDURST) then
		-- Fetch our current rank
		player_cur_rank = player:getRank();
		
		-- [ Notes ]
		-- * Rank 1 missions start automatically when talked to guard
		-- * Anything higher requies rank points
		-- * cs0x72 (114) = Mission List (Used for Rank2 and up)
		-- * Rank Points bar = 4000 points (@4000 it's full)
		
		-- If our Rank is 1
		if(player_cur_rank == 1) then
			windy_1_1_completed = player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT);
			windy_1_2_completed = player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER);
			windy_1_3_completed = player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE);
			
			-- Check for all Rank 1 missions
			if(windy_1_1_completed == false) then
				-- If the player has started the mission or not
				if(player:getCurrentMission(WINDURST) ~= THE_HORUTOTO_RUINS_EXPERIMENT) then
					-- Mission has not been started yet
					player:startEvent(0x79);
				else
					-- Mission has been started, cannot accept more
					player:startEvent(0x7f);
				end
			elseif(windy_1_2_completed == false and windy_1_1_completed == true) then
				-- If the player has started the mission or not
				if(player:getCurrentMission(WINDURST) ~= THE_HEART_OF_THE_MATTER) then
					-- Mission has not been started yet
					player:startEvent(0x84);
				else
					-- Mission has been started, cannot accept more
					player:startEvent(0x88);
				end
			elseif(windy_1_3_completed == false and windy_1_1_completed == true and windy_1_2_completed == true) then
				-- Windurst 1-3
				-- If the player has started the mission or not
				if(player:getCurrentMission(WINDURST) ~= THE_PRICE_OF_PEACE) then
					-- Mission has not been started yet
					player:startEvent(0x95);
				else
					if(player:getVar("windurst_mission_1_3") == 4) then
						-- Play the cutscene of 1-3 being done
						player:startEvent(0x9a);
					else
						-- Mission has been started, cannot accept more
						player:startEvent(0x96);
					end
				end
			else
				printf( "Default: Error" );
			end
		elseif(player_cur_rank >= 2) then
			-- Rank2 Missions
			-- Get the Mission Mask
			flagMission, repeatMission = getMissionMask(player);
			-- Display the Mission List (if any)
			player:startEvent(0x72,flagMission,0,0,0,0,repeatMission);
			--
			-- Note: Make sure to check if the flagMission variable is not 
			-- the default one (meaning no missions available, if it is,
			-- trigger the alternative cs)
		end
		--[[elseif(player_cur_rank == 3) then
			-- More missions
			printf("Rank 3 Missions time!");
			--[Rank4, etc]
		end]]--
	else
		-- You're from another Nation
		player:startEvent(0x69);
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
	if(option == 1 and csid == 0x79) then
		-- Log who we started the mission from (to know which title we get)
		player:setVar("mission_started_from",1); -- Windurst Woods Guard
		-- Start Windurst 1-1
		player:setVar("windurst_mission_1_1",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT);
	elseif(option == 1 and csid == 0x84) then
		-- Start Windurst 1-2
		player:setVar("windurst_mission_1_2",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_HEART_OF_THE_MATTER);
	elseif(option == 2 and csid == 0x95) then
		-- Start Windurst 1-3
		player:setVar("windurst_mission_1_3",1);
		player:setVar("ohbiru_dohbiru_talk",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_PRICE_OF_PEACE);
	elseif(option == 0 and csid == 0x9a) then
		-- Windurst 1-3 Mission isover
		player:completeMission(WINDURST,THE_PRICE_OF_PEACE);
		-- Yay, rank 2!
		player:setRank(2);
		-- Set Rank Points back to 0
		player:setRankPoints(0);
		-- Add 2,000 gil as reward
		player:addGil(1000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_1_3",0);
		player:setVar("ohbiru_dohbiru_talk",0);
		player:setVar("food_offering_delivered",0);
		player:setVar("drink_offering_delivered",0);
		player:setVar("ghoo_talk",0);
		player:setVar("laa_talk",0);
	elseif(option == 3 and csid == 0x72) then
		-- Start Windurst 2-1
		player:addMission(WINDURST,LOST_FOR_WORDS);
		player:setVar("windurst_mission_2_1",1);
	elseif(option == 4 and csid == 0x72) then
		-- Start Windurst 2-2 (Repeatable)
		
	elseif(option == 5 and csid == 0x72) then
		-- Start Windurst 2-3
		player:addMission(WINDURST,THE_THREE_KINGDOMS);
		player:setVar("windurst_mission_2_3",1);
	end
end;




