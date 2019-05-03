-----------------------------------
-- Area: Horlais Peak
-- Name: Mission Rank 2
-- !pos -509 158 -211 139
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/battlefield")
local ID = require("scripts/zones/Horlais_Peak/IDs");

-----------------------------------
-- Maat Battle in Horlais Peak
-- EXAMPLE SCRIPT
--
-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool,
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

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
        if ((player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.THE_EMISSARY_SANDORIA2 or
        player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_THREE_KINGDOMS_SANDORIA2) and
        player:getVar("MissionStatus") == 9) then
            player:addKeyItem(dsp.ki.KINDRED_CREST);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.KINDRED_CREST);
            player:setVar("MissionStatus",10);
        end
    end

end;
