-----------------------------------
-- Area: Cloister of Tides
-- NPC:  Water Protocrystal
-- Involved in Quests: Trial by Water, Trial Size Trial by Water
-- @zone 211
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/zones/Cloister_of_Tides/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);
	
	if(player:getXPos() >= 550 and player:getXPos() <= 570 and player:getZPos() >= 554 and player:getZPos() <= 571) then 
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(trade:hasItemQty(1549,1) == true) then
				bcnmFight = bcnmFight + 4; -- 1=Trial by Water, 2=, 3=1+2, 4=Trial Size Trial by Water, 5=1+4, 6=2+4, 7=1+2+4, etc.
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
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	pZone = player:getZone();
	player:setVar(tostring(pZone) .. "_Ready",0);
	player:setVar(tostring(pZone) .. "_Field",0);

	if(player:getXPos() >= 550 and player:getXPos() <= 570 and player:getZPos() >= 554 and player:getZPos() <= 571) then 
		if(getAvailableBattlefield(pZone) ~= 255) then
			local bcnmFight = 0;

			if(player:hasKeyItem(TUNING_FORK_OF_WATER)) then
				bcnmFight = bcnmFight + 1; -- 1=Trial by Water, 2=, 3=1+2, 4=Trial Size Trial by Water, 5=1+4, 6=2+4, 7=1+2+4, etc.
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
			local bcnmFight = 0;
			player:setVar(zoneReady,player:getVar(zoneReady)+1);

			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				player:updateEvent(2,bcnmFight,0,500,6,0);
			else
				player:updateEvent(0,0,0,0,0,0);
			end
		elseif(option == 255) then
			player:setVar(tostring(pZone) .. "_Field",readyField);
		end
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);

	pZone = player:getZone();

	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 35) then
			player:startEvent(0x7d02);
		else
			bcnmSpawn(player:getVar(tostring(pZone) .. "_Field"),option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,2,0,1800); -- 2 for battlefield.lua
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
		player:setVar(tostring(pZone) .. "_Runaway",0)
	end
end;