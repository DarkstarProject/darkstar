-----------------------------------
-- Area: Dynamis-Windurst
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DYNAMIS_WINDURST] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
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
            {minutes = 10, ki = dsp.ki.CRIMSON_GRANULES_OF_TIME,   mob = 17543258},
            {minutes = 10, ki = dsp.ki.AZURE_GRANULES_OF_TIME,     mob = 17543342},
            {minutes = 10, ki = dsp.ki.AMBER_GRANULES_OF_TIME,     mob = 17543372},
            {minutes = 15, ki = dsp.ki.ALABASTER_GRANULES_OF_TIME, mob = 17543446},
            {minutes = 15, ki = dsp.ki.OBSIDIAN_GRANULES_OF_TIME,  mob = 17543259},
        },
    },
    npc =
    {
        QM =
        {
            [17543479] =
            {
                param = {3355, 3414, 3415, 3416, 3417, 3418},
                trade =
                {
                    {item = 3355,                           mob = 17543169}, -- Tzee Xicu Idol
                    {item = {3414, 3415, 3416, 3417, 3418}, mob = 17543469}, -- Arch Tzee Xicu Idol
                }
            },
            [17543480] = {trade = {{item = 3388, mob = 17543464}}}, -- Xuu Bhoqa the Enigma
            [17543481] = {trade = {{item = 3389, mob = 17543466}}}, -- Fuu Tzapo the Blessed
            [17543482] = {trade = {{item = 3390, mob = 17543467}}}, -- Naa Yixo the Stillrage
            [17543483] = {trade = {{item = 3391, mob = 17543468}}}, -- Tee Zaksa the Ceaseless
        },
    },
}

return zones[dsp.zone.DYNAMIS_WINDURST]