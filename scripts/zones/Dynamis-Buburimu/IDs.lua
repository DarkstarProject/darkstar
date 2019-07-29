-----------------------------------
-- Area: Dynamis-Buburimu
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_BUBURIMU] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7149, -- Tallying conquest results...
        DYNAMIS_TIME_BEGIN      = 7314, -- The sands of the <item> have begun to fall. You have <number> minutes (Earth time) remaining in Dynamis.
        DYNAMIS_TIME_EXTEND     = 7315, -- our stay in Dynamis has been extended by <number> minute[/s].
        DYNAMIS_TIME_UPDATE_1   = 7316, -- ou will be expelled from Dynamis in <number> [second/minute] (Earth time).
        DYNAMIS_TIME_UPDATE_2   = 7317, -- ou will be expelled from Dynamis in <number> [seconds/minutes] (Earth time).
        DYNAMIS_TIME_EXPIRED    = 7319, -- The sands of the hourglass have emptied...
    },
    mob =
    {
        TIME_EXTENSION =
        {
            {minutes = 10, ki = dsp.ki.CRIMSON_GRANULES_OF_TIME,   mob = {16941121, 16941138}},
            {minutes = 10, ki = dsp.ki.AZURE_GRANULES_OF_TIME,     mob = {16941156, 16941174}},
            {minutes = 10, ki = dsp.ki.AMBER_GRANULES_OF_TIME,     mob = {16941193, 16941211}},
            {minutes = 10, ki = dsp.ki.ALABASTER_GRANULES_OF_TIME, mob = {16941071, 16941086, 16941101}},
            {minutes = 20, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = {16941384, 16941398, 16941414, 16941428, 16941443, 16941458, 16941474, 16941488}},
        },
    },
    npc =
    {
    },
}

return zones[dsp.zone.DYNAMIS_BUBURIMU]