-----------------------------------
-- Area: Southern_San_dOria_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.SOUTHERN_SAN_DORIA_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        MOG_LOCKER_OFFSET       = 7359, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        WYATT_DIALOG            = 11078, -- Ahhh, sorry, sorry. The name's Wyatt, an' I be an armor merchant from Jeuno. Ended up 'ere in San d'Oria some way or another, though.
        HOMEPOINT_SET           = 11108, -- Home point set!
        ITEM_DELIVERY_DIALOG    = 11209, -- If'n ye have goods tae deliver, then Nembet be yer man!
        ALLIED_SIGIL            = 12910, -- You have received the Allied Sigil!
        RETRIEVE_DIALOG_ID      = 15573, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SOUTHERN_SAN_DORIA_S]