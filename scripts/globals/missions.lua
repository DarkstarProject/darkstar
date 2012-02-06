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
JOURNEY_TO_BASTOK       = 6;
JOURNEY_TO_WINDURST     = 7;
JOURNEY_TO_BASTOK       = 8;
JOURNEY_TO_WINDURST     = 9;
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
			if(1>0) then -- The first mission is repeatable in San d'Oria
				-- 1-1
				repeat_mission = repeat_mission + 1;
			end
			if(player:hasCompletedMission(SANDORIA,SMASH_THE_ORCISH_SCOUTS) == false) then
				-- 1-2 If we completed 1-1, we can start and repeat this mission
				repeat_mission = repeat_mission + 2;
			end
			if(player:hasCompletedMission(SANDORIA,BAT_HUNT) == false) then
				-- 1-3 If we completed 1-2, we can start and repeat this mission
				repeat_mission = repeat_mission + 4;
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
				--first_mission = first_mission + 2;
			end
			if(player:hasCompletedMission(BASTOK,GEOLOGICAL_SURVEY) == true and player:hasCompletedMission(BASTOK,GEOLOGICAL_SURVEY) == true) then
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
