-----------------------------------
-- Area: Buburimu_Peninsula
-- NPC:  Hieroglyphics
-- Dynamis Buburimu_Dunes Enter
-- @pos 117 -10 133 172 118
-----------------------------------
package.loaded["scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/dynamis");
require("scripts/globals/missions");
require("scripts/zones/Buburimu_Peninsula/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)  

	if (player:hasCompletedMission(COP,DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1) then
		local firstDyna = 0;
		local realDay = os.time();
		local dynaWaitxDay = player:getVar("dynaWaitxDay");
		
		if (checkFirstDyna(player,8)) then 
			 player:startEvent(0x002B);
		elseif (player:getMainLvl() < DYNA_LEVEL_MIN) then
			player:messageSpecial(PLAYERS_HAVE_NOT_REACHED_LEVEL,DYNA_LEVEL_MIN);
		
		elseif ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaBuburimu]UniqueID")) then
			
			player:startEvent(0x0016,8,0,0,BETWEEN_2DYNA_WAIT_TIME,32,VIAL_OF_SHROUDED_SAND,4236,4237);
		else
			dayRemaining = math.floor(((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) - realDay)/3456);
			--printf("dayRemaining : %u",dayRemaining );
			
			player:messageSpecial(YOU_CANNOT_ENTER_DYNAMIS,dayRemaining,8);
		end
	else
		player:messageSpecial(MYSTERIOUS_VOICE); 
	end
	
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
	
	if (csid == 0x0021) then
	    if (checkFirstDyna(player,8)) then
			player:setVar("Dynamis_Status",player:getVar("Dynamis_Status") + 256);
		end
	elseif (csid == 0x0016 and option == 0) then
		player:setPos(155,-1,-169,170,0x28);
	end
	
end;