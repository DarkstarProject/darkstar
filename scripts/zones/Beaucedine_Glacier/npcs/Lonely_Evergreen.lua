-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Lonely Evergreen
-- Type: AMK
-- !pos -161.5 -79 178.7
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER
    local hasMogbomb = player:hasKeyItem(dsp.ki.POCKET_MOGBOMB)

    if hasMogbomb then
        player:startEvent(502, dsp.ki.POCKET_MOGBOMB, dsp.ki.TRIVIA_CHALLENGE_KUPON)
    elseif youCouldBeAWinner and player:getVar("AMK") == 1 then
        player:startEvent(504)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 502 then
        player:delKeyItem(dsp.ki.POCKET_MOGBOMB)
        npcUtil.giveKeyItem(player, dsp.ki.TRIVIA_CHALLENGE_KUPON)
        player:setVar("AMK", 4)
    elseif csid == 504 then
        player:setVar("AMK", 2)
    end
end
