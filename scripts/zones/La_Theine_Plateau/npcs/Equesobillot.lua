-----------------------------------
-- Area: La Theine Plateau
--  NPC: Equesobillot
-- Involved in Mission: The Rescue Drill
-- Involved in Quest:   A Timely Visit
-- !pos -287 9 284 102
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

        if MissionStatus == 2 then
            player:startEvent(101)
        elseif MissionStatus == 3 then
            player:showText(npc, ID.text.RESCUE_DRILL + 3)
        elseif MissionStatus == 8 then
            if player:getVar("theRescueDrillRandomNPC") == 2 then
                player:startEvent(112)
            else
                player:showText(npc, ID.text.RESCUE_DRILL + 21)
            end
        elseif MissionStatus == 9 then
            if player:getVar("theRescueDrillRandomNPC") == 2 then
                player:showText(npc, ID.text.RESCUE_DRILL + 25)
            else
                player:showText(npc, ID.text.RESCUE_DRILL + 26)
            end
        elseif MissionStatus >= 10 then
            player:showText(npc, ID.text.RESCUE_DRILL + 30)
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

    if csid == 101 then
        player:setVar("MissionStatus",3)
    elseif csid == 112 then
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, 16535) -- Bronze Sword
        else
            player:addItem(16535)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 16535) -- Bronze Sword
            player:setVar("MissionStatus",9)
        end
    end

end
