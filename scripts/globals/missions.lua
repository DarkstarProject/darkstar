-----------------------------------
--  Areas ID
-----------------------------------

SANDORIA = 0;
BASTOK   = 1;
WINDURST = 2;
ZILART   = 3;
TOAU     = 4;
WOTG     = 5;
COP      = 6;
ASSAULT  = 7;
CAMPAIGN = 8;
ACP      = 9;

-----------------------------------
--  San d'Oria
-----------------------------------

SMASH_THE_ORCISH_SCOUTS = 0;
BAT_HUNT                = 1;
SAVE_THE_CHILDREN       = 2;
THE_RESCUE_DRILL        = 3;
THE_DAVOI_REPORT        = 4;
JOURNEY_ABROAD          = 5;
JOURNEY_TO_BASTOK       = 6; -- Sand
JOURNEY_TO_WINDURST     = 7; -- Offering
JOURNEY_TO_BASTOK2      = 8; -- Monster
JOURNEY_TO_WINDURST2    = 9; -- Monster
INFILTRATE_DAVOI        = 10;
THE_CRYSTAL_SPRING      = 11;
APPOINTMENT_TO_JEUNO    = 12;
MAGICITE_SAN_D_ORIA     = 13;
THE_RUINS_OF_FEI_YIN    = 14;
THE_SHADOW_LORD         = 15;
LEAUTE_S_LAST_WISHES    = 16;
RANPERRE_S_FINAL_REST   = 17;
PRESTIGE_OF_THE_PAPSQUE = 18;
THE_SECRET_WEAPON       = 19;
COMING_OF_AGE           = 20;
LIGHTBRINGER            = 21;
BREAKING_BARRIERS       = 22;
THE_HEIR_TO_THE_LIGHT   = 23;

-----------------------------------
--  Bastok
-----------------------------------

THE_ZERUHN_REPORT         = 0;
GEOLOGICAL_SURVEY         = 1;
FETICHISM                 = 2;
THE_CRYSTAL_LINE          = 3;
WADING_BEASTS             = 4;
THE_EMISSARY              = 5;
THE_EMISSARY_SANDORIA     = 6;
THE_EMISSARY_WINDURST     = 7;
THE_EMISSARY_SANDORIA     = 8;
THE_EMISSARY_WINDURST     = 9;
THE_FOUR_MUSKETEERS       = 10;
TO_THE_FORSAKEN_MINES     = 11;
JEUNO_MISSION             = 12;
MAGICITE_BASTOK           = 13;
DARKNESS_RISING           = 14;
XARCABARD_LAND_OF_TRUTHS  = 15;
RETURN_OF_THE_TALEKEEPER  = 16;
THE_PIRATE_S_COVE         = 17;
THE_FINAL_IMAGE           = 18;
ON_MY_WAY                 = 19;
THE_CHAINS_THAT_BIND_US   = 20;
ENTER_THE_TALEKEEPER      = 21;
THE_SALT_OF_THE_EARTH     = 22;
WHERE_TWO_PATHS_CONVERGE  = 23;

-----------------------------------
--  Windurst
-----------------------------------

THE_HORUTOTO_RUINS_EXPERIMENT = 0;
THE_HEART_OF_THE_MATTER       = 1;
THE_PRICE_OF_PEACE            = 2;
LOST_FOR_WORDS                = 3;
A_TESTING_TIME                = 4;
THE_THREE_KINGDOMS            = 5;
THE_THREE_KINGDOMS_SANDORIA   = 6;
THE_THREE_KINGDOMS_BASTOK     = 7;
THE_THREE_KINGDOMS_SANDORIA   = 8;
THE_THREE_KINGDOMS_BASTOK     = 9;
TO_EACH_HIS_OWN_RIGHT         = 10;
WRITTEN_IN_THE_STARS          = 11;
A_NEW_JOURNEY                 = 12;
MAGICITE                      = 13;
THE_FINAL_SEAL                = 14;
THE_SHADOW_AWAITS             = 15;
FULL_MOON_FOUNTAIN            = 16;
SAINTLY_INVITATION            = 17;
THE_SIXTH_MINISTRY            = 18;
AWAKENING_OF_THE_GODS         = 19;
VAIN                          = 20;
THE_JESTER_WHO_D_BE_KING      = 21;
DOLL_OF_THE_DEAD              = 22;
MOON_READING                  = 23;

--jAuriya|Moki:	Old function, will likely be further tested and rewritten later
function rankPointMath(rank)
	return 0.372*rank^2 - 1.62*rank + 6.2;
end

--jAuriya|Moki:	Old function as well, I have only uncommented this
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


--jAuriya|Moki:	Pretty much re-did the entire function, this way it's customizable, for example if
--				someone later would want to run a server that has all missions repeatable, etc
function getMissionMask(player)
	rank = player:getRank()
	nation = player:getNation();  -- 0 = San d'Oria ; 1 = Bastok ; 2 = Windurst
	mission_status =  player:getCurrentMission(nation);

	first_mission = 0;
	repeat_mission = 0;

	if(nation == WINDURST) then
		if(rank >= 1) then
			if(player:hasCompletedMission(WINDURST,THE_HORUTOTO_RUINS_EXPERIMENT) == false) then
				-- 1-1 NOTE: This mission will not be listed in the Mission List for Windurst
				--first_mission = first_mission + 1;
			end
			if(player:hasCompletedMission(WINDURST,THE_HEART_OF_THE_MATTER) == false) then
				-- 1-2 NOTE: This mission will not be listed in the Mission List for Windurst
				--first_mission = first_mission + 2;
			end
			if(player:hasCompletedMission(WINDURST,THE_PRICE_OF_PEACE) == false) then
				-- 1-3 NOTE: This mission will not be listed in the Mission List for Windurst
				--first_mission = first_mission + 4;
			end
		end
		if(rank >= 2) then
			-- 2-1
			if(player:hasCompletedMission(WINDURST,LOST_FOR_WORDS) == false and getMissionRankPoints(player,3) == 1) then
				first_mission = first_mission + 8;
			else
				if(rank > 2 or getMissionRankPoints(player,4) == 1) then
					-- 2-2 Repeatable
					repeat_mission = repeat_mission + 16;
				end
				if(player:hasCompletedMission(WINDURST,THE_THREE_KINGDOMS) == false and getMissionRankPoints(player,5) == 1) then
					-- 2-3
					first_mission = first_mission + 32;
				end
			end
		end
		if(rank >= 3) then
			-- 3-1
			if(player:hasCompletedMission(WINDURST,TO_EACH_HIS_OWN_RIGHT) == false and getMissionRankPoints(player,10) == 1) then
				first_mission = first_mission + 1024;
			else
				if(player:hasCompletedMission(WINDURST,WRITTEN_IN_THE_STARS) == false and getMissionRankPoints(player,11) == 1) then
					-- 3-2 Repeatable & Skippable
					repeat_mission = repeat_mission + 2048;
				elseif(rank > 3 or getMissionRankPoints(player,11) == 1) then
					-- 3-2 Repeatable & Skippable
					repeat_mission = repeat_mission + 2048;
				end
				if(player:hasCompletedMission(WINDURST,A_NEW_JOURNEY) == false and getMissionRankPoints(player,12) == 1) then
					-- 3-3
					first_mission = first_mission + 4096;
				end
			end
		end
		if(rank == 4) then
			-- The mission is triggered by the Ambassador in Jeuno
			--if(player:hasCompletedMission(WINDURST,MAGICITE) == false and getMissionRankPoints(player,0) == 1) then
				-- 4-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 8192;
			--end
		end
		if(rank == 5) then
			--if(player:hasCompletedMission(WINDURST,THE_FINAL_SEAL) == false and getMissionRankPoints(player,0) == 1 and mission_status == 0) then
				-- 5-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 16384;
			--end
			if(player:hasCompletedMission(WINDURST,THE_SHADOW_AWAITS) == false and getMissionRankPoints(player,15) == 1) then
				-- 5-2
				first_mission = first_mission + 32768;
			end
		end
		if(rank == 6) then
			if(player:hasCompletedMission(WINDURST,FULL_MOON_FOUNTAIN) == false and getMissionRankPoints(player,16) == 1) then
				-- 6-1
				first_mission = first_mission + 65536;
			elseif(player:hasCompletedMission(WINDURST,SAINTLY_INVITATION) == false and getMissionRankPoints(player,17) == 1) then
				-- 6-2
				first_mission = first_mission + 131072;
			end
		end
		if(rank == 7) then
			if(player:hasCompletedMission(WINDURST,THE_SIXTH_MINISTRY) == false and getMissionRankPoints(player,18) == 1) then
				-- 7-1
				first_mission = first_mission + 262144;
			elseif(player:hasCompletedMission(WINDURST,AWAKENING_OF_THE_GODS) == false and getMissionRankPoints(player,19) == 1) then
				-- 7-2
				first_mission = first_mission + 524288;
			end
		end
		if(rank == 8) then
			if(player:hasCompletedMission(WINDURST,VAIN) == false and getMissionRankPoints(player,20) == 1) then
				-- 8-1
				first_mission = first_mission + 1048576;
			elseif(player:hasCompletedMission(WINDURST,THE_JESTER_WHO_D_BE_KING) == false and getMissionRankPoints(player,21) == 1) then
				-- 8-2
				first_mission = first_mission + 2097152;
			end
		end
		if(rank == 9) then
			if(player:hasCompletedMission(WINDURST,DOLL_OF_THE_DEAD) == false and getMissionRankPoints(player,22) == 1) then
				-- 9-1
				first_mission = first_mission + 4194304;
			elseif(player:hasCompletedMission(WINDURST,MOON_READING) == false and getMissionRankPoints(player,23) == 1) then
				-- 9-2
				first_mission = first_mission + 8388608;
			end
		end
	elseif(nation == SANDORIA) then
		if(rank >= 1) then
			if(player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS) == false) then -- The first mission is repeatable in San d'Oria
				-- 1-1
				repeat_mission = repeat_mission + 1;
			elseif(player:hasCompletedMission(SANDORIA,BAT_HUNT) == false) then
				-- 1-2 If we completed 1-1, we can start and repeat this mission
				repeat_mission = repeat_mission + 2 + 1;
			elseif(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN) == false) then
				-- 1-3 If we completed 1-2, we can start and repeat this mission
				repeat_mission = repeat_mission + 4 + 2 + 1;
			else
				repeat_mission = repeat_mission + 4 + 2 + 1;
			end
		end
		if(rank >= 2) then
			-- 2-1
			if(player:hasCompletedMission(SANDORIA,THE_RESCUE_DRILL) == false and getMissionRankPoints(player,3) == 1) then
				first_mission = first_mission + 8;
			else
				if(rank > 2 or getMissionRankPoints(player,4) == 1) then
					-- 2-2 Repeatable & Skippable
					repeat_mission = repeat_mission + 16;
				end
				if(player:hasCompletedMission(SANDORIA,JOURNEY_ABROAD) == false and getMissionRankPoints(player,5) == 1) then
					-- 2-3
					first_mission = first_mission + 32;
				end
			end
		end
		if(rank >= 3) then
			if(rank > 3 or getMissionRankPoints(player,10) == 1) then
				-- 3-1
				repeat_mission = repeat_mission + 1024;
			end
			if(player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI) == true and getMissionRankPoints(player,11) == 1) then
				-- 3-2 Repeatable & Skippable
				repeat_mission = repeat_mission + 2048;
			end
			if(player:hasCompletedMission(SANDORIA,INFILTRATE_DAVOI) == true and getMissionRankPoints(player,12) == 1) then
				-- 3-3
				first_mission = first_mission + 4096;
			end
		end
		if(rank == 4) then
			-- The mission is triggered by the Ambassador in Jeuno
			--if(player:hasCompletedMission(SANDORIA,MAGICITE_SAN_D_ORIA) == false and getMissionRankPoints(player,0) == 1) then
				-- 4-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 8192;
			--end
		end
		if(rank == 5) then
			--if(player:hasCompletedMission(SANDORIA,THE_RUINS_OF_FEI_YIN) == false and getMissionRankPoints(player,0) == 1 and mission_status == 0) then
				-- 5-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 16384;
			--end
			if(player:hasCompletedMission(SANDORIA,THE_SHADOW_LORD) == false and getMissionRankPoints(player,15) == 1) then
				-- 5-2
				first_mission = first_mission + 32768;
			end
		end
		if(rank == 6) then
			if(player:hasCompletedMission(SANDORIA,LEAUTE_S_LAST_WISHES) == false and getMissionRankPoints(player,16) == 1) then
				-- 6-1
				first_mission = first_mission + 65536;
			elseif(player:hasCompletedMission(SANDORIA,RANPERRE_S_FINAL_REST) == false and getMissionRankPoints(player,17) == 1) then
				-- 6-2
				first_mission = first_mission + 131072;
			end
		end
		if(rank == 7) then
			if(player:hasCompletedMission(SANDORIA,PRESTIGE_OF_THE_PAPSQUE) == false and getMissionRankPoints(player,18) == 1) then
				-- 7-1
				first_mission = first_mission + 262144;
			elseif(player:hasCompletedMission(SANDORIA,THE_SECRET_WEAPON) == false and getMissionRankPoints(player,19) == 1) then
				-- 7-2
				first_mission = first_mission + 524288;
			end
		end
		if(rank == 8) then
			if(player:hasCompletedMission(SANDORIA,COMING_OF_AGE) == false and getMissionRankPoints(player,20) == 1) then
				-- 8-1
				first_mission = first_mission + 1048576;
			elseif(player:hasCompletedMission(SANDORIA,LIGHTBRINGER) == false and getMissionRankPoints(player,21) == 1) then
				-- 8-2
				first_mission = first_mission + 2097152;
			end
		end
		if(rank == 9) then
			if(player:hasCompletedMission(SANDORIA,BREAKING_BARRIERS) == false and getMissionRankPoints(player,22) == 1) then
				-- 9-1
				first_mission = first_mission + 4194304;
			elseif(player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT) == false and getMissionRankPoints(player,23) == 1) then
				-- 9-2
				first_mission = first_mission + 8388608;
			end
		end	
	elseif(nation == BASTOK) then
		if(rank >= 1) then
			if(player:hasCompletedMission(BASTOK,THE_ZERUHN_REPORT) == false) then
				-- 1-1 NOTE: This mission will not be listed in the Mission List for Bastok
				--first_mission = first_mission + 1;
			end
			if(player:hasCompletedMission(BASTOK,GEOLOGICAL_SURVEY) == false) then
				-- 1-2 NOTE: This mission will not be listed in the Mission List for Bastok
				first_mission = first_mission + 2;
			end
			if(player:hasCompletedMission(BASTOK,GEOLOGICAL_SURVEY) == true) then
				-- 1-3
				repeat_mission = repeat_mission + 4;
			end
		end
		if(rank >= 2) then
			-- 2-1
			if(player:hasCompletedMission(BASTOK,THE_CRYSTAL_LINE) == false and getMissionRankPoints(player,3) == 1) then
				first_mission = first_mission + 8;
			else
				if(rank > 2 or getMissionRankPoints(player,4) == 1) then
					-- 2-2 Repeatable
					repeat_mission = repeat_mission + 16;
				end
				if(player:hasCompletedMission(BASTOK,THE_EMISSARY) == false and getMissionRankPoints(player,5) == 1) then
					-- 2-3
					first_mission = first_mission + 32;
				end
			end
		end
		if(rank >= 3) then
			-- 3-1
			if(player:hasCompletedMission(BASTOK,THE_FOUR_MUSKETEERS) == false and getMissionRankPoints(player,10) == 1) then
				first_mission = first_mission + 1024;
			else
				if(rank > 3 or getMissionRankPoints(player,11) == 1) then
					-- 3-2 Repeatable & Skippable
					repeat_mission = repeat_mission + 2048;
				end
				if(player:hasCompletedMission(BASTOK,JEUNO) == false and getMissionRankPoints(player,12) == 1) then
					-- 3-3
					first_mission = first_mission + 4096;
				end
			end
		end
		if(rank == 4) then
			-- The mission is triggered by the Ambassador in Jeuno
			--if(player:hasCompletedMission(BASTOK,MAGICITE_BASTOK) == false and getMissionRankPoints(player,0) == 1) then
				-- 4-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 8192;
			--end
		end
		if(rank == 5) then
			--if(player:hasCompletedMission(BASTOK,DARKNESS_RISING) == false and getMissionRankPoints(player,0) == 1 and mission_status == 0) then
				-- 5-1 NOTE: This mission will not be listed in the Mission List
				--first_mission = first_mission + 16384;
			--end
			if(player:hasCompletedMission(BASTOK,XARCABARD) == false and getMissionRankPoints(player,15) == 1) then
				-- 5-2
				first_mission = first_mission + 32768;
			end
		end
		if(rank == 6) then
			if(player:hasCompletedMission(BASTOK,RETURN_OF_THE_TALEKEEPER) == false and getMissionRankPoints(player,16) == 1) then
				-- 6-1
				first_mission = first_mission + 65536;
			elseif(player:hasCompletedMission(BASTOK,THE_PIRATE_S_COVE) == false and getMissionRankPoints(player,17) == 1) then
				-- 6-2
				first_mission = first_mission + 131072;
			end
		end
		if(rank == 7) then
			if(player:hasCompletedMission(BASTOK,THE_FINAL_IMAGE) == false and getMissionRankPoints(player,18) == 1) then
				-- 7-1
				first_mission = first_mission + 262144;
			elseif(player:hasCompletedMission(BASTOK,ON_MY_WAY) == false and getMissionRankPoints(player,19) == 1) then
				-- 7-2
				first_mission = first_mission + 524288;
			end
		end
		if(rank == 8) then
			if(player:hasCompletedMission(BASTOK,THE_CHAINS_THAT_BIND_US) == false and getMissionRankPoints(player,20) == 1) then
				-- 8-1
				first_mission = first_mission + 1048576;
			elseif(player:hasCompletedMission(BASTOK,ENTER_THE_TALEKEEPER) == false and getMissionRankPoints(player,21) == 1) then
				-- 8-2
				first_mission = first_mission + 2097152;
			end
		end
		if(rank == 9) then
			if(player:hasCompletedMission(BASTOK,THE_SALT_OF_THE_EARTH) == false and getMissionRankPoints(player,22) == 1) then
				-- 9-1
				first_mission = first_mission + 4194304;
			elseif(player:hasCompletedMission(BASTOK,WHERE_TWO_PATHS_CONVERGE) == false and getMissionRankPoints(player,23) == 1) then
				-- 9-2
				first_mission = first_mission + 8388608;
			end
		end
	end

	mission_mask = 2147483647 - repeat_mission - first_mission; -- 2^31 -1 - ..
	return mission_mask,repeat_mission;
end;

function getStartMissionList(player)
	
	-- option, missionid, missionstatus, rep.missionstatuts
	pNation = player:getNation();
	
	if(pNation == SANDORIA) then
		MissionList = {0,SMASH_THE_ORCISH_SCOUTS,0,0,101,BAT_HUNT,1,1,102,SAVE_THE_CHILDREN,1,2,3,THE_RESCUE_DRILL,1,0,104,THE_DAVOI_REPORT,1,1,5,JOURNEY_ABROAD,1,0,110,INFILTRATE_DAVOI,1,5,111,THE_CRYSTAL_SPRING,1,1,12,APPOINTMENT_TO_JEUNO,1,0};
	end
	
	return MissionList;
	
end;

function getMissionOffset(player,guard,pMission,MissionStatus)
	offset = 0; cs = 0; params = {0,0,0,0,0,0,0,0};
	
	if(guard == 1) then GuardCS = {0x03fe,0x03fd,0x0401,0x03ec,0x0400,0x03ed,0x03ee,0x0404,0x0405,0x03f4,0x0407}; end
	
	switch (pMission) : caseof {
		[0] = function (x) offset = 0; end,
		[1] = function (x) if(MissionStatus == 2) then cs = GuardCS[1]; else cs = GuardCS[2]; end end,
		[2] = function (x) if(MissionStatus == 1) then cs = GuardCS[3]; 
					   elseif(MissionStatus == 4 and player:hasCompletedMission(0,2) == false) then cs = GuardCS[4]; 
					   elseif(MissionStatus == 4) then cs = GuardCS[5]; else offset = 24; end end,
		[3] = function (x) if(MissionStatus == 11) then cs = GuardCS[6]; else offset = 36; end end,
		[4] = function (x) if(MissionStatus == 3 and player:hasCompletedMission(0,4)) then cs = GuardCS[7];
					   elseif(MissionStatus == 3) then cs = GuardCS[8]; params = {0,0,0,44}; else offset = 44; end end,
		[5] = function (x) if(MissionStatus == 1) then offset = 50; else offset = 51; end end,
		[10] = function (x) if(MissionStatus == 1) then cs = GuardCS[9];
					    elseif(MissionStatus == 4) then offset = 55; 
						elseif(MissionStatus == 5) then offset = 60;
					    elseif(MissionStatus == 10) then cs = GuardCS[10]; end end, 
		[11] = function (x) if(MissionStatus == 1) then offset = 68; 
						elseif(MissionStatus == 2) then cs = GuardCS[11]; end end, 
		[12] = function (x) if(MissionStatus == 1) then offset = 74; end end, 
	default = function (x) end, }
	return cs, params, offset;
	
end;

function getMissionOffset(player,guard,pMission,MissionStatus)
	
	offset = 0; cs = 0; params = {0,0,0,0,0,0,0,0};
	
	if(guard == 1) then GuardCS = {0x03fe,0x03fd,0x0401,0x03ec,0x0400,0x03ed,0x03ee,0x0404,0x0405,0x03f4,0x0407}; end
	
	switch (pMission) : caseof {
		[0] = function (x) offset = 0; end, -- Mission 1-1
		[1] = function (x) if(MissionStatus == 2) then cs = GuardCS[1]; else cs = GuardCS[2]; end end, -- Mission 1-2 (2) after check tombstone
		[2] = function (x) if(MissionStatus == 1) then cs = GuardCS[3]; -- Mission 1-3 before Battlefield
					   elseif(MissionStatus == 5 and player:hasCompletedMission(0,2) == false) then cs = GuardCS[4]; -- Mission 1-3 after Battlefield
					   elseif(MissionStatus == 5) then cs = GuardCS[5]; else offset = 24; end end, -- Mission 1-3 after Battlefield (Finish Quest)
		[3] = function (x) if(MissionStatus == 11) then cs = GuardCS[6]; else offset = 36; end end,
		[4] = function (x) if(MissionStatus == 3 and player:hasCompletedMission(0,4)) then cs = GuardCS[7];
					   elseif(MissionStatus == 3) then cs = GuardCS[8]; params = {0,0,0,44}; else offset = 44; end end,
		[5] = function (x) if(MissionStatus == 1) then offset = 50; else offset = 51; end end,
		[10] = function (x) if(MissionStatus == 1) then cs = GuardCS[9];
					    elseif(MissionStatus == 4) then offset = 55; 
						elseif(MissionStatus == 5) then offset = 60;
					    elseif(MissionStatus == 10) then cs = GuardCS[10]; end end, 
		[11] = function (x) if(MissionStatus == 1) then offset = 68; 
						elseif(MissionStatus == 2) then cs = GuardCS[11]; end end, 
		[12] = function (x) if(MissionStatus == 1) then offset = 74; end end, 
	}
	return cs, params, offset;
	
end;

function finishMissionTimeline(player,guard,csid,option)
	
	nation = player:getNation();
	
	-- missionid, {Guard1CS,option}, {Guard2CS,option}, {Guard3CS,option}, {Guard4CS,option}, {{function,value},...first time}, {{function,value},...for repeat}, 
	--  1: player:addMission(nation,mission);
	--  2: player:messageSpecial(YOU_ACCEPT_THE_MISSION);
	--  3: player:setVar(variablename,value);
	--  4: player:tradeComplete();
	--  5: player:addRankPoints(number);
	--  6: player:setRankPoints(0);
	--  7: player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS);
	--  8: player:addGil(GIL_RATE*number); player:messageSpecial(GIL_OBTAINED,GIL_RATE*number);
	--  9: player:delKeyItem(number);
	-- 10: player:addKeyItem(number);
	-- 11: player:setRank(number);
	-- 12: player:completeMission(nation,mission);
	
	if(nation == SANDORIA) then
		timeline = {0,{0x03e8,0},{0,0},{0,0},{0,0},{{1},{2}},0, -- MISSION 1-1 (First Mission)
					0,{0x03f1,0},{0,0},{0,0},{0,0},0,{{1},{2}}, -- MISSION 1-1 (Repeat)
					0,{0x03ea,0},{0,0},{0,0},{0,0},{{4},{5,150},{7},{12}},{{4},{5,150},{7},{12}}, -- MISSION 1-1 (Finish)
					1,{0x03f1,101},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},{{1},{3,"MissionStatus",1},{2}}, -- Mission 1-2 (First & Repeat)
					1,{0x03ff,0},{0,0},{0,0},{0,0},{{4},{3,"MissionStatus",0},{5,200},{7},{12}},0, -- MISSION 1-2 (Finish First Mission)
					1,{0x03eb,0},{0,0},{0,0},{0,0},0,{{4},{3,"MissionStatus",0},{5,200},{7},{12}}, -- MISSION 1-2 (Finish Repeat)
					2,{0x03f1,102},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},{{1},{3,"MissionStatus",2},{2}}, -- MISSION 1-3 (First & Repeat)
					2,{0x03ec,0},{0,0},{0,0},{0,0},{{11,2},{3,"OptionalCSforSavetheChildren",1},{3,"MissionStatus",0},{5,250},{7},{8,1000},{12}},0, -- MISSION 1-3 (Finish first Mission)
					2,{0x0400,0},{0,0},{0,0},{0,0},0,{{3,"MissionStatus",0},{5,250},{7},{12}}, -- MISSION 1-3 (Finish Repeat)
					3,{0x03f1,3},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},0, -- MISSION 2-1 (First & No Repeat)
					3,{0x03ed,0},{0,0},{0,0},{0,0},{{9,65},{3,"MissionStatus",0},{5,300},{7},{12}},0, -- MISSION 2-1 (Finish)
					4,{0x03f1,104},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},{{1},{3,"MissionStatus",1},{2}}, -- MISSION 2-2 (First & Repeat)
					5,{0x03f1,5},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},0, -- MISSION 2-3 (First & No Repeat)
					10,{0x03f1,110},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},{{1},{3,"MissionStatus",5},{2}}, -- MISSION 3-1 (First & Repeat)
					10,{0x03f4,0},{0,0},{0,0},{0,0},{{3,"MissionStatus",0},{5,300},{7},{12}},{{3,"MissionStatus",0},{5,300},{7},{12}}, -- MISSION 3-1 (Finish)
					11,{0x03f1,111},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},{{1},{3,"MissionStatus",1},{2}}, -- MISSION 3-2 (First & Repeat)
					11,{0x0406,0},{0,0},{0,0},{0,0},{{4},{3,"MissionStatus",2}},0, -- MISSION 3-2 (First: Continue Mission)
					11,{0x03f5,0},{0,0},{0,0},{0,0},0,{{4},{3,"MissionStatus",0},{5,300},{7},{12}}, -- MISSION 3-2 (Repeat: Finish)
					12,{0x03f1,12},{0,0},{0,0},{0,0},{{1},{3,"MissionStatus",1},{2}},0, -- MISSION 3-3 (First & No Repeat)
					};
	elseif(nation == BASTOK) then
	else
	end

	for cs = 1, table.getn(timeline), 7 do
		if(csid == timeline[cs + guard][1] and option == timeline[cs + guard][2]) then
			if(player:hasCompletedMission(nation,timeline[cs])) then
				getMessList = 6;
			else
				getMessList = 5;
			end
			
			for nb = 1, table.getn(timeline[cs + getMessList]), 1 do
				
				messList = timeline[cs + getMessList][nb];
				
				switch (messList[1]) : caseof {
					[1] = function (x) player:addMission(nation,timeline[cs]); end, 
					[2] = function (x) player:messageSpecial(YOU_ACCEPT_THE_MISSION); end, 
					[3] = function (x) player:setVar(messList[2],messList[3]); end, 
					[4] = function (x) player:tradeComplete(); end, 
					[5] = function (x) player:addRankPoints(messList[2]); end, 
					[6] = function (x) player:setRankPoints(0); end, 
					[7] = function (x) player:messageSpecial(YOUVE_EARNED_CONQUEST_POINTS); end, 
					[8] = function (x) player:addGil(GIL_RATE*messList[2]); player:messageSpecial(GIL_OBTAINED,GIL_RATE*messList[2]); end, 
					[9] = function (x) player:delKeyItem(messList[2]); end, 
					[10] = function (x) player:addKeyItem(messList[2]); end,
					[11] = function (x) player:setRank(messList[2]); end,
					[12] = function (x) player:completeMission(nation,timeline[cs]); end, 
				}
			end
		end
	end

end;