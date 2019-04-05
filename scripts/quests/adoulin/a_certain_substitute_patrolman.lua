require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local this_quest = {}

this_quest.name = "A Certain Substitute Patrolman"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quest.log_id.ADOULIN
this_quest.quest_id = dsp.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN

this_quest.repeatable = false

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

this_quest.vars =
{
    stage = "[Q]["..this_quest.log_id.."]["..this_quest.quest_id.."]",
    preserve_main_on_complete = false,
    additional = {}
}

this_quest.temporary =
{
    items = {},
    key_items = {dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE}
}

this_quest.constants =
{
    ['GO_PATROL'] = function(player, npc)
        -- Rising Solstice yelling at the player to go patrol
        player:startEvent(2551)
        return true
    end
}

this_quest.stages =
{
    -- Stage 0: Talk to Rising Solstice, Western Adoulin, to begin the quest
    [dsp.quests.enums.stages.STAGE0] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = function(player, npc)
                    if dsp.quests.checkRequirements(player, this_quest) then
                        player:startEvent(2550) -- Starts Quest: 'A Certain Substitute Patrolman'
                        return true
                    end
                end
            },
            ['onEventFinish'] =
            {
                [2550] = function(player, option) -- Rising Solstice starting quest
                    if npcUtil.giveKeyItem(player, dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE) then
                        player:addQuest(this_quest.log_id, this_quest.quest_id)
                        dsp.quests.advanceStage(player, this_quest)
                        return true
                    end
                end
            }
        }
    },
    -- Stage 1: Talk to Zaoso, Western Adoulin
    [dsp.quests.enums.stages.STAGE1] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Zaoso'] = function(player, npc)
                    player:startEvent(2553) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2553] = function(player, option) -- Zaoso progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 2: Talk to Clemmar, Western Adoulin
    [dsp.quests.enums.stages.STAGE2] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Clemmar'] = function(player, npc)
                    player:startEvent(2554) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2554] = function(player, option) -- Clemmar progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 3: Talk to Kongramm, Western Adoulin
    [dsp.quests.enums.stages.STAGE3] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Kongramm'] = function(player, npc)
                    player:startEvent(2555) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2555] = function(player, option) -- Kongramm progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 4: Talk to Virsaint, Western Adoulin
    [dsp.quests.enums.stages.STAGE4] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Virsaint'] = function(player, npc)
                    player:startEvent(2556) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2556] = function(player, option) -- Virsaint progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 5: Talk to Shipilolo, Western Adoulin
    [dsp.quests.enums.stages.STAGE5] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Shipilolo'] = function(player, npc)
                    player:startEvent(2557) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2557] = function(player, option) -- Shipilolo progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 6: Talk to Dangueubert, Western Adoulin
    [dsp.quests.enums.stages.STAGE6] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Dangueubert'] = function(player, npc)
                    player:startEvent(2558) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2558] = function(player, option) -- Dangueubert progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 7: Talk to Nylene, Western Adoulin
    [dsp.quests.enums.stages.STAGE7] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = this_quest.constants['GO_PATROL'],
                ['Nylene'] = function(player, npc)
                    player:startEvent(2559) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2559] = function(player, option) -- Nylene progressing quest
                    dsp.quests.advanceStage(player, this_quest)
                    return true
                end
            }
        }
    },
    -- Stage 8: Talk to Rising Solstice again, quest complete
    [dsp.quests.enums.stages.STAGE8] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = function(player, npc)
                    player:startEvent(2552) -- Finishes quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2552] = function(player, option) -- Rising Solstice finishing quest
                    if dsp.quests.complete(player, this_quest) then
                        player:delKeyItem(dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE)
                        return true
                    end
                end
            }
        }
    }
}

return this_quest