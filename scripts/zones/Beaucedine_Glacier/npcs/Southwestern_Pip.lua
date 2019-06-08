-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Southwestern Pip
-- Type: AMK
-- !pos 9.7187 -39.1785 -209.7727
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
