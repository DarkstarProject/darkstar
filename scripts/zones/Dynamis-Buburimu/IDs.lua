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
        OMINOUS_PRESENCE        = 7330, -- You feel an ominous presence, as if something might happen if you possessed <item>.
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
        QM =
        {
            [16941676] =
            {
                param = {3457, 3474, 3475, 3476, 3477, 3478},
                trade =
                {
                    {item = 3457,                           mob = 16941057}, -- Apocalyptic Beast
                    {item = {3474, 3475, 3476, 3477, 3478}, mob = 16941368}, -- Arch Apocalyptic Beast
                }
            },
            [16941677] = {trade = {{item = 3463, mob = 16941552}}}, -- Lost Stihi
            [16941678] = {trade = {{item = 3464, mob = 16941520}}}, -- Lost Barong
            [16941679] = {trade = {{item = 3465, mob = 16941576}}}, -- Lost Alklha
            [16941680] = {trade = {{item = 3466, mob = 16941666}}}, -- Lost Aitvaras
        },
    },
}

return zones[dsp.zone.DYNAMIS_BUBURIMU]