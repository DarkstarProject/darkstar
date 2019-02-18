-----------------------------------
-- Area: La Theine Plateau
--  NPC: Laurisse
-- Involved in Mission: The Rescue Drill
-- Involved in Quest:   A Timely Visit
-- !pos -292 28 143 102
-----------------------------------
require("scripts/globals/missions")
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

    if player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL then
        local MissionStatus = player:getVar("MissionStatus")

        if MissionStatus == 5 then
            player:startEvent(106)
        elseif MissionStatus >= 6 and MissionStatus <= 7 then
            player:startEvent(109)
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
            player:showText(npc, ID.text.A_TIMELY_VISIT_1)
        elseif aTimelyVisitStep >= 2 and aTimelyVisitStep <= 9 then
            player:showText(npc, ID.text.A_TIMELY_VISIT_2)
        elseif aTimelyVisitStep == 10 then
            player:showText(npc, ID.text.A_TIMELY_VISIT_3)
        elseif aTimelyVisitStep == 11 then
            player:showText(npc, ID.text.A_TIMELY_VISIT_4)
        else
            -- Technically impossible.  If the quest is accepted, this will have a non-zero value.
        end
    else
        player:showText(npc, ID.text.RESCUE_DRILL)
    end

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 106 then
        player:setVar("MissionStatus", 6)
    end

end
