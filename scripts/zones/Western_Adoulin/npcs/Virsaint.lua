-----------------------------------
-- Area: Western Adoulin
--  NPC: Virsaint
-- Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
-- !pos 32 0 -5 256
-----------------------------------
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
        -- Standard dialogue
        player:startEvent(540)
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    dsp.quests.onEventFinish(player, csid, option, quest_table)
end;
