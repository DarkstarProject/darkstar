-----------------------------------
-- Area: Appolyon
-- Name: NW Apollyon
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Apollyon/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("randomMob", ID.mob.APOLLYON_NW_MOB[1]+math.random(1,8))
    battlefield:setLocalVar("loot", 1)
    SetServerVariable("[NW_Apollyon]Time", battlefield:getTimeLimit()/60)
    limbus.hideDoors(battlefield:getID())
    limbus.hideArmouryCrates(battlefield:getID())
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[NW_Apollyon]Time", battlefield:getRemainingTime()/60)
    end
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(dsp.ki.COSMOCLEANSE)
    player:delKeyItem(dsp.ki.RED_CARD)
    player:setCharVar("Cosmo_Cleanse_TIME", os.time())
end

function onBattlefieldDestroy(battlefield)
    limbus.hideDoors(battlefield:getID(), true)
    SetServerVariable("[NW_Apollyon]Time", 0)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    player:messageSpecial(ID.text.HUM+1)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end