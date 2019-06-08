-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Goblin Grenadier
-- Type: Mission NPC
-- !pos -26.283 -60.49 -76.640 111
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local hasNorthlandsMap = player:hasKeyItem(dsp.ki.MAP_OF_THE_NORTHLANDS_AREA)
    local youCouldBeAWinner = player:getCurrentMission(AMK) == dsp.mission.id.amk.A_CHALLENGE_YOU_COULD_BE_A_WINNER

    if hasNorthlandsMap and youCouldBeAWinner and player:getVar("AMK") == 3 then
        player:startEvent(507, 0, 0, 0, dsp.ki.POCKET_MOGBOMB)
        -- TODO: Puzzle Logic
        player:PrintToPlayer("Puzzle not yet implemented, the answer is 0.")
    elseif hasNorthlandsMap and youCouldBeAWinner and player:getVar("AMK") == 2 then
        player:startEvent(508)
    else
        player:startEvent(509)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 508 then
        player:setVar("AMK", 3)
    elseif
        csid == 507 and option == 4 and
        not player:hasKeyItem(dsp.ki.POCKET_MOGBOMB)
    then
        npcUtil.giveKeyItem(player, dsp.ki.POCKET_MOGBOMB)
    end
end
