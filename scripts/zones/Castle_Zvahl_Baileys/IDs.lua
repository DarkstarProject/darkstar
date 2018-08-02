-----------------------------------
-- Area: Castle_Zvahl_Baileys
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CASTLE_ZVAHL_BAILEYS] =
{
    text =
    {
        CONQUEST_BASE           = 0,
        ITEM_CANNOT_BE_OBTAINED = 6540, -- You cannot obtain the item <item>. come back after sorting your inventory.
        ITEM_OBTAINED           = 6546, -- Obtained: <item>.
        GIL_OBTAINED            = 6547, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6549, -- Obtained key item: <keyitem>.
        SENSE_OF_FOREBODING     = 6561, -- You are suddenly overcome with a sense of foreboding...
        CHEST_UNLOCKED          = 7221, -- You unlock the chest!
        CHEST_FAIL              = 7222, -- Fails to open the chest.
        CHEST_TRAP              = 7223, -- The chest was trapped!
        CHEST_WEAK              = 7224, -- You cannot open the chest when you are in a weakened state.
        CHEST_MIMIC             = 7225, -- The chest was a mimic!
        CHEST_MOOGLE            = 7226, -- You cannot open the chest while participating in the moogle event.
        CHEST_ILLUSION          = 7227, -- The chest was but an illusion...
        CHEST_LOCKED            = 7228, -- The chest appears to be locked.
        NOTHING_OUT_OF_ORDINARY = 7551, -- There is nothing out of the ordinary here.
    },
    mob =
    {
        MARQUIS_ALLOCEN  = 17436913,
        MARQUIS_AMON     = 17436918,
        DUKE_HABORYM     = 17436923,
        GRAND_DUKE_BATYM = 17436927,
        DARK_SPARK       = 17436964,
    },
    npc =
    {
        ZVAHL_BAILEYS_TORCH_OFFSET    = 17436984,
        ZVAHL_BAILEYS_TREASURE_CHEST  = 17436997,
        ZVAHL_BAILEYS_TREASURE_COFFER = 17436998,
    },
}

return zones[dsp.zone.CASTLE_ZVAHL_BAILEYS]