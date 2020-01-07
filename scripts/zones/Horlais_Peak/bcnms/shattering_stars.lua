-----------------------------------
-- Shattering Stars
-- Horlais Peak Maat fight
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldRegister(player, battlefield)
end

function onBattlefieldEnter(player, battlefield)
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
        if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.SHATTERING_STARS) == QUEST_ACCEPTED and player:getFreeSlotsCount() > 0 then
            npcUtil.giveItem(player, 4181) -- scroll_of_instant_warp
        end

        local pjob = player:getMainJob()
        local maatsCap = player:getCharVar("maatsCap")

        player:setCharVar("maatDefeated", pjob)
        if bit.band(maatsCap, bit.lshift(1, pjob - 1)) ~= 1 then
            player:setCharVar("maatsCap", bit.bor(maatsCap, bit.lshift(1, pjob - 1)))
        end

        player:addTitle(dsp.title.MAAT_MASHER)
    end
end
