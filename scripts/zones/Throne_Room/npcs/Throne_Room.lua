-----------------------------------
-- Area: Throne Room
-- Door: Throne Room
-- @pos -111 -6 0 165
-------------------------------------
package.loaded["scripts/zones/QuBia_Arena/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/QuBia_Arena/TextIDs");

	-- events:
	-- 7D00 : BC menu
	-- Param 4 is a bitmask for the choice of battlefields in the menu:
	
	-- 0: Mission 5-2
	-- 1: 
	-- 2: 
	-- 3: 
	-- 4: 
	-- 5: 

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
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);
	
	if(npc:getID() == 17453135) then
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 1;
			
			if(player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 2 and player:hasKeyItem(SHADOW_FRAGMENT) == false) then
				bcnmFight = bcnmFight + 1;
			elseif(player:hasPartyEffect(EFFECT_BATTLEFIELD) and player:hasCompletedMission(player:getNation(),15)) then
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
		SetServerVariable("[BF]Mission_5-2_Enter",1);

		if(option == 0) then
			local skip = 0;
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);
			onTradeFight = player:getVar(tostring(pZone) .. "_onTrade")

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				--elseif(player:hasCompletedMission(player:getNation(),14)) then
			--		skip = 1;
				--	record = GetServerVariable("[BF]The_Rank_5_Mission_record");
				--	player:levelRestriction(50);
				
				player:updateEvent(2,0,0,record,1,skip);
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
		elseif(option == 100) then
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,option,0,1800);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_onTrade",0);
			player:setVar(tostring(pZone) .. "_Fight",option);
			--player:levelRestriction(50);
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
		SetServerVariable("[BF]Mission_5-2_Enter",0);
	end
	
end;
