-----------------------------------
-- Area: Xarcabard
--  NPC: Perennial Snow
-- Involved in Quests: The Circle of Time
-- !pos 339 0 -379 112
-----------------------------------
local ID = require("scripts/zones/Xarcabard/IDs")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local circleOfTime = player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.THE_CIRCLE_OF_TIME)

    -- CIRCLE OF TIME (Bard AF3)
    if circleOfTime == QUEST_ACCEPTED and player:getVar("circleTime") == 3 then
        if player:getVar("star_ringburied") == 0 then
            player:startEvent(3)
        elseif os.time() > player:getVar("star_ringburied") then
            player:startEvent(2)
        else
            player:messageSpecial(ID.text.PERENNIAL_SNOW_WAIT, 225)
        end

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.PERENNIAL_SNOW_DEFAULT)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 3 then
        player:setVar("star_ringburied", os.time() + 60) -- wait 1 minute
    elseif csid == 2 then
        player:setVar("star_ringburied", 0)
        player:setVar("circleTime", 4)
    end
end
