-----------------------------------
-- Area: Navukgo Execution Chamber
-- BCNM: TOAU-22 Shield of Diplomacy
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/keyitems");
----------------------------------------

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end


function onBattlefieldRegister(player,battlefield)
    local baseID = 17039401 + (battlefield:getArea() - 1) * 2
    local pos = GetMobByID(baseID):getSpawnPos();

    local karababa  = battlefield:insertEntity(2157, true);
    karababa:setSpawn(pos.x, pos.y, pos.z, 0);
    karababa:spawn();
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
        if (player:hasCompletedMission(TOAU,dsp.mission.id.toau.SHIELD_OF_DIPLOMACY)) then
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

    if csid == 32001 and player:getCurrentMission(TOAU) == dsp.mission.id.toau.SHIELD_OF_DIPLOMACY then
        player:completeMission(TOAU,dsp.mission.id.toau.SHIELD_OF_DIPLOMACY);
        player:setVar("AhtUrganStatus",0);
        player:addMission(TOAU,dsp.mission.id.toau.SOCIAL_GRACES);
    end

end;
