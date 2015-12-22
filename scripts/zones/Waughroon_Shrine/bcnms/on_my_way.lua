-----------------------------------
-- Area: Waughroon Shrine
-- Name: Mission Rank 7-2 (Bastok)
-- @pos -345 104 -260 144
-----------------------------------
package.loaded["scripts/zones/Waughroon_Shrine/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Waughroon_Shrine/TextIDs");

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
        if (player:hasCompletedMission(BASTOK,ON_MY_WAY)) then
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,3,1);
        else
            player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,3,0);
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
        if ((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 2)) then
            player:addKeyItem(LETTER_FROM_WEREI);
            player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_WEREI);
            player:setVar("MissionStatus",3);
        end
    end
    
end;