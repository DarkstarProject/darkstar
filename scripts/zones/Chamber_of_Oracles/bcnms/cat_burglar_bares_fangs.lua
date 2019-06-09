-----------------------------------
-- Area: Chamber of Oracles (168)
-- Name: cat_burglar_bares_fangs (BCNM 200)
-- !pos -221 -24 19 206
-----------------------------------
local ID = require("scripts/zones/Chamber_of_Oracles/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
    -- Lose item even if you lose :(
    player:delKeyItem(dsp.ki.NAVARATNA_TALISMAN)
end

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
        if (player:getCurrentMission(AMK) == dsp.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS) then
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
        else
            player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 1)
        end
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002);
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 32001 then
        if player:getCurrentMission(AMK) == dsp.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS then
            player:startEvent(6)
        end
    elseif csid == 6 then
        player:completeMission(AMK,dsp.mission.id.amk.ROAR_A_CAT_BURGLAR_BARES_HER_FANGS)
        player:addMission(AMK,dsp.mission.id.amk.RELIEF_A_TRIUMPHANT_RETURN)
    end
end
