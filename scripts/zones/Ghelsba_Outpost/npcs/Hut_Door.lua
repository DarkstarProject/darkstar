-----------------------------------
-- Area: Ghelsba Outpost
-- NPC:  Hut Door
-- Involved in Quest: The Holy Crest
-- @zone 140
-- @pos -162 -11 78
-----------------------------------
package.loaded["scripts/zones/Ghelsba_Outpost/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/bcnm");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Ghelsba_Outpost/TextIDs");

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
	MissionStatus = player:getVar("MissionStatus");
	
	if(player:hasKeyItem(ORCISH_HUT_KEY)) then
		if(player:hasCompletedMission(SANDORIA,SAVE_THE_CHILDREN)) then
			player:startEvent(0x0003);
		else
			player:startEvent(0x0037);
		end
	elseif(getAvailableBattlefield(pZone) ~= 255) then
		local bcnmFight = 0;
		
		if((player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and (MissionStatus == 2 or MissionStatus == 3))) then 
			bcnmFight = bcnmFight + 1; end
		if(player:hasKeyItem(DRAGON_CURSE_REMEDY)) then 
			bcnmFight = bcnmFight + 2; end
		
		if(bcnmFight >= 0) then
			player:startEvent(0x7d00,0,0,0,bcnmFight);
		end
	else
		player:messageSpecial(YOU_CANNOT_ENTER_THE_BATTLEFIELD);
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
			player:setVar(zoneReady,player:getVar(zoneReady) + 1);
			
			if((player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and (MissionStatus == 2 or MissionStatus == 3))) then 
				bcnmFight = bcnmFight + 0;
			elseif(player:hasKeyItem(DRAGON_CURSE_REMEDY)) then 
				bcnmFight = bcnmFight + 1;
			end
			
			player:setVar(tostring(pZone) .. "_Field",bcnmFight+1);
			
			if(player:getVar(zoneReady) == readyField and readyField ~= 255) then
				player:updateEvent(2,bcnmFight,0,100,6,0);
			else
				player:updateEvent(0,0,0,0,0,0);
			end
		elseif(option == 255) then
			
		end
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
printf("onFinish CSID: %u",csid);
printf("onFinish RESULT: %u",option);
	
	pZone = player:getZone();
	
	if(csid == 0x7d00 and option ~= 1073741824 and option ~= 0) then
		if(option == 35) then
			player:startEvent(0x7d02);
		elseif(option == 100) then
			bcnmSpawn(1,option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,1,0,600,0);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_Fight",option);
		elseif(option == 101) then
			bcnmSpawn(1,option,pZone);
			player:addStatusEffect(EFFECT_BATTLEFIELD,2,0,1800,0);
			player:setVar("BCNM_Timer", os.time());
			player:setVar(tostring(pZone) .. "_Fight",option);
		end
	elseif(csid == 0x0003 or csid == 0x0037) then
		player:delKeyItem(ORCISH_HUT_KEY);
		player:setVar("MissionStatus",5);
	end
	
end;