-----------------------------------
-- Area: Throne Room
-- Name: Mission 9-2
-- @pos -111 -6 0 165
-----------------------------------
package.loaded["scripts/zones/Throne_Room/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Throne_Room/TextIDs");

-----------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function OnBcnmRegister(player,instance)
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
print("leave code "..leavecode);
    
if (leavecode == 2) then 
    if (player:getCurrentMission(BASTOK) == WHERE_TWO_PATHS_CONVERGE) then
    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0);
    else
    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);
    end
elseif (leavecode == 4) then
player:startEvent(0x7d02);
end
end;

function onEventUpdate(player,csid,option)
print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)
print("bc finish csid "..csid.." and option "..option);
player:setVar("BASTOK92",2);
end;