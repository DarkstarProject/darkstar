-----------------------------------
-- Area: Crawlers_Nest
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CRAWLERS_NEST] =
{
    text =
    {
        CONQUEST_BASE                 = 0,
        DEVICE_NOT_WORKING            = 173, -- The device is not working.
        SYS_OVERLOAD                  = 182, -- arning! Sys...verload! Enterin...fety mode. ID eras...d
        YOU_LOST_THE                  = 187, -- You lost the #.
        ITEM_CANNOT_BE_OBTAINED       = 6571, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6577, -- Obtained: <item>.
        GIL_OBTAINED                  = 6578, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6580, -- Obtained key item: <keyitem>.
        SENSE_OF_FOREBODING           = 6592, -- You are suddenly overcome with a sense of foreboding...
        CHEST_UNLOCKED                = 7250, -- You unlock the chest!
        CHEST_FAIL                    = 7251, -- Fails to open the chest.
        CHEST_TRAP                    = 7252, -- The chest was trapped!
        CHEST_WEAK                    = 7253, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC                   = 7254, -- The chest was a mimic!
        CHEST_MOOGLE                  = 7255, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION                = 7256, -- The chest was but an illusion...
        CHEST_LOCKED                  = 7257, -- The chest appears to be locked.
        SOMEONE_HAS_BEEN_DIGGING_HERE = 7258, -- Someone has been digging here.
        EQUIPMENT_COMPLETELY_PURIFIED = 7259, -- Your equipment has not been completely purified.
        YOU_BURY_THE                  = 7261, -- You bury the
        NOTHING_WILL_HAPPEN_YET       = 7264, -- It seems that nothing will happen yet.
        NOTHING_SEEMS_TO_HAPPEN       = 7265, -- Nothing seems to happen.
    },
    mob =
    {
        DEMONIC_TIPHIA_PH = 
        {
            [17584392] = 17584398, -- -103.000 -1.000 311.000
            [17584395] = 17584398, -- -89.000 -1.000 301.000
            [17584396] = 17584398, -- -75.000 -1.000 299.000
            [17584391] = 17584398, -- -101.000 -1.000 285.000
        },
        AWD_GOGGIE        = 17584135,
        DREADBUG          = 17584425,
    },
    npc =
    {
        CNEST_TREASURE_CHEST  = 17584475,
        CNEST_TREASURE_COFFER = 17584476,
    },
}

return zones[dsp.zone.CRAWLERS_NEST]