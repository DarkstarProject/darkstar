-----------------------------------
-- Area: Sealion's Den
-- Name: one_to_be_feared
-- bcnmID : 992
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onBcnmRegister(player, instance)
end

function onBcnmEnter(player, instance)
end

function onBcnmLeave(player, instance, leavecode)
    if leavecode == 2 then
        if player:getCurrentMission(COP) == ONE_TO_BE_FEARED and player:getVar("PromathiaStatus") == 2 then
            player:startEvent(32001, 1, 1, 1, instance:getTimeInside(), 1, 0, 0)
            player:setVar("PromathiaStatus", 0)
            player:completeMission(COP, ONE_TO_BE_FEARED)
            player:addMission(COP, CHAINS_AND_BONDS)
        else
            player:startEvent(32001, 1, 1, 1, instance:getTimeInside(), 1, 0, 1)
        end
    elseif leavecode == 4 then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 then
        player:addExp(1500)
        player:setPos(438, 0, -18, 11, 24) -- Lufaise
    end
end
