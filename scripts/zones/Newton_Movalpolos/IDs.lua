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
        CHEST_FAIL              = 7252, -- <name> fails to open the chest.
        CHEST_TRAP              = 7253, -- The chest was trapped!
        CHEST_WEAK              = 7254, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7255, -- The chest was a mimic!
        CHEST_MOOGLE            = 7256, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7257, -- The chest was but an illusion...
        CHEST_LOCKED            = 7258, -- The chest appears to be locked. If only you had <item>, perhaps you could open it...
        SHOWMAN_DECLINE         = 7262, -- ... Me no want that. Thing me want not here! It not being here!!!
        SHOWMAN_TRIGGER         = 7263, -- Hey, you there! Muscles nice. You want fight strong one? It cost you. Give me nice item.
        SHOWMAN_ACCEPT          = 7264, -- Fhungaaa!!! The freshyness, the flavoryness! This very nice item! Good luck, then. Try not die. One...two...four...FIIIIIIGHT!!!
        HOMEPOINT_SET           = 7267, -- Home point set!
    },
    mob =
    {
        BUGBEAR_MATMAN         = 16826570,
        MOBLIN_SHOWMAN         = 16826573,
        NEWTON_DOOR_OFFSET     = 16826582,
        FURNACE_HATCH_OFFSET   = 16826607,
        NEWTON_TREASURE_COFFER = 16826627,
    },
    npc =
    {
        MINING =
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