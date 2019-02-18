-----------------------------------
-- Area: La Theine Plateau
--  NPC: Vicorpasse
-- Involved in Mission: The Rescue Drill
-- Involved in Quest:   A Timely Visit
-- !pos -344 37 266 102
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    if player:getCurrentMission(SANDORIA) == THE_RESCUE_DRILL then
        local MissionStatus = player:getVar("MissionStatus")

        if MissionStatus == 4 then
            player:startEvent(108)
        elseif MissionStatus >= 5 and MissionStatus <= 7 then
            player:showText(npc, ID.text.RESCUE_DRILL + 19)
        elseif MissionStatus == 8 then
            player:showText(npc, ID.text.RESCUE_DRILL + 21)
        elseif MissionStatus == 9 then
            player:showText(npc, ID.text.RESCUE_DRILL + 26)
        elseif MissionStatus == 10 then
            player:startEvent(115)
        elseif MissionStatus == 11 then
            player:showText(npc, ID.text.RESCUE_DRILL + 30)
        else
            player:startEvent(5)
        end
    elseif player:getQuestStatus(SANDORIA, A_TIMELY_VISIT) == QUEST_ACCEPTED then
        local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

        if aTimelyVisitStep == 1 then
            player:startEvent(2) -- I have spoken with Sir Elmemague.  Narvecaint is currently monitoring the suspect's movements from the entrance to the caves.
        elseif aTimelyVisitStep >= 2 and aTimelyVisitStep <= 9 then
            player:startEvent(3) -- Well, I suppose we can regard this as an adequate performance.  It will still be necessary to further refine our soldiers' training... However, this was an excellent opportunity for the knights to practive their skills in a real-life situation.
        elseif aTimelyVisitStep == 10 then
            player:startEvent(4) -- Another chance to test the effectiveness of our training in almost exactly the same setting!  This time, I expect perfect coordination and execution from my men.
        elseif aTimelyVisitStep == 11 then
            player:startEvent(5) -- Hmm, there is still room for improvement.  they need to work on communication to facilitate speedier responses... Lady Curilla will not be pleased.
        else
            -- Technically impossible.  If the quest is accepted, this will have a non-zero value.
        end
    else
        player:startEvent(5)
    end

end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    if csid == 108 then
        player:setVar("MissionStatus", 5)
    elseif csid == 115 then
        player:addKeyItem(dsp.ki.RESCUE_TRAINING_CERTIFICATE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.RESCUE_TRAINING_CERTIFICATE)
        player:setVar("theRescueDrillRandomNPC", 0)
        player:setVar("MissionStatus", 11)
    end

end
