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
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        MOG_LOCKER_OFFSET       = 7360, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        WYATT_DIALOG            = 11079, -- Ahhh, sorry, sorry. The name's Wyatt, an' I be an armor merchant from Jeuno. Ended up 'ere in San d'Oria some way or another, though.
        HOMEPOINT_SET           = 11109, -- Home point set!
        ITEM_DELIVERY_DIALOG    = 11210, -- If'n ye have goods tae deliver, then Nembet be yer man!
        ALLIED_SIGIL            = 12911, -- You have received the Allied Sigil!
        RETRIEVE_DIALOG_ID      = 15574, -- You retrieve <item> from the porter moogle's care.
        COMMON_SENSE_SURVIVAL   = 15648, -- It appears that you have arrived at a new survival guide provided by the Servicemen's Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.SOUTHERN_SAN_DORIA_S]