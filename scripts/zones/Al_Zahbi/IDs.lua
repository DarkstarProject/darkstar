-----------------------------------
-- Area: Al_Zahbi
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.AL_ZAHBI] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED   = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED             = 6388, -- Obtained: <item>.
        GIL_OBTAINED              = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED          = 6391, -- Obtained key item: <keyitem>.
        FISHING_MESSAGE_OFFSET    = 7049, -- You can't fish here.
        MOG_LOCKER_OFFSET         = 7383, -- Your Mog Locker lease is valid until <timestamp>, kupo.
        HOMEPOINT_SET             = 7529, -- Home point set!
        IMAGE_SUPPORT_ACTIVE      = 7552, -- You have to wait a bit longer before asking for synthesis image support again.
        IMAGE_SUPPORT             = 7554, -- Your [fishing/woodworking/smithing/goldsmithing/clothcraft/leatherworking/bonecraft/alchemy/cooking] skills went up [a little/ever so slightly/ever so slightly].
        KAHAHHOBICHAI_SHOP_DIALOG = 7613, -- Step rrright up to Kahah Hobichai's Blades! We've got everything your battle-thirrrsty heart desires!
        ALLARD_SHOP_DIALOG        = 7619, -- Hey, how ya doin'? Welcome to the armor shop of the Ulthalam Parade's leading star--Allard, in the flesh!
        ZAFIF_SHOP_DIALOG         = 7625, -- Welcome... I'm Zafif, and this is my magic shop... I hope you can find something of use here.
        CHAYAYA_SHOP_DIALOG       = 7631, -- Chayaya's Projectiles! Get your darts and more at Chayaya's Projectiles! Just don't touch the stuff in the high drawers, okay?
        NEED_CANDESCENCE_BACK     = 7684, -- ...Hm? You! Yes, you! What do you think you're staring at, anyway? Go get the Astral Candescence back, and now!
        ITEM_DELIVERY_DIALOG      = 7835, -- No need to wrap your goods. Just hand them over and they're as good as delivered! (I've got to be nice as long as the manager's got his eye on me...)
        DEHBI_MOSHAL_SHOP_DIALOG  = 7839, -- Welcome to the Carpenters' Guild!
        NDEGO_SHOP_DIALOG         = 7841, -- The Blacksmiths' Guild thanks you for your business!
        BORNAHN_SHOP_DIALOG       = 7843, -- Welcome! We have all your goldsmithing needs right here!
        TATEN_BILTEN_SHOP_DIALOG  = 7845, -- Weave something beautiful with the materials you buy here, okay?
        CHOCOBO_HAPPY             = 7848, -- The chocobo appears to be extremely happy.
        SANCTION                  = 7973, -- You have received the Empire's Sanction.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.AL_ZAHBI]