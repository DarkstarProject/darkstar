require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local waypointEventFinish = function(player, waypoint)
    -- Make sure player is working on stage 1
    -- Bitmask the bit in the waypoints var for the given waypoint
    -- Check value of the waypoint var, if all are set, advance to stage 2
    -- Return true if we did something
end

local this_quest = {}

this_quest.name = "Wayward Waypoints"
this_quest.area = ADOULIN
this_quest.log_id = dsp.quests.enums.log_ids.ADOULIN
this_quest.quest_id = dsp.quests.enums.quest_ids.adoulin.WAYWARD_WAYPOINTS

this_quest.repeatable = false

this_quest.requirements =
{
    quests =
    { 
        {
            ['area'] = ADOULIN,
            ['quest_id'] = dsp.quests.enums.quest_ids.adoulin.MEGALOMANIAC
        } 
    },
    fame =
    {
        ['area'] = this_quest.area,
        ['level'] = 4
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
            -- TODO: kinetic_units = 3000, -- Kinetic units need to be implemented before we reward them.
            fame_area = dsp.quests.enums.fame_areas.ADOULIN
        }
    }
}

this_quest.temporary =
{
    items = {},
    key_items =
    {
        dsp.ki.WAYPOINT_SCANNER_KIT,
        dsp.ki.WAYPOINT_RECALIBRATION_KIT
    }
}

this_quest.vars =
{
    stage = "[Q]["..this_quest.log_id.."]["..this_quest.quest_id.."]",
    preserve_main_on_complete = false, -- do we keep main var on quest completion
    additional =
    {
        -- Bitmask of waypoints calibrated during the second stage.
        ["waypoints"] = { id = 1, type = dsp.quests.enums.var_types.LOCAL_VAR, repeatable = false, preserve_on_complete = false }, 
    }
}

this_quest.stages =
{
    -- [TODO] Stage 0: Speak to Sharuru in Eastern Adoulin to start the quest and receive a Waypoint Scanner Kit KI
    [dsp.quests.enums.stages.STAGE0] =
    {
        [dsp.zone.EASTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Sharuru'] = function(player, npc)
                    -- TODO: Implement Sharuru's portions of the quest
                end
            },
            ['onEventFinish'] =
            {
                -- TODO: find Sharuru's events and implement their onFinishes
            }
        }
    },
    -- [TODO] Stage 1: Adjust waypoints at Frontier Stations in Ceizak, Yahse, Foret, Morimar, Yorcia, Marjami, and Kamihr
    [dsp.quests.enums.stages.STAGE1] =
    {
        -- TODO: Find/implement the onTriggers for the Adoulin waypoints
        -- TODO: Implement the event onFinishes for the Adoulin waypoints, just call waypointEventFinish() with their number
    },
    -- [TODO] Stage 2: Try adjusting waypoint in Lower Jeuno
    [dsp.quests.enums.stages.STAGE2] =
    {
        -- TODO: Find/implement the onTriggers for the Lower Jeuno waypoint
        -- TODO: Implement the Lower Jeuno waypoint onFinish events
    },
    -- [TODO] Stage 3: Talk to Sharuru again.
    [dsp.quests.enums.stages.STAGE3] =
    {
        [dsp.zone.EASTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Sharuru'] = function(player, npc)
                    -- TODO: Implement Sharuru's portions of the quest
                end
            },
            ['onEventFinish'] =
            {
                -- TODO: find Sharuru's events and implement their onFinishes
            }
        }
    },
    -- Stage 4: Talk to Shipilolo in Western Adoulin and get Waypoint Recalibration Kit KI
    [dsp.quests.enums.stages.STAGE4] =
    {
        [dsp.zone.WESTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Shipilolo'] = function(player, npc)
                    player:startEvent(79) -- Gives player Waypoint Recalibration Kit
                    return true
                end
            },
            ['onEventFinish'] =
            {
                [79] = function(player, option) -- Shipilolo upgrading waypoint kit
                    if npcUtil.giveKeyItem(player, dsp.ki.WAYPOINT_RECALIBRATION_KIT) then
                        player:delKeyItem(dsp.ki.WAYPOINT_SCANNER_KIT)
                        dsp.quests.advanceStage(player, this_quest)
                        return true
                    end
                end
            }
        }
    },
    -- [TODO] Stage 5: Try Lower Jeuno waypoint again
    [dsp.quests.enums.stages.STAGE5] =
    {
        -- TODO: Find/implement the onTriggers for the Lower Jeuno waypoint
        -- TODO: Implement the Lower Jeuno waypoint onFinish events
    },
    -- [TODO] Stage 6: Return to Sharuru, quest complete
    [dsp.quests.enums.stages.STAGE6] =
    {
        [dsp.zone.EASTERN_ADOULIN] =
        {
            ['onTrigger'] =
            {
                ['Sharuru'] = function(player, npc)
                    -- TODO: Implement Sharuru's portions of the quest
                end
            },
            ['onEventFinish'] =
            {
                -- TODO: find Sharuru's events and implement their onFinishes
            }
        }
    }
}

return this_quest