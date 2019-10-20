-----------------------------------
-- Area: Temenos
-- Name: Temenos Eastern Tower
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    if GetMobByID(16928844):isSpawned() then DespawnMob(16928844) end
    if GetMobByID(16928853):isSpawned() then DespawnMob(16928853) end
    if GetMobByID(16928862):isSpawned() then DespawnMob(16928862) end
    if GetMobByID(16928871):isSpawned() then DespawnMob(16928871) end
    if GetMobByID(16928880):isSpawned() then DespawnMob(16928880) end
    if GetMobByID(16928889):isSpawned() then DespawnMob(16928889) end
    if GetMobByID(16928894):isSpawned() then DespawnMob(16928894) end
    HideArmouryCrates(Temenos_Eastern_Tower, TEMENOS)
    HideTemenosDoor(Temenos_Eastern_Tower)
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