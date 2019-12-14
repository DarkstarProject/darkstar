-----------------------------------
-- Area: Temenos
-- Name: Central Temenos Basement
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Temenos/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("lootSpawned", 1)
    SetServerVariable("[Central_Temenos_Basement]Time", battlefield:getTimeLimit()/60)
    limbus.hideDoors(battlefield:getID())
    limbus.hideArmouryCrates(battlefield:getID())
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+3)
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+6)
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+14)
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+17)
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+21)
    DespawnMob(ID.mob.TEMENOS_C_MOB[5]+27)
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[Central_Temenos_Basement]Time", battlefield:getRemainingTime()/60)
    end
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(dsp.ki.COSMOCLEANSE)
    player:delKeyItem(dsp.ki.WHITE_CARD)
    player:setCharVar("Cosmo_Cleanse_TIME", os.time())
end

function onBattlefieldDestroy(battlefield)
    limbus.hideDoors(battlefield:getID(), true)
    SetServerVariable("[Central_Temenos_Basement]Time", 0)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end