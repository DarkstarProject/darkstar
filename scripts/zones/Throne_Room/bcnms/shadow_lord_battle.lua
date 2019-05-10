-----------------------------------
-- Area: Throne Room
-- Name: Mission 5-2
-- !pos -111 -6 0.1 165
-----------------------------------
local ID = require("scripts/zones/Throne_Room/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
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
        if (player:hasCompletedMission(player:getNation(),15)) then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1);
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(32002);
    end
end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
    -- print("bc finish csid "..csid.." and option "..option);
    if (csid == 32001) then
        if (player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 3) then
            if ((not player:hasCompletedMission(ZILART, dsp.mission.id.zilart.THE_NEW_FRONTIER)) and (player:getCurrentMission(ZILART) ~= dsp.mission.id.zilart.THE_NEW_FRONTIER)) then
                -- Don't add missions we already completed..Players who change nation will hit this.
                player:addMission(ZILART,dsp.mission.id.zilart.THE_NEW_FRONTIER);
            end
            player:startEvent(7);
        end
    elseif (csid==7) then
        player:addKeyItem(dsp.ki.SHADOW_FRAGMENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SHADOW_FRAGMENT);
        player:setVar("MissionStatus",4);
        player:setPos(378, -12, -20, 125, 161);
    end
end;
