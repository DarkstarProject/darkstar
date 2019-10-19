-----------------------------------
-- Area: Bostaunieux_Oubliette
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BOSTAUNIEUX_OUBLIETTE] =
{
    text =
    {
        CONQUEST_BASE            = 0,     -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED  = 6541,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6547,  -- Obtained: <item>.
        GIL_OBTAINED             = 6548,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6550,  -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY  = 6561,  -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET   = 7208,  -- You can't fish here.
        CHUMIA_DIALOG            = 7308,  -- Welcome to Bostaunieux Oubliette...
        SEEMS_LOCKED             = 7310,  -- It seems to be locked.
        SPIRAL_HELL_LEARNED      = 7417,  -- You have learned the weapon skill Spiral Hell!
        SENSE_OMINOUS_PRESENCE   = 7418,  -- You sense an ominous presence...
        REGIME_REGISTERED        = 9532,  -- New training regime registered!
        PLAYER_OBTAINS_ITEM      = 10584, -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 10585, -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 10586, -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 10587, -- You already possess that temporary item.
    },
    mob =
    {
        SEWER_SYRUP_PH          =
        {
            [17461294] = 17461307, -- -19.000 1.000 -173.000
            [17461320] = 17461307, -- -20.000 1.000 -148.000
        },
        SHII_PH                 =
        {
            [17461311] = 17461315, -- -59.000 0.941 -149.000
            [17461334] = 17461315, -- -64.000 -0.500 -144.000
            [17461277] = 17461315, -- -65.000 -1.000 -137.000
            [17461309] = 17461315, -- -64.000 0.950 -132.000
            [17461312] = 17461315, -- -53.000 -0.500 -137.000
            [17461308] = 17461315, -- -57.000 0.998 -135.000
        },
        ARIOCH_PH               =
        {
            [17461322] = 17461433, -- -259 0.489 -188
        },
        MANES_PH                =
        {
            [17461469] = 17461471,
            [17461470] = 17461471,
            [17461476] = 17461471,
            [17461477] = 17461471,
        },
        DREXERION_THE_CONDEMNED = 17461338,
        PHANDURON_THE_CONDEMNED = 17461343,
        BLOODSUCKER             = 17461478,
        BODACH                  = 17461479,
    },
    npc =
    {
        CASKET_BASE = 17461487,
    },
}

return zones[dsp.zone.BOSTAUNIEUX_OUBLIETTE]