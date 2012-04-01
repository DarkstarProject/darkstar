-----------------------------------
-- Area: Waughroon Shrine
-- NPC:  Burning Circle
-- Waughroon Shrine Burning Circle
-- @zone 144
-- @pos -345 104 -260
-------------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Waughroon_Shrine/TextIDs");

	-- events:
	-- 7D00 : BC menu
	-- Param 4 is a bitmask for the choice of battlefields in the menu:

	---- 0: Rank 2 Final Mission for Bastok "The Emissary" and Sandy "Journey Abroad"
	---- 1: Steamed Sprouts (BCNM 40, Star Orb)
	---- 2: Divine Punishers (BCNM 60, Moon Orb)
	---- 3: Saintly Invitation (Windurst mission 6-2)
	---- 4: Treasure and Tribulations (BCNM 50, Comet Orb)
	---- 5: Shattering Stars (MNK)
	---- 6: Shattering Stars (WHM)
	---- 7: Shattering Stars (SMN)
	---- 8: Creeping Doom (BCNM 30, Sky Orb)
	---- 9: Charming Trio (BCNM 20, Cloudy Orb)
	---- 10: Harem Scarem (BCNM 30, Sky Orb)
	---- 11: Early Bird Catches the Wyrm (KSNM 99, Themis Orb)
	---- 12: Royal Succession (BCNM 40, Star Orb)
	---- 13: Rapid Raptors (BCNM 50, Comet Orb)
	---- 14: Wild Wild Whiskers (BCNM 60, Moon Orb)
	---- 15: Season's Greetings (KSNM 30, Clotho Orb)
	---- 16: Royale Ramble (KSNM 30, Lachesis Orb)
	---- 17: Moa Constrictors (KSNM 30, Atropos Orb

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
	player:setVar(tostring(pZone) .. "_onTrade",0);
	
	if(player:getXPos() >= -346 and player:getXPos() <= -330 and player:getZPos() >= -268 and player:getZPos() <= -252) then
		if(getAvailableBattlefield(player:getZone()) ~= 255) then
			
			bcnmFight = getTradeFightBCNM(player,pZone,trade);
			
			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
				player:setVar(tostring(pZone) .. "_onTrade",trade:getItem());
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

	if(player:getXPos() >= -346 and player:getXPos() <= -330 and player:getZPos() >= -268 and player:getZPos() <= -252) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 and player:getVar("MissionStatus") == 10) then
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
			local skip = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			onTradeFight = player:getVar(tostring(pZone) .. "_onTrade")

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				if(onTradeFight ~= 0) then
					bcnmFight = getUpdateFightBCNM(player,pZone,onTradeFight);
					record = GetServerVariable("[BF]Shattering_Stars_job"..player:getMainJob().."_record");
				elseif(player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 and player:getVar("MissionStatus") == 10) then
					record = GetServerVariable("[BF]Mission_2-3_Waughroon_record");
					player:levelRestriction(25);
				elseif(player:hasCompletedMission(player:getNation(),5)) then
					skip = 1;
					record = GetServerVariable("[BF]Mission_2-3_Waughroon_record");
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
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,900);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_onTrade",0);
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