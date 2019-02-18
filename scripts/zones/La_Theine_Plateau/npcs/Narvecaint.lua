-----------------------------------
-- Area: La Theine Plateau
--  NPC: Narvecaint
-- Involved in Mission: The Rescue Drill
-- Involved in Quest:   A Timely Visit
-- !pos -263 22 129 102
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)

    if player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL then
        local MissionStatus = player:getVar("MissionStatus")

        if MissionStatus == 6 then
            player:startEvent(107)
        elseif MissionStatus == 7 then
            player:showText(npc, ID.text.RESCUE_DRILL + 14)
        elseif MissionStatus == 8 then
            player:showText(npc, ID.text.RESCUE_DRILL + 21)
        elseif MissionStatus >= 9 then
            player:showText(npc, ID.text.RESCUE_DRILL + 26)
        else
            player:showText(npc, ID.text.RESCUE_DRILL)
        end
    elseif player:getQuestStatus(SANDORIA, A_TIMELY_VISIT) == QUEST_ACCEPTED then
        local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

        if aTimelyVisitStep == 1 then
            player:startEvent(0)
        elseif aTimelyVisitStep >= 2 and aTimelyVisitStep <= 9 then
            player:startEvent(6)
        elseif aTimelyVisitStep == 10 then
            player:startEvent(1)
        elseif aTimelyVisitStep == 11 then
            player:startEvent(8)
        else
            -- Technically impossible.  If the quest is accepted, this will have a non-zero value.
        end
    else
        player:showText(npc, ID.text.NOTHING_TO_REPORT)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)

    if csid == 107 then
        player:setVar("MissionStatus", 7)
    elseif csid == 0 then
        player:setVar("aTimelyVisitStep", 2)
    elseif csid == 1 then
        player:setVar("aTimelyVisitStep", 11)
    end

end