-----------------------------------
-- Area: Western Adoulin
-- NPC: Dangueubert
-- Type: Standard NPC and Quest NPC
-- !pos 5 0 -136 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")

local quests =
{
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN}
}
quests = dsp.quest.involvedQuests(quests)
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if not quests.onTrigger(player, npc) then
        if player:getCurrentMission(SOA) >= LIFE_ON_THE_FRONTIER then
            -- Standard dialogue
            player:startEvent(546, 0, 1)
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(546)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if not quests.onEventFinish(player, csid, option) then
        if (csid == 546) then
            if (option == 1) then
                -- Warps player to Mog Garden
                player:setPos(0, 0, 0, 0, 280)
            end
        end
    end
end
