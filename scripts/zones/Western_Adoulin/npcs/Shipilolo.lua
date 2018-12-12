-----------------------------------
-- Area: Western Adoulin
--  NPC: Shipilolo
-- Type: Standard NPC and Quest NPC
--  Involved with Quests: 'A Certain Substitute Patrolman'
--                        'Fertile Ground'
--                        'The Old Man and the Harpoon'
--                        'Wayward Waypoints'
-- !pos 84 0 -60 256
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/keyitems")

local quest_table =
{
    require("scripts/quests/adoulin/a_certain_substitute_patrolman"),
    require("scripts/quests/adoulin/the_old_man_and_the_harpoon"),
    require("scripts/quests/adoulin/fertile_ground"),
    require("scripts/quests/adoulin/wayward_waypoints")
}
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if not dsp.quests.onTrigger(player, npc, quest_table) then
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
    dsp.quests.onEventFinish(player, csid, option, quest_table)
end
