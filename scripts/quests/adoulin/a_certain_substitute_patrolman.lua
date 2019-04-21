require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local thisQuest = quests.newQuest()

thisQuest.name = "A Certain Substitute Patrolman"
thisQuest.log_id = dsp.quest.log_id.ADOULIN
thisQuest.quest_id = dsp.quest.id.adoulin.A_CERTAIN_SUBSTITUTE_PATROLMAN
thisQuest.string_key = dsp.quest.string.adoulin[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.varPrefix = "[Q]["..thisQuest.log_id.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.varPrefix,
    additional =
    {
        --['name'] = { type = dsp.quest.var.CHAR, preserve = false, db_name = 'some_var' },
    }
}

thisQuest.requirements =
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
        ['area'] = dsp.quest.fame.ADOULIN,
        ['level'] = 1
    }
}

thisQuest.rewards =
{
    sets =
    {
        [1] =
        {
            exp = 1000,
            bayld = 500,
            fame_area = dsp.quest.fame.ADOULIN
        }
    }
}

thisQuest.temporary =
{
    items = {},
    key_items = {dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE}
}

-- Additional quest functions
-----------------------------------
thisQuest.GO_PATROL = function(player, npc)
    -- Rising Solstice yelling at the player to go patrol
    player:startEvent(2551)
    return true
end

-----------------------------------
-- QUEST STAGES
-----------------------------------
thisQuest.stages =
{
    -- Stage 0: Talk to Rising Solstice, Western Adoulin, to begin the quest
    [dsp.quest.stage.STAGE0] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = function(player, npc)
                    if thisQuest.checkRequirements(player) then
                        player:startEvent(2550) -- Starts Quest: 'A Certain Substitute Patrolman'
                        return true
                    end
                end
            },
            ['onEventFinish'] =
            {
                [2550] = function(player, option) -- Rising Solstice starting quest
                    if npcUtil.giveKeyItem(player, dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE) then
                        thisQuest.start(player)
                        return true
                    end
                end
            }
        }
    },
    -- Stage 1: Talk to Zaoso, Western Adoulin
    [dsp.quest.stage.STAGE1] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Zaoso'] = function(player, npc)
                    player:startEvent(2553) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2553] = function(player, option) -- Zaoso progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 2: Talk to Clemmar, Western Adoulin
    [dsp.quest.stage.STAGE2] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Clemmar'] = function(player, npc)
                    player:startEvent(2554) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2554] = function(player, option) -- Clemmar progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 3: Talk to Kongramm, Western Adoulin
    [dsp.quest.stage.STAGE3] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Kongramm'] = function(player, npc)
                    player:startEvent(2555) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2555] = function(player, option) -- Kongramm progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 4: Talk to Virsaint, Western Adoulin
    [dsp.quest.stage.STAGE4] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Virsaint'] = function(player, npc)
                    player:startEvent(2556) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2556] = function(player, option) -- Virsaint progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 5: Talk to Shipilolo, Western Adoulin
    [dsp.quest.stage.STAGE5] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Shipilolo'] = function(player, npc)
                    player:startEvent(2557) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2557] = function(player, option) -- Shipilolo progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 6: Talk to Dangueubert, Western Adoulin
    [dsp.quest.stage.STAGE6] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Dangueubert'] = function(player, npc)
                    player:startEvent(2558) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2558] = function(player, option) -- Dangueubert progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 7: Talk to Nylene, Western Adoulin
    [dsp.quest.stage.STAGE7] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Rising_Solstice'] = thisQuest.GO_PATROL,
                ['Nylene'] = function(player, npc)
                    player:startEvent(2559) -- Reports to player, and advances quest
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [2559] = function(player, option) -- Nylene progressing quest
                    thisQuest.advanceStage(player)
                    return true
                end
            }
        }
    },
    -- Stage 8: Talk to Rising Solstice again, quest complete
    [dsp.quest.stage.STAGE8] =
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
                    if thisQuest.complete(player) then
                        player:delKeyItem(dsp.ki.WESTERN_ADOULIN_PATROL_ROUTE)
                        return true
                    end
                end
            }
        }
    }
}

return thisQuest