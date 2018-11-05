-----------------------------------
-- Area: Newton_Movalpolos
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.NEWTON_MOVALPOLOS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        COME_CLOSER             = 7229, -- H0000! C0mE cL0SEr! C0mE cL0SEr! CAn'T TrAdE fr0m S0 fAr AwAy!
        MINING_IS_POSSIBLE_HERE = 7237, -- Mining is possible here if you have <item>.
        CHEST_UNLOCKED          = 7251, -- You unlock the chest!
        SHOWMAN_DECLINE         = 7262, -- ... Me no want that. Thing me want not here! It not being here!!!
        SHOWMAN_TRIGGER         = 7263, -- Hey, you there! Muscles nice. You want fight strong one? It cost you. Give me nice item.
        SHOWMAN_ACCEPT          = 7264, -- Fhungaaa!!! The freshyness, the flavoryness! This very nice item! Good luck, then. Try not die. One...two...four...FIIIIIIGHT!!!
        HOMEPOINT_SET           = 7267, -- Home point set!
    },
    mob =
    {
        MIMIC                = 16826564,
        BUGBEAR_MATMAN       = 16826570,
    },
    npc =
    {
        NEWTON_DOOR_OFFSET   = 16826582,
        FURNACE_HATCH_OFFSET = 16826607,
        TREASURE_COFFER      = 16826627,
        MINING               =
        {
            16826621,
            16826622,
            16826623,
            16826624,
            16826625,
            16826626,
        },
    },
}

return zones[dsp.zone.NEWTON_MOVALPOLOS]