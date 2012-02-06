--[[

----------------------------------
-- Old file, the content as well
-- as the old code was moved to
-- missions.lua
----------------------------------

function rankPointMath(rank)
	return 0.372*rank^2 - 1.62*rank + 6.2;
end
----------------------------------------------------
-- returns true if you have enough rank points to undertake the mission, for any of the 3 nations.
----------------------------------------------------
function getMissionRankPoints(player, missionID)
	if (missionID == 3) then                   	-- mission 2.1
		crystals = 9;
	elseif (missionID == 4) then                -- mission 2.2
		crystals = 17;
	elseif (missionID == 5) then                -- mission 2.3
		crystals = 42;
	elseif (missionID == 10) then               -- mission 3.1
		crystals = 12;														-- 1 stack needed to unlock
	elseif (missionID == 11) then               -- mission 3.2
		crystals = 30;														-- 2.5 stacks needed to unlock (2 stacks of crystals + 3.1 rank points corresponding to half a stack)
	elseif (missionID == 12) then               -- mission 3.3
		crystals = 48;														-- 4 stacks to unlock (3.5 stacks + 3.1 rank points corresponding to half a stack)
	elseif (missionID == 13) then               -- Magicite mission
		crystals = 36;														-- 3 stacks to unlock
																							-- 5.1 starts directly after Magicite, no crystals needed
	elseif (missionID == 15) then               -- mission 5.2 (shadow lord fight)
		crystals = 44;														-- Mission unlocks at 50% rank bar ~= 44 crystals using the present formula.

	elseif (missionID == 16) then               -- mission 6.1
		crystals = 36;														-- 3 stacks to unlock
	elseif (missionID == 17) then               -- mission 6.2
		crystals = 93;														-- 3 additional stacks to unlock + 3 original stacks + 21 from mission 6.1

	elseif (missionID == 18) then               -- mission 7.1
		crystals = 45;														-- 45 needed, from http://wiki.ffxiclopedia.org/wiki/The_Final_Image
																							-- (http://wiki.ffxiclopedia.org/wiki/Prestige_of_the_Papsque says 47 though)
	elseif (missionID == 19) then               -- mission 7.2
		crystals = 119;														-- 4 additional stacks needed, plus mission reward of 26

	elseif (missionID == 20) then               -- mission 8.1
		crystals = 57;														-- 4 3/4 stacks needed
	elseif (missionID == 21) then               -- mission 8.2
		crystals = 148;														-- 5 additional stacks needed, plus mission reward of 31,

	elseif (missionID == 22) then               -- mission 9.1
		crystals = 96;														-- 8 stacks needed (higher value chosen so final rank bar requirement is closer to 90%)
	elseif (missionID == 23) then               -- mission 9.2
		crystals = 228;														-- Additional 8 stacks needed, plus mission reward of 36 (87% rank bar)
	end;

	points_needed = 1024 * (crystals-.25) / (3*rankPointMath(player:getRank()));
	--printf("Got [%d/%d] for Mission with ID: %d", player:getRankPoints(), points_needed, missionID);
	if(player:getRankPoints() >= points_needed) then
		return 1;
	else
		return 0;
	end
	
	--return (true);
end;


function getMissionMask(player)
	rank = player:getRank()
	nation = player:getNation();  -- 0 = San d'Oria ; 1 = Bastok ; 2 = Windurst
	mission_status =  player:getCurrentMission(nation);

	first_mission = 0;
	repeat_mission = 0;

	--[[if (player:hasCompletedMission(nation,2) == 1) and (nation ~= 2) then
		repeat_mission = repeat_mission + 4;									-- 1.3 repeatable anywhere but Windurst
	end

	if (player:hasCompletedMission(nation,4) == 1) then
		repeat_mission = repeat_mission + 16;									-- 2.2
	end

	if (player:hasCompletedMission(nation,11) == 1) then
		repeat_mission = repeat_mission + 2048;									-- 3.2
	end

	if (nation == 0) and (player:hasCompletedMission(nation,0) == 1) then      -- 1.1 repeatable in San d'Oria
		repeat_mission = repeat_mission + 1;
	end

	if (nation == 0) and (player:hasCompletedMission(nation,1) == 1) then      -- 1.2 repeatable in San d'Oria
		repeat_mission = repeat_mission + 2;
	end

	if (nation == 0) and (player:hasCompletedMission(nation,10) == 1) then      -- 3.1 repeatable in San d'Oria
		repeat_mission = repeat_mission + 1024;
	end

	----------------- skippable missions (2-2 and 3-2), first completion.

	if (player:hasCompletedMission(nation,3) == 1) and (player:hasCompletedMission(nation,4) == 0) then
		if ((rank == 2) and getMissionRankPoints(player, 4)) or (rank > 2) then
		  first_mission = first_mission + 16;
		end
	end

	if (player:hasCompletedMission(nation,10) == 1) and (player:hasCompletedMission(nation,11) == 0) then
		if ((rank == 3) and getMissionRankPoints(player, 11)) or (rank > 3) then
			first_mission = first_mission + 2048;
	  end
	end
	----------------- non repeatable missions now ------------------------

	if (rank == 1) then
		if (player:hasCompletedMission(nation,0) == 1) and (player:hasCompletedMission(nation,1) == 0) then
			first_mission = first_mission + 2;
		elseif (player:hasCompletedMission(nation,1) == 1) and (player:hasCompletedMission(nation,2) == 0) then
			first_mission = first_mission + 4;
		end;
	elseif (rank == 2) then
		if ((player:hasCompletedMission(nation,3) == 0) and getMissionRankPoints(player, 3)) then
			first_mission = first_mission + 8;
		elseif (player:hasCompletedMission(nation,3) == 1) and getMissionRankPoints(player, 5) then
		  first_mission = first_mission + 32;
	  end;
	elseif (rank == 3) then
		if (player:hasCompletedMission(nation,10) == 0) and getMissionRankPoints(player, 10) then
			first_mission = first_mission + 1024;
		elseif (player:hasCompletedMission(nation,10) == 1) and getMissionRankPoints(player, 12) then
			first_mission = first_mission + 4096;
		end
	elseif (rank == 5) and (player:hasCompletedMission(nation,14) == 0) and (mission_status == 0) then -- mission 5.1 start is special
	  first_mission = first_mission +16384

	elseif (rank == 5) and (player:hasCompletedMission(nation,14) == 1) and getMissionRankPoints(player, 15) then
		first_mission = first_mission + 32768;

	elseif (rank == 6) then
	  if (player:getMissionStatus(nation,16) == 0) and getMissionRankPoints(player, 16) then -- 6.1
		first_mission = first_mission + 65536;
	  elseif (player:getMissionStatus(nation,16) == 2) and getMissionRankPoints(player, 17) then --
		first_mission = first_mission + 131072;
	  end

	elseif (rank == 7) then
		if (player:getMissionStatus(nation,18) == 0) and getMissionRankPoints(player, 18) then -- 7.1
			first_mission = first_mission + 262144;
		elseif (player:getMissionStatus(nation,18) == 2) and getMissionRankPoints(player, 19) then -- 7.2
			first_mission = first_mission + 524288;
		end;

	elseif (rank == 8) then
		if (player:getMissionStatus(nation,20) == 0) and getMissionRankPoints(player, 20) then -- 8.1
			first_mission = first_mission + 1048576;
		elseif (player:getMissionStatus(nation,20) == 2) and getMissionRankPoints(player, 21) then -- 8.2
			first_mission = first_mission + 2097152;
		end

	elseif (rank == 9) then
		if (player:getMissionStatus(nation,22) == 0) and getMissionRankPoints(player, 22) then -- 9.1
			first_mission = first_mission + 4194304;
		elseif (player:getMissionStatus(nation,22) == 2) and getMissionRankPoints(player, 23) then -- 9.2
			first_mission = first_mission + 8388608;
		end
	end--]]

	mission_mask = 2147483647 - repeat_mission - first_mission; -- 2^31 -1 - ..
	return mission_mask,repeat_mission;
end;
]]--