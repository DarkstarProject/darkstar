require("scripts/globals/quests")

local this_quest = {}
local name = "LURE_OF_THE_WILDCAT"
local logid = dsp.quests.enums.log_ids.sandoria
local id = 113

this_quest.id = id
this_quest.name = name

-- npcs[zone] = { ["name"] = { onTrade, onTrigger, ..} }
this_quest.npcs = {}

-- south sandy
this_quest.npcs[230] = {}
this_quest.npcs[230]["Amutiyaal"] =
{
    onTrade = function(player, npc, trade)
    end,
    onTrigger = function(player, npc)
    end,
    onEventUpdate = function(player, csid, option)
    end,
    onEventFinish = function(player, csid, option)
    end
}

-- mobs[zone] = { ["name"] = { onMobDeath, onMobDespawn, ..} }
this_quest.mobs = {}
this_quest.mobs[230] = {}
this_quest.mobs[230]["Tittyfucker"] =
{
    onMobDeath = function(mob, target, isKiller)
    end,
}


this_quest.repeatable = false,
this_quest.vars =
{
    main = "[Q]".."["logid"]".."["..id.."]",
    preserve_main_on_complete = false, -- do we keep main var on quest completion
    additional =
    {
        ["name"] = { id = 1, type = dsp.quests.enums.var_types.local_var, repeatable = false, preserve_on_complete = false },
    }
}

-- todo: properly enum titles too
this_quest.rewards =
{
    sets =
    {
        [1] =
        {
            title = NEW_ADVENTURER, keyitems = { DARK_KEY },
            items = { itemid = 17440, qty = 1 }
        }
    }
}
dsp.quests.quests[logid][name] = this_quest