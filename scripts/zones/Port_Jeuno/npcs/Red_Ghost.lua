-----------------------------------
-- Area: Port Jeuno
--  NPC: Red Ghost
-- Standard Info NPC
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/pathfind")
-----------------------------------

local path =
{
    -96.823616, 0.001, -3.722488,
    -96.761887, 0.001, -2.632236,
    -96.698341, 0.001, -1.490001,
    -96.636963, 0.001, -0.363672,
    -96.508736, 0.001,  2.080966,
    -96.290009, 0.001,  6.895948,
    -96.262505, 0.001,  7.935584,
    -96.282127, 0.001,  6.815756,
    -96.569176, 0.001, -7.781419,
    -96.256729, 0.001,  8.059505,
    -96.568405, 0.001, -7.745419,
    -96.254066, 0.001,  8.195477,
    -96.567200, 0.001, -7.685426
--    -97, 0, -4,
--    -97, 0,  8,
--    -97, 0, -8,
}

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(dsp.path.first(path))
    onPath(npc)
end

function onPath(npc)
    dsp.path.patrol(npc, path)
    if not npc:isFollowingPath() then
        npc:pathThrough(dsp.path.first(path), dsp.path.flag.NONE)
    end
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local WildcatJeuno = player:getCharVar("WildcatJeuno")
    npc:clearPath() -- Clear path and stop moving!

    if
        player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED
        and not player:getMaskBit(WildcatJeuno, 15)
    then
        player:startEvent(314)
    else
        player:startEvent(34)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option,npc)
    if csid == 314 then
        player:setMaskBit(player:getCharVar("WildcatJeuno"), "WildcatJeuno", 15, true)
    end

    -- Resume pathing
    onPath(npc)
end
