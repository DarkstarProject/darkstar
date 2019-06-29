-----------------------------------
-- Area: King Ranperres Tomb (190)
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KING_RANPERRES_TOMB] =
{
    text =
    {
        CONQUEST_BASE                 = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED       = 6541, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6547, -- Obtained: <item>.
        GIL_OBTAINED                  = 6548, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6550, -- Obtained key item: <keyitem>.
        YOUR_GEOMAGNETRON_HAS_ATTUNED = 7169, -- Your <Geomagnetron> has been attuned.
        A_FAINT_ENERGY_WAFTS_UP       = 7170, -- A faint energy wafts up from the ground
        YOUR_GEOMAGNETRON_HAS_ALREADY = 7171, -- Your Geomagnetron has already been attuned.
        CHEST_UNLOCKED                = 7279, -- You unlock the chest!
        HEAVY_DOOR                    = 7307, -- It is a solid stone door.
        REGIME_REGISTERED             = 10331, -- New training regime registered!
    },
    mob =
    {
        GWYLLGI_PH            =
        {
            [17555661] = 17555664,
        },
        CRYPT_GHOST_PH        =
        {
            [17555665] = 17555668,
            [17555666] = 17555668,
            [17555667] = 17555668,
        },
        BARBASTELLE           = 17555721,
        CHERRY_SAPLING_OFFSET = 17555853,
        VRTRA                 = 17555890,
        CORRUPTED_YORGOS      = 17555898,
        CORRUPTED_SOFFEIL     = 17555899,
        CORRUPTED_ULBRIG      = 17555900,
    },
    npc =
    {
        TREASURE_CHEST = 17555955,
    },
}

return zones[dsp.zone.KING_RANPERRES_TOMB]