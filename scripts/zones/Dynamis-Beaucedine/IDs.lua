-----------------------------------
-- Area: Dynamis-Beaucedine
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/dynamis")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_BEAUCEDINE] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7155, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7314, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7315, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7316, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7317, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7319, -- The sands of the hourglass have emptied...
        OMINOUS_PRESENCE        = 7330, -- You feel an ominous presence, as if something might happen if you possessed <item>.
    },
    mob =
    {
        TIME_EXTENSION =
        {
            {minutes = 10, ki = dsp.ki.CRIMSON_GRANULES_OF_TIME,   mob = 17326207},
            {minutes = 10, ki = dsp.ki.AZURE_GRANULES_OF_TIME,     mob = 17326279},
            {minutes = 10, ki = dsp.ki.AMBER_GRANULES_OF_TIME,     mob = 17326353},
            {minutes = 10, ki = dsp.ki.ALABASTER_GRANULES_OF_TIME, mob = 17326468},
            {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = 17326742},
        },
        REFILL_STATUE =
        {
            {
                {mob = 17326203, eye = dynamis.eye.RED  }, -- Adamantking_Effigy
                {mob = 17326204, eye = dynamis.eye.BLUE },
            },
            {
                {mob = 17326205, eye = dynamis.eye.RED  }, -- Adamantking_Effigy
                {mob = 17326206, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17326275, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17326276, eye = dynamis.eye.BLUE },
            },
            {
                {mob = 17326277, eye = dynamis.eye.RED  }, -- Serjeant_Tombstone
                {mob = 17326278, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17326349, eye = dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17326350, eye = dynamis.eye.BLUE },
            },
            {
                {mob = 17326351, eye = dynamis.eye.RED  }, -- Avatar_Icon
                {mob = 17326352, eye = dynamis.eye.GREEN},
            },
            {
                {mob = 17326464, eye = dynamis.eye.RED  }, -- Goblin_Replica
                {mob = 17326465, eye = dynamis.eye.BLUE },
            },
            {
                {mob = 17326466, eye = dynamis.eye.RED  }, -- Goblin_Replica
                {mob = 17326467, eye = dynamis.eye.GREEN},
            },
        },
    },
    npc =
    {
        QM =
        {
            [17326800] =
            {
                param = {3357, 3424, 3425, 3426, 3427, 3428},
                trade =
                {
                    {item = 3357,                           mob = 17326081}, -- Angra Mainyu
                    {item = {3424, 3425, 3426, 3427, 3428}, mob = 17326098}, -- Arch Angra Mainyu
                }
            },
            [17326801] = {trade = {{item = 3396, mob = 17326093}}}, -- Taquede
            [17326802] = {trade = {{item = 3397, mob = 17326095}}}, -- Pignonpausard
            [17326803] = {trade = {{item = 3398, mob = 17326096}}}, -- Hitaume
            [17326804] = {trade = {{item = 3399, mob = 17326097}}}, -- Cavanneche
            [17326805] = {trade = {{item = 3359, mob = 17326086}}}, -- Goublefaupe
            [17326806] = {trade = {{item = 3360, mob = 17326087}}}, -- Quiebitiel
            [17326807] = {trade = {{item = 3361, mob = 17326088}}}, -- Mildaunegeux
            [17326808] = {trade = {{item = 3362, mob = 17326089}}}, -- Velosareon
            [17326809] = {trade = {{item = 3363, mob = 17326090}}}, -- Dagourmarche
        },
    },
}

return zones[dsp.zone.DYNAMIS_BEAUCEDINE]