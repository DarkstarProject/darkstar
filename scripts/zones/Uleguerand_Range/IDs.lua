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
        HOMEPOINT_SET           = 8327, -- Home point set!
    },
    mob =
    {
        JORMUNGAND  = 16797969,
        GEUSH_URVAN = 16798078,
    },
    npc =
    {
        WATERFALL = 16798112,
    },
}

return zones[dsp.zone.ULEGUERAND_RANGE]