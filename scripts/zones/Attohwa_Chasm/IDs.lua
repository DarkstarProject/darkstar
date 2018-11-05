-----------------------------------
-- Area: Attohwa_Chasm
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ATTOHWA_CHASM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        KEYITEM_LOST            = 6391, -- Lost key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        MINING_IS_POSSIBLE_HERE = 7207, -- Mining is possible here if you have <item>.
        GASPONIA_POISON         = 7327, -- The poison of the Gasponia has begun to spread through your body.
        OCCASIONAL_LUMPS        = 7342, -- Occasionally lumps arise in the ground here, then settle down again. It seems that there is something beneath the earth.
        HOMEPOINT_SET           = 8229, -- Home point set!
    },
    mob =
    {
        AMBUSHER_ANTLION_PH = 
        {
            [16806171] = 16806249, -- -433.309 -4.3 113.841
        },
        CITIPATI_PH         = 
        {
            [16806155] = 16806162, -- -328.973 -12.876 67.481
            [16806158] = 16806162, -- -398.931 -4.536 79.640
            [16806161] = 16806162, -- -381.284 -9.233 40.054
        },
        LIOUMERE            = 16806031,
        TIAMAT              = 16806227,
        FEELER_ANTLION      = 16806242,
    },
    npc =
    {
        MIASMA_OFFSET   = 16806304,
        GASPONIA_OFFSET = 16806327,
        EXCAVATION =
        {
            16806369,
            16806370,
            16806371,
            16806372,
            16806373,
            16806374,
        },
    },
}

return zones[dsp.zone.ATTOHWA_CHASM]