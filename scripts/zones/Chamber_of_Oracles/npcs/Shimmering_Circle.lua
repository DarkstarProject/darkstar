-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Shimmering Circle
-- @pos -220 0 12 168
-------------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/status");
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Chamber_of_Oracles/TextIDs");

	-- events:
	-- 7D00 : BC menu
	-- Param 4 is a bitmask for the choice of battlefields in the menu:
	
	--- 1/0: Through the Quicksand Caves
	--- 2/1: Legion XI Comitatensis
	--- 4/2: Shattering Stars (Samurai)
	--- 8/3: Shattering Stars (Ninja)
	--- 16/4: Shattering Stars (Dragoon)
	--- Cactuar Suave
	--- Eye of the Storm
	--- The Scarlet King
	--- Roar! A Cat Burglar Bares Her Fangs
	

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
	
	if(player:getXPos() >= -232 and player:getXPos() <= -210 and player:getZPos() >= 10 and player:getZPos() <= 31) then
		if(getAvailableBattlefield(player:getZone()) ~= 255) then
			
			bcnmFight = getTradeFightBCNM(player,pZone,trade);
			
			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
				player:setVar(tostring(pZone) .. "_onTrade",trade:getItem());
			end
		else
			player:messageSpecial(YOU_CANNOT_ENTER_THE_BATTLEFIELD);
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

	if(player:getXPos() >= -232 and player:getXPos() <= -210 and player:getZPos() >= 10 and player:getZPos() <= 31) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(player:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES or player:getCurrentMission(ZILART) == THE_CHAMBER_OF_ORACLES) then
				bcnmFight = bcnmFight + 1;
			elseif(player:hasCompletedMission(ZILART,THROUGH_THE_QUICKSAND_CAVES) and hasPartyEffect(EFFECT_BATTLEFIELD)) then
				bcnmFight = bcnmFight + 1;
			end
			
			if(bcnmFight >= 0) then
				player:startEvent(0x7d00,0,0,0,bcnmFight,0,0,0,0);
			end
		else
			player:messageSpecial(YOU_CANNOT_ENTER_THE_BATTLEFIELD);
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
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			onTradeFight = player:getVar(tostring(pZone) .. "_onTrade")

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				if(onTradeFight ~= 0) then
					bcnmFight = getUpdateFightBCNM(player,pZone,onTradeFight);
					record = GetServerVariable("[BF]Shattering_Stars_job"..player:getMainJob().."_record");
				elseif(player:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES) then
					record = GetServerVariable("[BF]Mission_Zilart_6_record");
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