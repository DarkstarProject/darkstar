-----------------------------------
-- Area: Cloister of Tremors
-- BCNM: Class Reunion
-----------------------------------
package.loaded["scripts/zones/Cloister_of_Frost/TextIDs"] = nil;
-------------------------------------

require("scripts/zones/Cloister_of_Frost/TextIDs");

-----------------------------------

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
-- print("leave code "..leavecode);

	if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
		player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,2);
	elseif (leavecode == 4) then
		player:startEvent(0x7d02);
	end

end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
	
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

	if (csid == 0x7d01 and player:getVar("ClassReunionProgress") == 5) then
		player:setVar("ClassReunionProgress",6);
	end;
end;
