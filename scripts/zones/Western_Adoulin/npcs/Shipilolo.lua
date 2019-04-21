-----------------------------------
-- Area: Western Adoulin
-- NPC: Shipilolo
-- Type: Standard NPC and Quest NPC
-- !pos 84 0 -60 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")

local involvedQuests =
{
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN},
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.THE_OLD_MAN_AND_THE_HARPOON},
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.FERTILE_GROUND},
    {dsp.quest.log_id.ADOULIN, dsp.quest.id.adoulin.WAYWARD_WAYPOINTS}
}
involvedQuests = quests.loadQuests(involvedQuests)
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if not quests.onTrigger(player, npc, involvedQuests) then
        if player:getCurrentMission(SOA) >= LIFE_ON_THE_FRONTIER then
            -- Standard dialogue
            player:startEvent(535);
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(526);
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    quests.onEventFinish(player, csid, option, involvedQuests)
end
