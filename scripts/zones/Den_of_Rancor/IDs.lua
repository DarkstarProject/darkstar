-----------------------------------
-- Area: Den_of_Rancor
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.DEN_OF_RANCOR] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6402, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7049, -- Tallying conquest results...
        LANTERN_OFFSET          = 7208, -- The grating will not budge.
        FISHING_MESSAGE_OFFSET  = 7236, -- You can't fish here.
        CHEST_UNLOCKED          = 7344, -- You unlock the chest!
        SENSE_OMINOUS_PRESENCE  = 7354, -- You sense an ominous presence...
        REGIME_REGISTERED       = 9487, -- New training regime registered!
        HOMEPOINT_SET           = 10537, -- Home point set!
    },
    mob =
    {
        CELESTE_EYED_TOZBERRY_PH =
        {
            [17432622] = 17432624,
        },
        FRIAR_RUSH_PH =
        {
            [17432638] = 17432640,
        },
        CARMINE_TAILED_JANBERRY_PH =
        {
            [17432661] = 17432659,
            [17432662] = 17432659,
        },
        TAWNY_FINGERED_MUGBERRY_PH =
        {
            [17432784] = 17432798,
            [17432785] = 17432798,
            [17432787] = 17432798,
            [17432788] = 17432798,
            [17432793] = 17432798,
            [17432794] = 17432798,
        },
        BISTRE_HEARTED_MALBERRY_PH =
        {
            [17432822] = 17432845,
        },
        OGAMA_PH =
        {
            [17432972] = 17432974,
            [17432978] = 17432974,
            [17432979] = 17432974,
        },
        MIMIC       = 17432583,
        HAKUTAKU    = 17433005,
        MOKUMOKUREN = 17433006,
    },
    npc =
    {
        LANTERN_OFFSET  = 17433047,
        DROP_GATE       = 17433051,
        TREASURE_COFFER = 17433077,
    },
}

return zones[dsp.zone.DEN_OF_RANCOR]