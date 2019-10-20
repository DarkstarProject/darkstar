-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 2nd Floor
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    HideTemenosDoor(Central_Temenos_2nd_Floor)
    HideArmouryCrates(Central_Temenos_2nd_Floor, TEMENOS)
    if GetMobByID(16929039):isSpawned() then DespawnMob(16929039) end
    if GetMobByID(16929040):isSpawned() then DespawnMob(16929040) end
    if GetMobByID(16929041):isSpawned() then DespawnMob(16929041) end
    if GetMobByID(16929042):isSpawned() then DespawnMob(16929042) end
    if GetMobByID(16929043):isSpawned() then DespawnMob(16929043) end
    if GetMobByID(16929044):isSpawned() then DespawnMob(16929044) end
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