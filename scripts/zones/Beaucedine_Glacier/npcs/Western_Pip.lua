-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Western Pip
-- Type: AMK
-- !pos X -89.7590  Y -61.2858  Z -109.5739
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER

    if youCouldBeAWinner and player:getVar("AMK") == 3 then
        player:startEvent(510)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
