-----------------------------------
-- Area: Apollyon
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.APOLLYON] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        TIME_EXCEEDED           = 7054, -- You have exceeded the time limit. Exiting Limbus now.
        WIPE_KICK               = 7347, -- All party members in Limbus have fallen in battle. Exiting now.
        WIPE                    = 7355, -- All party members in Limbus have fallen in battle. Exiting in <p3> minutes.
        CONDITION_FOR_LIMBUS    = 7055, -- You have clearance to enter Limbus, but cannot enter while you or a party member is engaged in battle.
        HUM                     = 7067, -- You hear a faint hum.
        NO_KEY                  = 7072, -- There is a disc here inscribed ...
        CHIP_TRADE              = 7361, -- The light in the <item> has grown dim.
        TIME_EXTENDED           = 7363, -- Your time in Limbus has been extended...
        TIME_LEFT               = 7364, -- You have <p0> minutes left in Limbus.
        CONQUEST_BASE           = 7366, -- Tallying conquest results...
        GATE_OPEN               = 7545, -- A vortex materializes...
    },
    mob =
    {
        APOLLYON_SW_MOB =
        {
            16932868,
            16932881,
            16932896,
            16932910,
        },
        APOLLYON_NW_MOB =
        {
            16932937,
            16932950,
            16932963,
            16932976,
            16932985,
        },
        APOLLYON_SE_MOB =
        {
            16932992,
            16933006,
            16933020,
            16933032,
        },
        APOLLYON_NE_MOB =
        {
            16933044,
            16933062,
            16933081,
            16933099,
            16933113,
        },
        APOLLYON_CS_MOB = 
        {
            16933129,
            16933137,
            16933144,
        },
    },
    npc =
    {
        ENTRANCE_OFFSET = 16933218,
        APOLLYON_SW_CRATE =
        {
            16932865,
            16932878,
            16932899,
            16932909,
        },
        APOLLYON_NW_CRATE =
        {
            [1] =
            {
                16932934, -- boss
                16932935,
                16932936,
                16932945,
                16932946,
            },
            [2] =
            {
                16932947, -- boss
                16932948,
                16932949,
                16932958,
                16932959,
            },
            [3] =
            {
                16932960, -- boss
                16932961,
                16932962,
                16932971,
                16932972,
            },
            [4] =
            {
                16932973, -- boss
                16932974,
                16932975,
                16932982,
                16932983,
            },
            [5] = 16932984,
        },
        APOLLYON_SE_CRATE =
        {
            16932989,
            16933003,
            16933017,
            16933031,
        },
        APOLLYON_NE_CRATE =
        {
            [1] =
            {
                16933041, -- boss
                16933042,
                16933043,
                16933053,
                16933054,
            },
            [2] =
            {
                16933059, -- boss
                16933060,
                16933061,
                16933074,
                16933075,
            },
            [3] =
            {
                16933076, -- boss
                16933077,
                16933078,
                16933079,
                16933080,
            },
            [4] =
            {
                16933096, -- boss
                16933097,
                16933098,
                16933110,
                16933111,
            },
            [5] = 16933112,
        },
        APOLLYON_CS_CRATE = 16933126,
        APOLLYON_CENTRAL_CRATE = 16933123,
    },
}

return zones[dsp.zone.APOLLYON]