-----------------------------------
-- Rank 5 Mission
-- Qu'Bia Arena mission battlefield
-----------------------------------
local ID = require("scripts/zones/QuBia_Arena/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (not player:hasKeyItem(tpz.ki.NEW_FEIYIN_SEAL)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:hasKeyItem(tpz.ki.NEW_FEIYIN_SEAL) then
        player:addKeyItem(tpz.ki.BURNT_SEAL)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.BURNT_SEAL)
        player:setCharVar("MissionStatus", 12)
        player:delKeyItem(tpz.ki.NEW_FEIYIN_SEAL)
    end
end
