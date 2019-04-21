require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/zone")

local thisQuest = quests.newQuest()

thisQuest.name = "Wayward Waypoints"
thisQuest.log_id = dsp.quest.log_id.ADOULIN
thisQuest.quest_id = dsp.quest.id.adoulin.WAYWARD_WAYPOINTS
thisQuest.string_key = dsp.quest.string.adoulin[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.varPrefix = "[Q]["..thisQuest.log_id.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.varPrefix,
    additional =
    {
        -- Bitmask of waypoints calibrated during the second stage.
        ["waypoints"] = {  type = dsp.quest.var.CHAR, preserve = false, db_name = 'waypoints' },
    }
}

thisQuest.requirements =
{
    quests =
    { 
        {
            ['area'] = ADOULIN,
            ['quest_id'] = dsp.quest.id.adoulin.MEGALOMANIAC
        } 
    },
    fame =
    {
        ['area'] = dsp.quest.fame.ADOULIN,
        ['level'] = 4
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
            -- TODO: kinetic_units = 3000, -- Kinetic units need to be implemented before we reward them.
            fame_area = dsp.quest.fame.ADOULIN
        }
    }
}

thisQuest.temporary =
{
    items = {},
    key_items =
    {
        dsp.ki.WAYPOINT_SCANNER_KIT,
        dsp.ki.WAYPOINT_RECALIBRATION_KIT
    }
}

-- Additional quest functions
-----------------------------------
thisQuest.CHECK_WAYPOINT = function(player, waypoint)
    -- Make sure player is working on stage 1
    -- Bitmask the bit in the waypoints var for the given waypoint
    -- Check value of the waypoint var, if all are set, advance to stage 2
    -- Return true if we did something
end

-----------------------------------
-- QUEST STAGES
-----------------------------------
thisQuest.stages =
{
    -- [TODO] Stage 0: Speak to Sharuru in Eastern Adoulin to start the quest and receive a Waypoint Scanner Kit KI
    [dsp.quest.stage.STAGE0] =
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
    [dsp.quest.stage.STAGE1] =
    {
        -- TODO: Find/implement the onTriggers for the Adoulin waypoints
        -- TODO: Implement the event onFinishes for the Adoulin waypoints, just call waypointEventFinish() with their number
    },
    -- [TODO] Stage 2: Try adjusting waypoint in Lower Jeuno
    [dsp.quest.stage.STAGE2] =
    {
        -- TODO: Find/implement the onTriggers for the Lower Jeuno waypoint
        -- TODO: Implement the Lower Jeuno waypoint onFinish events
    },
    -- [TODO] Stage 3: Talk to Sharuru again.
    [dsp.quest.stage.STAGE3] =
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
    [dsp.quest.stage.STAGE4] =
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
                        thisQuest.advanceStage(player)
                        return true
                    end
                end
            }
        }
    },
    -- [TODO] Stage 5: Try Lower Jeuno waypoint again
    [dsp.quest.stage.STAGE5] =
    {
        -- TODO: Find/implement the onTriggers for the Lower Jeuno waypoint
        -- TODO: Implement the Lower Jeuno waypoint onFinish events
    },
    -- [TODO] Stage 6: Return to Sharuru, quest complete
    [dsp.quest.stage.STAGE6] =
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

return thisQuest