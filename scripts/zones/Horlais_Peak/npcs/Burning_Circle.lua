-----------------------------------
-- Area: Horlais Peak
-- NPC:  Burning Circle
-- Horlais Peak Burning Circle
-- @zone 139
-- @pos -509 158 -211
-------------------------------------
package.loaded["scripts/zones/Horlais_Peak/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Horlais_Peak/TextIDs");

	-- events:
	-- 7D00 : BC menu
	-- Param 4 is a bitmask for the choice of battlefields in the menu:

	--- 0: The Rank 2 Final Mission
	--- 1: Tails of Woe
	--- 2: Dismemberment Brigade
	--- 3: The Secret Weapon (Sandy Mission 7-2)
	--- 4: Hostile Herbivores
	--- 5: Shattering Stars (WAR)
	--- 6: Shattering Stars (BLM)
	--- 7: Shattering Stars (RNG)
	--- 8: Carapace Combatants
	--- 9: Shooting Fish
	--- 10: Dropping like Flies
	--- 11: Horns of War
	--- 12: Under Observation
	--- 13: Eye of the Tiger
	--- 14: Shots in the Dark
	--- 15: Double Dragonian
	--- 16: Today's Horoscope
	--- 17: Contaminated Colosseum

	-- Param 8 is a flag: 0 : menu, >0 : automatically enter and exit

	-- 7D01 : final BC event.
	-- param 2: #time record for this mission
	-- param 3: #clear time in seconds
	-- param 6: #which mission (linear numbering as above)
	-- 7D03 : stay/run away

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);
	
	LvL = player:getMainLvl();
	mJob = player:getMainJob();
	shatteringStars = player:getQuestStatus(JEUNO,SHATTERING_STARS);
	
	if(player:getXPos() >= -520 and player:getXPos() <= -500 and player:getZPos() >= -220 and player:getZPos() <= -200) then
		if(getAvailableBattlefield(player:getZone()) ~= 255) then
			local bcnmFight = 0;
			
			-- Battlefield for WAR, BLM, RNG
			if(shatteringStars == QUEST_ACCEPTED and trade:getItemCount() == 1 and player:getVar("maatDefeated") == 0) then
				if(trade:hasItemQty(1426,1) and mJob == 1 and LvL >= 66) then
					bcnmFight = bcnmFight + 32;
				elseif(trade:hasItemQty(1429,1) and mJob == 4 and LvL >= 66) then
					bcnmFight = bcnmFight + 64;
				elseif(trade:hasItemQty(1436,1) and mJob == 11 and LvL >= 66) then
					bcnmFight = bcnmFight + 128;
				end
			end

			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
			end
		else
			player:messageSpecial(7155);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);

	if(player:getXPos() >= -520 and player:getXPos() <= -500 and player:getZPos() >= -220 and player:getZPos() <= -200) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(player:getCurrentMission(BASTOK) == 8 and player:getVar("MissionStatus") == 9) then
				bcnmFight = bcnmFight + 1;
			end

			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
			end
		else
			player:messageSpecial(7155);
		end
	else
		player:startEvent(0x7d03);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

	if(csid == 0x7d00) then
		pZone = player:getZone();
		zoneReady = tostring(pZone) .. "_Ready";
		readyField = getAvailableBattlefield(pZone);

		if(option == 0) then
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				if(player:getQuestStatus(JEUNO,SHATTERING_STARS) == QUEST_ACCEPTED) then
					skip = 0; mJob = player:getMainJob();
					record = GetServerVariable("[BF]Shattering_Stars_job"..mJob.."_record");
					if(mJob == 1) then bcnmFight = 5; elseif(mJob == 4) then bcnmFight = 6; else bcnmFight = 7; end
				elseif(player:getCurrentMission(BASTOK) == 8 and player:getVar("MissionStatus") == 9) then
					skip = 0;
					record = GetServerVariable("[BF]Mission_2-3_Horlais_Peak_record");
					player:levelRestriction(25);
				elseif(player:hasCompletedMission(player:getNation(),5)) then
					skip = 1;
					record = GetServerVariable("[BF]Mission_2-3_Horlais_Peak_record");
					player:levelRestriction(25);
				end
				
				player:updateEvent(2,bcnmFight,0,record,1,skip);
			else
				player:updateEvent(0,0,0,0,0,0);
			end
		elseif(option == 255) then
			player:setVar(tostring(pZone) .. "_Field",readyField);
		end
	end
	
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

	pZone = player:getZone();

	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 3) then
			player:startEvent(0x7d02);
		else
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,900,1);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_Fight",option);
		end
	elseif(csid == 0x7d03 and option == 4) then
		if(player:getVar(tostring(pZone) .. "_Fight") == 100) then
			player:setVar("BCNM_Killed",0);
			player:setVar("BCNM_Timer",0);
		end
		player:setVar(tostring(pZone) .. "_Runaway",1);
		player:delStatusEffect(EFFECT_BATTLEFIELD);
		player:levelRestriction(0);
		player:setVar(tostring(pZone) .. "_Runaway",0)
	end
	
end;