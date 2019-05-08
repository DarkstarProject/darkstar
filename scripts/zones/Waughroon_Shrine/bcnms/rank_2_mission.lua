-----------------------------------
-- Area: Waughroon Shrine
-- Name: Mission Rank 2
-- !pos -345 104 -260 144
-----------------------------------

require("scripts/globals/battlefield")
local ID = require("scripts/zones/Waughroon_Shrine/IDs");

-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

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
        if (player:hasCompletedMission(player:getNation(),5)) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
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
        if ((player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.JOURNEY_TO_BASTOK2 or
        player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_THREE_KINGDOMS_BASTOK2) and
        player:getVar("MissionStatus") == 10) then
            player:addKeyItem(dsp.ki.KINDRED_CREST);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.KINDRED_CREST);
            player:setVar("MissionStatus",11);
        end
    end

end;
