-----------------------------------
-- Area: Navukgo Execution Chamber
-- BCNM: BLU-AF2 Omens
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
----------------------------------------

function onBattlefieldInitialise(battlefield)
end

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
    local players = battlefield:getPlayers()
    if #players ==  4 then GetMobByID(17039375):spawn(); end
    if #players ==  8 then GetMobByID(17039376):spawn(); end
    if #players == 12 then GetMobByID(17039377):spawn(); end
    if #players == 14 then GetMobByID(17039378):spawn(); end
    if #players == 16 then GetMobByID(17039379):spawn(); end
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), 0)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:setCharVar("BluAf2CS",2)
    end
end