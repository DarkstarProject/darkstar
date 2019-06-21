require("scripts/globals/quests")

local thisQuest = dsp.quest.newQuest()

thisQuest.name = "The Brugaire Consortium"
thisQuest.log = dsp.quest.log.SANDORIA
thisQuest.quest_id = dsp.quest.id.sandoria.THE_BRUGAIRE_CONSORTIUM
thisQuest.string_key = dsp.quest.string.sandoria[thisQuest.quest_id]

thisQuest.repeatable = false
thisQuest.var_prefix = "[Q]["..thisQuest.log.."]["..thisQuest.quest_id.."]"
thisQuest.vars =
{
    stage = thisQuest.var_prefix,
    additional = {}
}

thisQuest.requirements =
{
    fame =
    {
        area = dsp.quest.fame.SANDORIA,
        level = 1
    }
}

thisQuest.rewards =
{
    items = 12289, -- Lauan Shield
    title = dsp.title.COURIER_EXTRAORDINAIRE,
    fame_area = dsp.quest.fame.SANDORIA
}

thisQuest.temporary =
{
    items = {593, 594, 595} -- Magic Shop Parcel, Port Parcel, Pub Parcel
}

-- Additional quest functions
-----------------------------------
thisQuest.PAY_REPLACE_PARCEL = function(player, npc, trade)
    -- Player repaying to replace a parcel they have lost
    local parcel_lost = math.floor(thisQuest.getStage(player) / 2) + 1
    local parcel_item_id = 592 + parcel_lost
    if thisQuest.tradeHas(player, trade, {{"gil", 100}}) and not player:hasItem(parcel_item_id) then
        return thisQuest.startEvent(player, 607 + parcel_lost)
    end
end

thisQuest.PARCEL_REPLACED = function(player, csid)
    -- Player being given a replacement parcel
    local parcel_lost = math.floor(thisQuest.getStage(player) / 2) + 1
    local parcel_item_id = 592 + parcel_lost

    thisQuest.completeTrade(player)
    if not thisQuest.giveItem(player, parcel_item_id, true) then 
        return thisQuest.startEvent(player, 537) -- Says player can't carry item
    end
    return true
end

thisQuest.DELIVER_FIRST = function(player, npc)
    if not thisQuest.holdingItem(player) then -- Are we holding a parcel for player?
        -- Tells the player to finish delivering the current parcel before taking another
        return thisQuest.startEvent(player, 560)
    else
        -- Try to give the player the parcel again
        if thisQuest.returnItem(player, true) then
            return true
        else
            return thisQuest.startEvent(player, 537) -- Says player can't carry item
        end
    end
end

-----------------------------------
-- QUEST STAGES
-----------------------------------
thisQuest.stages =
{
    -- Stage 0: Talk to Fontoumant, Port San d'Oria, to receive the first parcel and begin the quest
    [dsp.quest.stage.STAGE0] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrigger =
            {
                ['Fontoumant'] = function(player, npc)
                    if thisQuest.holdingItem(player) then
                        -- Try giving the player their rewards for completing the quest
                        thisQuest.returnItem(player)
                        return true
                    elseif thisQuest.checkRequirements(player) then
                        -- Asks player if they want to work, and if so, gives them first parcel
                        return thisQuest.startEvent(player, 509)
                    end
                end
            },
            onEventFinish =
            {
                [509] = function(player, option) -- Fontoumant starting quest
                    if option == 0 then
                        thisQuest.begin(player) -- Goes ahead and starts the quest
                        if thisQuest.giveItem(player, 593, true) then -- Attempts to give Magic Shop Parcel
                            return true
                        else
                            return thisQuest.startEvent(player, 537) -- Says player can't carry item
                        end
                    end
                end
            }
        }
    },
    -- Stage 1: Deliver the first parcel to Regine, Port San d'Oria
    [dsp.quest.stage.STAGE1] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrade =
            {
                ['Fontoumant'] = thisQuest.PAY_REPLACE_PARCEL, -- Player compensating for lost parcel
                ['Regine'] = function(player, npc, trade)
                    if thisQuest.tradeHas(player, trade, 593) then
                        return thisQuest.startEvent(player, 535) -- Player delivering the Magic Shop Parcel
                    else
                        return thisQuest.startEvent(player, 536) -- Player attempted to deliver wrong item
                    end
                end
            },
            onTrigger =
            {
                ['Fontoumant'] = thisQuest.DELIVER_FIRST
            },
            onEventFinish =
            {
                [535] = function(player, option) -- Player delivered Magic Shop Parcel
                    thisQuest.completeTrade(player)
                    return thisQuest.advanceStage(player)
                end,
                [608] = thisQuest.PARCEL_REPLACED -- Player paid to replace Magic Shop Parcel
            }
        }
    },
    -- Stage 2: Return to Fontoumant to receive the next parcel
    [dsp.quest.stage.STAGE2] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrigger =
            {
                ['Fontoumant'] = function(player, npc)
                    return thisQuest.startEvent(player, 511)
                end
            },
            onEventFinish =
            {
                [511] = function(player, option) -- Fontoumant giving player the next parcel
                    thisQuest.advanceStage(player)
                    if not thisQuest.giveItem(player, 594, true) then -- Attempts to give Port Parcel
                        return thisQuest.startEvent(player, 537) -- Says player can't carry item
                    end
                end
            }
        }
    },
    -- Stage 3: Deliver the second parcel to Apstaule, Port San d'Oria
    [dsp.quest.stage.STAGE3] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrade =
            {
                ['Fontoumant'] = thisQuest.PAY_REPLACE_PARCEL, -- Player compensating for lost parcel
                ['Apstaule'] = function(player, npc, trade)
                    if thisQuest.tradeHas(player, trade, 594) then
                        return thisQuest.startEvent(player, 540) -- Player delivering the Auction Parcel
                    else
                        return thisQuest.startEvent(player, 541) -- Player attempted to deliver wrong item
                    end
                end
            },
            onTrigger =
            {
                ['Fontoumant'] = thisQuest.DELIVER_FIRST
            },
            onEventFinish =
            {
                [540] = function(player, option) -- Player delivered Auction Parcel
                    thisQuest.completeTrade(player)
                    return thisQuest.advanceStage(player)
                end,
                [609] = thisQuest.PARCEL_REPLACED -- Player paid to replace Port Parcel
            }
        }
    },
    -- Stage 4: Return to Fontoumant to receive the next parcel
    [dsp.quest.stage.STAGE4] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrigger =
            {
                ['Fontoumant'] = function(player, npc)
                    return thisQuest.startEvent(player, 512)
                end
            },
            onEventFinish =
            {
                [512] = function(player, option) -- Fontoumant giving player the next parcel
                    thisQuest.advanceStage(player)
                    if not thisQuest.giveItem(player, 595, true) then -- Attempts to give Pub Parcel
                        return thisQuest.startEvent(player, 537) -- Says player can't carry item
                    end
                end
            }
        }
    },
    -- Stage 5: Deliver the third parcel to Thierride, Port San d'Oria
    [dsp.quest.stage.STAGE5] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrade =
            {
                ['Fontoumant'] = thisQuest.PAY_REPLACE_PARCEL, -- Player compensating for lost parcel
                ['Thierride'] = function(player, npc, trade)
                    if thisQuest.tradeHas(player, trade, 595) then
                        return thisQuest.startEvent(player, 539) -- Player delivering the Pub Parcel
                    else
                        return thisQuest.startEvent(player, 529) -- Player attempted to deliver wrong item
                    end
                end
            },
            onTrigger =
            {
                ['Fontoumant'] = thisQuest.DELIVER_FIRST
            },
            onEventFinish =
            {
                [539] = function(player, option) -- Player delivered Pub Parcel
                    thisQuest.completeTrade(player)
                    return thisQuest.advanceStage(player)
                end,
                [610] = thisQuest.PARCEL_REPLACED -- Player paid to replace Pub Parcel
            }
        }
    },
    -- Stage 6: Speak to Fontoumant to finish quest and receive reward
    [dsp.quest.stage.STAGE6] =
    {
        [dsp.zone.PORT_SAN_DORIA] =
        {
            onTrigger =
            {
                ['Fontoumant'] = function(player, npc)
                    return thisQuest.startEvent(player, 515)
                end
            },
            onEventFinish =
            {
                [515] = function(player, option) -- Fontoumant giving player their reward
                    return thisQuest.complete(player)
                end
            }
        }
    }
}

return thisQuest
