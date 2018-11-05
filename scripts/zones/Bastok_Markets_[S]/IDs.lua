-----------------------------------
-- Area: Bastok_Markets_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BASTOK_MARKETS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6387, -- Obtained: <item>.
        GIL_OBTAINED             = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6390, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET   = 7048, -- You can't fish here.
        BLINGBRIX_SHOP_DIALOG    = 7198, -- Blingbrix good Gobbie from Boodlix's! Boodlix's Emporium help fighting fighters and maging mages. Gil okay, okay?
        MOG_LOCKER_OFFSET        = 7459, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET            = 10826, -- Home point set!
        KARLOTTE_DELIVERY_DIALOG = 10860, -- I am here to help with all your parcel delivery needs.
        WELDON_DELIVERY_DIALOG   = 10861, -- Do you have something you wish to send?
        ALLIED_SIGIL             = 12349, -- You have received the Allied Sigil!
        SILKE_SHOP_DIALOG        = 12801, -- You wouldn't happen to be a fellow scholar, by any chance? The contents of these pages are beyond me, but perhaps you might glean something from them. They could be yours...for a nominal fee.
        RETRIEVE_DIALOG_ID       = 14713, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.BASTOK_MARKETS_S]