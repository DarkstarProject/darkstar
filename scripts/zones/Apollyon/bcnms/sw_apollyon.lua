-----------------------------------
-- Area: Appolyon
-- Name: SW Apollyon
-----------------------------------
require("scripts/globals/limbus")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
local ID = require("scripts/zones/Apollyon/IDs")

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("lootSpawned", 1)
    SetServerVariable("[SW_Apollyon]Time", battlefield:getTimeLimit()/60)
    local random = math.random(0, 7)
    battlefield:setLocalVar("timePH", ID.npc.APOLLYON_SW_CRATE[3]+random)
    battlefield:setLocalVar("restorePH", ID.npc.APOLLYON_SW_CRATE[3]+random+1)
    battlefield:setLocalVar("itemPH", ID.npc.APOLLYON_SW_CRATE[3]+random+2)
    limbus.hideArmouryCrates(battlefield:getID())
end

function onBattlefieldTick(battlefield, tick)
    if battlefield:getRemainingTime() % 60 == 0 then
        SetServerVariable("[SW_Apollyon]Time", battlefield:getRemainingTime()/60)
    end
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    player:delKeyItem(dsp.ki.COSMOCLEANSE)
    player:delKeyItem(dsp.ki.RED_CARD)
    player:setCharVar("Cosmo_Cleanse_TIME", os.time())
    if battlefield:getLocalVar("raceF1") == 0 then
        battlefield:setLocalVar("raceF1", player:getRace())
    end
end

function onBattlefieldDestroy(battlefield)
    SetServerVariable("[SW_Apollyon]Time", 0)
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