require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

-- Stage 0: Talk to Rising Solstice, Western, to begin the quest
-- Stage 1: Talk to Zaoso, Western Adoulin
-- Stage 2: Talk to Clemmar, Western Adoulin
-- Stage 3: Talk to Kongramm, Western Adoulin
-- Stage 4: Talk to Virsaint, Western Adoulin
-- Stage 5: Talk to Shipilolo, Western Adoulin
-- Stage 6: Talk to Dangueubert, Western Adoulin
-- Stage 7: Talk to Nylene, Western Adoulin
-- Stage 8: Talk to Rising Solstice again, quest complete

local this_quest = {}

this_quest.name = "A Certain Substitute Patrolman"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quests.enums.log_ids.ADOULIN
this_quest.quest_id = dsp.quests.enums.quest_ids.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN

this_quest.repeatable = false
this_quest.vars =
{
    stage = "[Q]".."["..this_quest.log_id.."]".."["..this_quest.quest_id.."]",
    preserve_main_on_complete = false,
    additional = {}
}

this_quest.requirements =
{
    missions =
    {
        {
            ['mission_log'] = ADOULIN,
            ['mission_id'] = LIFE_ON_THE_FRONTIER
        }
    },
    fame =
    {
        ['area'] = this_quest.area,
        ['level'] = 1
    }
}

this_quest.rewards =
{
    sets =
    {
        [1] =
        {
            exp = 1000,
            bayld = 500,
            fame_area = dsp.quests.enums.fame_areas.ADOULIN
        }
    }
}

this_quest.temporary =
{
    items = {},
    key_items = {dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE}
}

this_quest.npcs =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        ["Rising_Solstice"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) >= 1 then
                    if dsp.quests.getStage(player, this_quest) == 8 then
                        player:startEvent(2552) -- Finishes Quest: 'A Certain Substitute Patrolman'
                    else
                        player:startEvent(2551) -- Dialogue during Quest: 'A Certain Substitute Patrolman'
                    end
                    return true
                elseif dsp.quests.checkRequirements(player, this_quest) then
                    player:startEvent(2550) -- Starts Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Zaoso"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 1 then
                    player:startEvent(2553) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Clemmar"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 2 then
                    player:startEvent(2554) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Kongramm"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 3 then
                    player:startEvent(2555) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Virsaint"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 4 then
                    player:startEvent(2556) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Shipilolo"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 5 then
                    player:startEvent(2557) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Dangueubert"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 6 then
                    player:startEvent(2558) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        },
        ["Nylene"] =
        {
            onTrigger = function(player, npc)
                if dsp.quests.getStage(player, this_quest) == 7 then
                    player:startEvent(2559) -- Progresses Quest: 'A Certain Substitute Patrolman'
                    return true
                end
            end
        }
    }
}

this_quest.events =
{
    [dsp.zone.WESTERN_ADOULIN] =
    {
        [2550] =
        {
            onEventFinish = function(player, option)
                -- Rising Solstice, starts Quest: 'A Certain Substitute Patrolman'
                if npcUtil.giveKeyItem(player, dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE) then
                    player:addQuest(this_quest.log_id, this_quest.quest_id)
                    dsp.quests.setStage(player, this_quest, 1)
                    return true
                end
            end
        },
        [2552] =
        {
            onEventFinish = function(player, option)
                -- Rising Solstice, finishes Quest: 'A Certain Substitute Patrolman'
                if dsp.quests.complete(player, this_quest) then
                    player:delKeyItem(dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE)
                    return true
                end
            end
        },
        [2553] =
        {
            onEventFinish = function(player, option)
                -- Zaoso, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 2)
                return true
            end
        },
        [2554] =
        {
            onEventFinish = function(player, option)
                -- Clemmar, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 3)
                return true
            end
        },
        [2555] =
        {
            onEventFinish = function(player, option)
                -- Kongramm, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 4)
                return true
            end
        },
        [2556] =
        {
            onEventFinish = function(player, option)
                -- Virsaint, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 5)
                return true
            end
        },
        [2557] =
        {
            onEventFinish = function(player, option)
                -- Shipilolo, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 6)
                return true
            end
        },
        [2558] =
        {
            onEventFinish = function(player, option)
                -- Dangueubert, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 7)
                return true
            end
        },
        [2559] =
        {
            onEventFinish = function(player, option)
                -- Nylene, progresses Quest: 'A Certain Substitute Patrolman'
                dsp.quests.setStage(player, this_quest, 8)
                return true
            end
        }
    }
}

return this_quest