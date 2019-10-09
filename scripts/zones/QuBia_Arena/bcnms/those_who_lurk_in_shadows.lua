-----------------------------------
-- Those Who Lurk in Shadows (III)
-- Qu'Bia Arena mission battlefield
-----------------------------------
local ID = require("scripts/zones/QuBia_Arena/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if player:hasKeyItem(dsp.ki.MARK_OF_SEED) then
        player:delKeyItem(dsp.ki.MARK_OF_SEED)
    end
    if leavecode == dsp.battlefield.leaveCode.WON then
        player:addExp(700)
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:getCurrentMission(ACP) ~= dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        if player:getCurrentMission(ACP) == dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III then
            player:completeMission(ACP, dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III)
            player:addMission(ACP, dsp.mission.id.acp.REMEMBER_ME_IN_YOUR_DREAMS)
        end
        if not player:hasKeyItem(dsp.ki.IVORY_KEY) and player:getCurrentMission(ACP) >= dsp.mission.id.acp.THOSE_WHO_LURK_IN_SHADOWS_III then
            player:setCharVar("LastIvoryKey", os.date("%j"))
            player:addKeyItem(dsp.ki.IVORY_KEY)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.IVORY_KEY)
        end
    end
end
