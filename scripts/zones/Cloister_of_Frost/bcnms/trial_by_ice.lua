-----------------------------------
-- Area: Cloister of Frost
-- BCNM: Trial by Ice
-----------------------------------
local ID = require("scripts/zones/Cloister_of_Frost/IDs")
require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    tpz.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == tpz.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedQuest(SANDORIA, tpz.quest.id.sandoria.TRIAL_BY_ICE)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == tpz.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:delKeyItem(tpz.ki.TUNING_FORK_OF_ICE)
        player:addKeyItem(tpz.ki.WHISPER_OF_FROST)
        player:addTitle(tpz.title.HEIR_OF_THE_GREAT_ICE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, tpz.ki.WHISPER_OF_FROST)
    end
end
