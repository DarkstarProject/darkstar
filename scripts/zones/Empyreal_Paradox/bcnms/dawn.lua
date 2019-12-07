-----------------------------------
-- Area: Empyreal_Paradox
-- Name: Dawn
-- instance 1 Promathia !pos -520 -119 524
-- instance 2 Promathia !pos 521 -0.500 517
-- instance 3 Promathia !pos -519 120 -520
-----------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldInitialise(battlefield)
    battlefield:setLocalVar("loot", 1)
    battlefield:setLocalVar("lootSpawned", 1)
    local baseID = ID.mob.PROMATHIA_OFFSET + (battlefield:getArea() - 1) * 2
    local pos = GetMobByID(baseID):getSpawnPos()

    local prishe = battlefield:insertEntity(14166, true, true)
    prishe:setSpawn(pos.x - 6, pos.y, pos.z - 21.5, 192)
    prishe:spawn()

    local selhteus = battlefield:insertEntity(14167, true, true)
    selhteus:setSpawn(pos.x + 10, pos.y, pos.z - 17.5, 172)
    selhteus:spawn()
end

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldDestroy(battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(6)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 6 then
        player:setPos(539, 0, -593, 192)
        player:addTitle(dsp.title.AVERTER_OF_THE_APOCALYPSE)
        player:startEvent(3)
        if player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("PromathiaStatus") == 2 then
            player:addKeyItem(dsp.ki.TEAR_OF_ALTANA)
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.TEAR_OF_ALTANA)
            player:setCharVar("Promathia_kill_day", tonumber(os.date("%j")))
            player:setCharVar("PromathiaStatus", 3)
        end
    end
end
