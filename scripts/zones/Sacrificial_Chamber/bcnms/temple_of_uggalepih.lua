-----------------------------------
-- Area: Sacrificial Chamber
-- Name: Zilart Mission 4
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/battlefield")
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Sacrificial_Chamber/IDs");

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
-- print("leave code "..leavecode);

    if leavecode == dsp.battlefield.leaveCode.WON then -- play end CS. Need time and battle id for record keeping + storage

        local name, clearTime, partySize = battlefield:getRecord()
        if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end

end;

function onEventUpdate(player,csid,option)
    -- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 32001) then
        player:addTitle(dsp.title.BEARER_OF_THE_WISEWOMANS_HOPE);
        if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH) then
            player:startEvent(7);
        end
    elseif (csid == 7) then
        player:startEvent(8);
    elseif (csid == 8) then
        if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH) then
            player:delKeyItem(dsp.ki.SACRIFICIAL_CHAMBER_KEY);
            player:addKeyItem(dsp.ki.DARK_FRAGMENT);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.DARK_FRAGMENT);
            player:completeMission(ZILART,dsp.mission.id.zilart.THE_TEMPLE_OF_UGGALEPIH);
            player:addMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE);
        end
    end

end;