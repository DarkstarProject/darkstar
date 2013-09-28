-----------------------------------
-- Area: Monarch Linn
-- Name: Ancient Vows
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/missions");

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
	-- initialize timers if they don't already exist
	-- a random seed of 30 to 100 seconds is added to mix up the changes
	-- Changes should be ~60 seconds apart, although I've seen one ~50
	if(AncientVowsFormTimer == nil) then
		AncientVowsFormTimer = {};
		-- Instance 1
		AncientVowsFormTimer[16904193] = {};
		AncientVowsFormTimer[16904194] = {};
		AncientVowsFormTimer[16904195] = {};
		-- Instance 2
		AncientVowsFormTimer[16904196] = {};
		AncientVowsFormTimer[16904197] = {};
		AncientVowsFormTimer[16904198] = {};
		-- Instance 3
		AncientVowsFormTimer[16904199] = {};
		AncientVowsFormTimer[16904200] = {};
		AncientVowsFormTimer[16904201] = {};
	end
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function OnBcnmEnter(player,instance)

end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function OnBcnmLeave(player,instance,leavecode)
--printf("leavecode: %u",leavecode);
	
	if(leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
	    player:addExp(1000);
		player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0);
		if (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then
			player:setVar("PromathiaStatus",0);
			player:completeMission(COP,ANCIENT_VOWS);
			player:addMission(COP,THE_CALL_OF_THE_WYRMKING);
		end
		player:setVar("VowsDone",1);
	elseif(leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)

	if(csid == 0x7d01)then
		player:addTitle(TAVNAZIAN_TRAVELER); 
		player:setPos(694,-5.5,-619,74,107); --tp to South Gustaberg 
	end

end;