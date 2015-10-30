-----------------------------------
-- Area: Monarch Linn
-- Name: Ancient Vows
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/missions");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBcnmRegister(player,instance)

end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBcnmEnter(player,instance)

end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBcnmLeave(player,instance,leavecode)
--printf("leavecode: %u",leavecode);
	
	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then
            player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,0);
        else
            player:startEvent(0x7d01,0,0,0,instance:getTimeInside(),0,0,1);
		end
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end
	
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)

	if (csid == 0x7d01) then
    	player:addExp(1000);
		player:addTitle(TAVNAZIAN_TRAVELER); 
        if (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2) then
            player:setVar("VowsDone",1);
            player:setVar("PromathiaStatus",0);
            player:completeMission(COP,ANCIENT_VOWS);
            player:addMission(COP,THE_CALL_OF_THE_WYRMKING);
            player:setPos(694,-5.5,-619,74,107); -- To South Gustaberg 
        end
    end
end;