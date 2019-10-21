-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 1st Floor
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    limbus.hideTemenosDoors(Central_Temenos_1st_Floor)
    limbus.hideArmouryCrates(Central_Temenos_1st_Floor, TEMENOS)
end

function onBattlefieldTick(battlefield, tick)
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