-----------------------------------
-- Area: King_Ranperres_Tomb
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KING_RANPERRES_TOMB] =
{
    text =
    {
        CONQUEST_BASE           = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        CHEST_UNLOCKED          = 7277, -- You unlock the chest!
        HEAVY_DOOR              = 7305, -- It is a solid stone door.
        REGIME_REGISTERED       = 10329, -- New training regime registered!
    },
    mob =
    {
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