-----------------------------------
-- Area: Temenos
-- Name: Central Temenos 4th Floor
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    HideArmouryCrates(Central_Temenos_4th_Floor, TEMENOS)
    HideTemenosDoor(Central_Temenos_4th_Floor)
    for n = 16928986, 16928988, 1 do
        if GetMobByID(n):isSpawned() then DespawnMob(n) end
    end
    for n = 16928991, 16929003, 1 do
        if GetMobByID(n):isSpawned() then DespawnMob(n) end
    end
    SpawnCofferTemenosCFloor4()
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