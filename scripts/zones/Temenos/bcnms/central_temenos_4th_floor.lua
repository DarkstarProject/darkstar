-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 4th Floor
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    SetServerVariable("[1306]Time", 0)
    limbus.hideArmouryCrates(Central_Temenos_4th_Floor, TEMENOS)
    limbus.hideTemenosDoors(Central_Temenos_4th_Floor)
    limbus.spawnArmouryCrates(Central_Temenos_4th_Floor)
end

function onBattlefieldTick(battlefield, tick)
    SetServerVariable("[1306]Time", battlefield:getRemainingTime()/60)
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