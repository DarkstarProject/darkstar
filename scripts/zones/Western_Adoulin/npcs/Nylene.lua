-----------------------------------
-- Area: Western Adoulin
--  NPC: Nylene
-- Type: Standard NPC and Quest NPC
--  Involved with Quest: 'A Certain Substitute Patrolman'
-- !pos 12 0 -82 256
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/quests");

local quest_table =
{
    require("scripts/quests/adoulin/a_certain_substitute_patrolman")
}
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if not dsp.quests.onTrigger(player, npc, quest_table) then
        if player:getCurrentMission(SOA) >= LIFE_ON_THE_FRONTIER then
            -- Standard dialogue
            player:startEvent(562)
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(533)
        end
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    dsp.quests.onEventFinish(player, csid, option, quest_table)
end;