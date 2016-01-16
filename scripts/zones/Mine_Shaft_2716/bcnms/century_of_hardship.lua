-----------------------------------
-- Area: Mine_Shaft_2716
-- Name: century_of_hardship
-- bcnmID : 736 
-- inst 2 -54 -1 -100
-- inst 3 425 -121 -99         
-----------------------------------
package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/zones/Mine_Shaft_2716/TextIDs");

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
    
    if (leavecode == 2) then -- play end CS. Need time and battle id for record keeping + storage
        if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 5) then
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0);    
            player:setVar("COP_Louverance_s_Path",6);
        else
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,1);            
        end
    elseif (leavecode == 4) then
        player:startEvent(0x7d02);
    end
    
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);    
    if (csid == 0x7d01) then
        player:addExp(1000);
    end
end;