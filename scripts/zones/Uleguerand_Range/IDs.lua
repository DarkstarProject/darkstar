-----------------------------------
-- Area: Uleguerand_Range
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ULEGUERAND_RANGE] =
{
    text =
    {
        NOTHING_HAPPENS         = 119,  -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6395, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6401, -- Obtained: <item>.
        GIL_OBTAINED            = 6402, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6404, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6415, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7062, -- Tallying conquest results...
        SOMETHING_GLITTERING    = 7333, -- You see something glittering beneath the surface of the ice.
        WHAT_LIES_BENEATH       = 7334, -- There are many cold <item> scattered around the area. Could someone be trying to melt the ice to retrieve what lies beneath?
        SOMETHING_GLITTERING_BUT= 7335, -- You see something glittering below the surface here, but the ice encases it completely.
        HOMEPOINT_SET           = 8327, -- Home point set!
    },
    mob =
    {
        SKVADER_PH =
        {
            [16797769] = 16797770,
        },
        MAGNOTAUR_PH =
        {
            [16797966] = 16797968,
            [16797967] = 16797968,
        },
        BONNACON_PH =
        {
            [16798050] = 16798056, -- -623.154 -40.604 -51.621
            [16798051] = 16798056, -- -587.026 -40.994 -22.551
            [16798052] = 16798056, -- -513.416 -40.490 -43.706
            [16798053] = 16798056, -- -553.844 -38.958 -53.864
            [16798054] = 16798056, -- -631.268 -40.257 0.709
            [16798055] = 16798056, -- -513.999 -40.541 -34.928
        },
        JORMUNGAND  = 16797969,
        GEUSH_URVAN = 16798078,
    },
    npc =
    {
        WATERFALL = 16798112,
    },
}

return zones[dsp.zone.ULEGUERAND_RANGE]
