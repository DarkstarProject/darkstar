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
        CONQUEST_BASE           = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6560, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        CHUMIA_DIALOG           = 7307, -- Welcome to Bostaunieux Oubliette...
        SEEMS_LOCKED            = 7309, -- It seems to be locked.
        SPIRAL_HELL_LEARNED     = 7416, -- You have learned the weapon skill Spiral Hell!
        SENSE_OMINOUS_PRESENCE  = 7417, -- You sense an ominous presence...
        REGIME_REGISTERED       = 9531, -- New training regime registered!
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
        DREXERION_THE_CONDEMNED = 17461338,
        PHANDURON_THE_CONDEMNED = 17461343,
        BLOODSUCKER             = 17461478,
        BODACH                  = 17461479,
    },
    npc =
    {
    },
}

return zones[dsp.zone.BOSTAUNIEUX_OUBLIETTE]