-----------------------------------
-- Area: Port Jeuno
-- !pos: -97 0 -4 246
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs")
require("scripts/globals/pathfind")
require("scripts/globals/quests")
-----------------------------------

local path =
{
-97, 0, -4,
-96, 0, 8,
-97, 0, -8,
}

function onSpawn(npc)
    npc:initNpcAi()
    npc:setPos(dsp.path.first(path))
    onPath(npc)
end

function onPath(npc)
    dsp.path.patrol(npc, path)
    if npc:isFollowingPath() == false then
        npc:pathThrough(dsp.path.first(path), PATHFLAG_WALK)
    end
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno")
    local FellowQuest = player:getVar("[Quest]Unlisted_Qualities")
    local FellowName = player:getFellowValue("fellowNameId")
    if player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,15) == false then
        player:startEvent(314)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and player:getMaskBit(FellowQuest,1) == false then
        player:startEvent(320,0,0,0,0,0,0,0,FellowName)
    else
        player:startEvent(34)
    end
    -- wait until event is over
    npc:wait()
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option,npc)
    if csid == 314 then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",15,true)
    elseif csid == 320 then
        local FellowLook = player:getFellowValue("look")
        local personality = {4,8,12,16,40,44,20,24,28,32,36,48}
        player:setFellowValue("look", FellowLook + bit.lshift(personality[option+1],8))
        player:setFellowValue("personality", personality[option+1])
        player:setMaskBit(player:getVar("[Quest]Unlisted_Qualities"),"[Quest]Unlisted_Qualities",1,true)
    end
--[[
Adventuring Fellow Personality Options:
    Male:
        0   Sullen
        1   Passionate
        2   Calm and collected
        3   Serious
        4   Childish
        5   Suave
    Female:
        6   Sisterly
        7   Lively
        8   Agreeable
        9   Naive
        10  Serious
        11  Domineering
--]]

    npc:wait(0)

end