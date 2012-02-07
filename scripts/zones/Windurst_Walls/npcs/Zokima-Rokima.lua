-----------------------------------
--	Area: Windurst Walls
--	NPC:  Zokima-Rokima
--	Starts Windurst Missions
--	Working ???% 
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

-- 0x5b = Cannot accept more missions
-- 0x57 = Not from Windurst, show direction where to get the map
-- 0x5d = Select Mission + prompt
-- 0x60 = Starts Mission 1-1-- 0x63 = More info on Mission 1-1 (started mission, but talking to guard while on the mission)


function onTrigger(player,npc)
	-- If the player is from Windurst
	if(player:getNation() == WINDURST) then
		-- Fetch our current rank
		player_cur_rank = player:getRank();
		
		-- [ Notes ]
		-- * Rank 1 missions start automatically when talked to guard
		-- * Anything higher requies rank points
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
					player:startEvent(0x60);
				else
					-- Mission has been started, cannot accept more
					player:startEvent(0x64);
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
				-- Windurst 1-3 (final mission of this rank)
				-- If the player has started the mission or not
				if(player:getCurrentMission(WINDURST) ~= THE_PRICE_OF_PEACE) then
					-- Mission has not been started yet
					player:startEvent(0x6f);
				else
					if(player:getVar("windurst_mission_1_3") == 4) then
						-- Play the cutscene of 1-3 being done
						player:startEvent(0x74);
					else
						-- Mission has been started, cannot accept more
						player:startEvent(0x70);
					end
				end
			else
				printf( "Default: Error" );
			end
		elseif(player_cur_rank == 2) then
			--printf("Rank 2 Missions time!");
		elseif(player_cur_rank == 3) then
			--printf("Rank 3 Missions time!");
		--[Rank4, etc]
		end
	else
		-- You're from another Nation
		player:startEvent(0x57);
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
	if(option == 1 and csid == 0x60) then
		-- Log who we started the mission from (to know which title we get)
		player:setVar("mission_started_from",4); -- Windurst Walls Guard
		-- Start Windurst 1-1
		player:setVar("windurst_mission_1_1",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT);
	elseif(option == 1 and csid == 0x84) then
		-- Start Windurst 1-2
		player:setVar("windurst_mission_1_2",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_HEART_OF_THE_MATTER);
	elseif(option == 2 and csid == 0x6f) then
		-- Start Windurst 1-3
		player:setVar("windurst_mission_1_3",1);
		player:setVar("ohbiru_dohbiru_talk",1);
		-- Add the Mission to the Mission Log
		player:addMission(WINDURST,THE_PRICE_OF_PEACE);
	elseif(option == 0 and csid == 0x74) then
		-- Windurst 1-3 Mission isover
		player:completeMission(WINDURST,THE_PRICE_OF_PEACE);
		-- Yay, rank 2!
		player:setRank(2);
		-- Set Rank Points back to 0
		player:setRankPoints(0);
		-- Add 2,000 gil as reward
		player:addGil(2000);
		-- Remove all variables set for this mission
		player:setVar("windurst_mission_1_3",0);
		player:setVar("ohbiru_dohbiru_talk",0);
		player:setVar("food_offering_delivered",0);
		player:setVar("drink_offering_delivered",0);
		player:setVar("ghoo_talk",0);
		player:setVar("laa_talk",0);
	end
end;




