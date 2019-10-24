-----------------------------------
-- Area: Temenos
-- Name: Temenos Northern Tower
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    SetServerVariable("[Temenos_Northern_Tower]Time", 0)
    limbus.hideTemenosDoors(Temenos_Northern_Tower)
    limbus.hideArmouryCrates(Temenos_Northern_Tower, TEMENOS)
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[Temenos_Northern_Tower]Time", battlefield:getRemainingTime()/60)
    end
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(dsp.ki.COSMOCLEANSE)
    player:delKeyItem(dsp.ki.WHITE_CARD)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end