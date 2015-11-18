-----------------------------------
--  Area: Bibiki Bay
--  NPC:  Fheli Lapatzuo
--  Type: Manaclipper
--  @pos 488.793 -4.003 709.473 4
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;

require("scripts/zones/Bibiki_Bay/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local schedule = 0;
	local vHour = VanadielHour();
	local vMin  = VanadielMinute();

	if (     vHour ==  0 and vMin <= 10) then	--	Schedule                        
		--Do nothing.				--	0: A -  0:10 - Dhalmel Rock     
	elseif ( vHour ==  0 and vMin <= 50) then	--	1: D -  0:50 - Dhalmel Rock     
		schedule = 1;				--	2: A -  4:50 - Purgonorgo Isle  
	elseif ( vHour <=  3) then			--	3: D -  5:30 - Purgonorgo Isle  
		schedule = 2;				--	4: A - 12:10 - Maliyakaleya Reef
	elseif ( vHour ==  4 and vMin <= 50) then	--	5: D - 12:50 - Maliyakaleya Reef
		schedule = 2;				--	6: A - 16:50 - Purgonorgo Isle  
	elseif ( vHour <=  4) then			--	7: D - 17:30 - Purgonorgo Isle
		schedule = 3;
	elseif ( vHour ==  5 and vMin <= 30) then	  
		schedule = 3;
	elseif ( vHour <= 11) then			
		schedule = 4;
	elseif ( vHour == 12 and vMin <= 10) then	
		schedule = 4;
	elseif ( vHour == 12 and vMin <= 50) then	
		schedule = 5;
	elseif ( vHour <= 15) then			
		schedule = 6;
	elseif ( vHour == 16 and vMin <= 50) then	
		schedule = 6;
	elseif ( vHour <= 16) then			
		schedule = 7;
	elseif ( vHour == 17 and vMin <= 30) then	
		schedule = 7;
	end

	local arrive = 0;
	local depart = 0;
	local seconds = 0;
	local description = 0; -- Dhamel Rock Tour: 0, Maliyakaleya Reef: 1, Purgonorgo Isle: 2, Sunset Docks: 3

	if (     schedule == 0) then -- Arrival, bound for Dhamel Rock

		arrive = 1;

		if (     vHour == 17) then vHour = 7;
		elseif ( vHour == 18) then vHour = 6;
		elseif ( vHour == 19) then vHour = 5;
		elseif ( vHour == 20) then vHour = 4;
		elseif ( vHour == 21) then vHour = 3;
		elseif ( vHour == 22) then vHour = 2;
		elseif ( vHour == 23) then vHour = 1;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 10));

	elseif ( schedule == 1) then -- Departure to Dhalmel Rock

		depart = 1;

		seconds = math.floor(2.4 * (50 - vMin));

	elseif ( schedule == 2) then -- Arrival, bound for Purgonorgo Isle

		arrive = 1;
		description = 2; -- Purgonorgo Isle

		if (     vHour ==  0) then vHour = 4;
		elseif ( vHour ==  1) then vHour = 3;
		elseif ( vHour ==  2) then vHour = 2;
		elseif ( vHour ==  3) then vHour = 1;
		elseif ( vHour ==  4) then vHour = 0;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 50));

	elseif ( schedule == 3) then -- Departure to Purgonorgo Isle

		depart = 1;
		description = 2; -- Purgonorgo Isle

		if (     vHour ==  4) then vHour = 1;
		elseif ( vHour ==  5) then vHour = 0;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 30));

	elseif ( schedule == 4) then -- Arrival, bound for Maliyakaleya Reef
		
		arrive = 1;
		description = 1; -- Maliyakaleya Reef

		if (     vHour ==  5) then vHour = 7;
		elseif ( vHour ==  6) then vHour = 6;
		elseif ( vHour ==  7) then vHour = 5;
		elseif ( vHour ==  8) then vHour = 4;
		elseif ( vHour ==  9) then vHour = 3;
		elseif ( vHour == 10) then vHour = 2;
		elseif ( vHour == 11) then vHour = 1;
		elseif ( vHour == 12) then vHour = 0;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 10));

	elseif ( schedule == 5) then -- Departure to Maliyakaleya Reef

		depart = 1;
		description = 1; -- Maliyakaleya Reef

		seconds = math.floor(2.4 * (50 - vMin));

	elseif ( schedule == 6) then -- Arrival, bound for Purgonorgo Isle

		arrive = 1;
		description = 2; -- Purgonorgo Isle

		if (     vHour == 12) then vHour = 4;
		elseif ( vHour == 13) then vHour = 3;
		elseif ( vHour == 14) then vHour = 2;
		elseif ( vHour == 15) then vHour = 1;
		elseif ( vHour == 16) then vHour = 0;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 50));

	elseif ( schedule == 7) then -- Departure to Purgonorgo Isle

		depart = 1;
		description = 2; -- Purgonorgo Isle

		if (     vHour == 16) then vHour = 1;
		elseif ( vHour == 17) then vHour = 0;
		end

		seconds = math.floor(2.4 * (vHour * 60 - vMin + 30));
	end

	player:startEvent( 0x0012, seconds, depart, arrive, description, 0, 0, 0, 0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;
