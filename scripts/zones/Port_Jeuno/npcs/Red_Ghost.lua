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
    -97, 0, -4,
    -97, 0,  8,
    -97, 0, -8,
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
    player:setLocalVar("npcID",npc:getID())
    npc:speed(0)
    npc:timer(300000, function(npc) npc:speed(12) end) -- Creates timer to prevent PC DCing which makes NPC stop patrol
    local WildcatJeuno = player:getCharVar("WildcatJeuno");
    if (player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.LURE_OF_THE_WILDCAT) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,15) == false) then
        player:startEvent(314)
    else
        player:startEvent(34)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option,npc)
    if (csid == 314) then
        player:setMaskBit(player:getCharVar("WildcatJeuno"),"WildcatJeuno",15,true)
    end
    GetNPCByID(player:getLocalVar("npcID")):speed(12)
end
