-----------------------------------
-- Area: Full Moon Mountain
-- Name: Windurst Mission 9-2
-----------------------------------
require("scripts/globals/missions")
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
    --print("leave code "..leavecode);
    local currentMission = player:getCurrentMission(WINDURST);
    if (leavecode == 2) then
        --printf("win");
        if (currentMission == MOON_READING) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
    --print("bc update csid "..csid.." and option "..option);
end;
    
function onEventFinish(player,csid,option)
    --print("bc finish csid "..csid.." and option "..option);
    local currentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");

    if (csid == 32001) then
        if (currentMission == MOON_READING and MissionStatus == 2) then
            player:setVar("MissionStatus",3);
        end
    end
end;