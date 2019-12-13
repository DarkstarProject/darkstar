-----------------------------------
-- Area: Riverne-Site_A01
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.RIVERNE_SITE_A01] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        SD_VERY_SMALL           = 7587, -- The spatial displacement is very small. If you only had some item that could make it bigger...
        SD_HAS_GROWN            = 7588, -- The spatial displacement has grown.
        SPACE_SEEMS_DISTORTED   = 7589, -- The space around you seems oddly distorted and disrupted.
        MONUMENT                = 7596, -- Something has been engraved on this stone, but the message is too difficult to make out.
        HOMEPOINT_SET           = 7724, -- Home point set!
    },
    mob =
    {
        HELIODROMOS_PH_OFFSET    = 16900107,
        HELIODROMOS_OFFSET       = 16900110,
        CARMINE_DOBSONFLY_OFFSET = 16900230,
    },
    npc =
    {
        DISPLACEMENT_OFFSET = 16900334,
    },
}

return zones[dsp.zone.RIVERNE_SITE_A01]