-----------------------------------
-- Area: Temenos
-- Name: Temenos Eastern Tower
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Temenos/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    SetServerVariable("[Temenos_Eastern_Tower]Time", battlefield:getTimeLimit()/60)
    dsp.limbus.handleDoors(battlefield)
    dsp.limbus.setupArmouryCrates(battlefield:getID())
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[Temenos_Eastern_Tower]Time", battlefield:getRemainingTime()/60)
    end
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(dsp.ki.COSMOCLEANSE)
    player:delKeyItem(dsp.ki.WHITE_CARD)
    player:setCharVar("Cosmo_Cleanse_TIME", os.time())
end

function onBattlefieldDestroy(battlefield)
    dsp.limbus.handleDoors(battlefield, true)
    SetServerVariable("[Temenos_Eastern_Tower]Time", 0)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end