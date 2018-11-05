-----------------------------------
-- Area: Ordelles_Caves
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ORDELLES_CAVES] =
{
    text =
    {
        CONQUEST_BASE                 = 0, -- Tallying conquest results...
        ITEM_CANNOT_BE_OBTAINED       = 6540, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6546, -- Obtained: <item>.
        GIL_OBTAINED                  = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6549, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY       = 6560, -- There is nothing out of the ordinary here.
        SENSE_OF_FOREBODING           = 6561, -- You are suddenly overcome with a sense of foreboding...
        FISHING_MESSAGE_OFFSET        = 7207, -- You can't fish here.
        DEVICE_NOT_WORKING            = 7321, -- The device is not working.
        SYS_OVERLOAD                  = 7330, -- Warning! Sys...verload! Enterin...fety mode. ID eras...d.
        YOU_LOST_THE                  = 7335, -- You lost the <item>.
        RUILLONT_INITIAL_DIALOG       = 7344, -- Confound it! If I only had my sword, I'd cut through these fiends single-handedly...
        A_SQUIRE_S_TEST_II_DIALOG_I   = 7355, -- You place your hands into the pool.
        A_SQUIRE_S_TEST_II_DIALOG_II  = 7358, -- The dew from the stalactite slips through your fingers.
        A_SQUIRE_S_TEST_II_DIALOG_III = 7359, -- You have already obtained the dew.
        CHEST_UNLOCKED                = 7390, -- You unlock the chest!
        GERWITZS_AXE_DIALOG           = 7412, -- Mine axe shall rend thy throat!
        GERWITZS_SWORD_DIALOG         = 7413, -- Mine sword shall pierce thy tongue!
        GERWITZS_SOUL_DIALOG          = 7414, -- Long have I waited. I will tell all...
        REGIME_REGISTERED             = 10461, -- New training regime registered!
    },
    mob =
    {
        MORBOLGER          = 17568127,
        POLEVIK            = 17568134,
        DARK_PUPPET_OFFSET = 17568135,
    },
    npc =
    {
        TREASURE_CHEST = 17568192,
    },
}

return zones[dsp.zone.ORDELLES_CAVES]