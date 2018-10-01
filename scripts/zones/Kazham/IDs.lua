-----------------------------------
-- Area: Kazham
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.KAZHAM] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED    = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED              = 6387, -- Obtained: <item>.
        GIL_OBTAINED               = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED           = 6390, -- Obtained key item: <keyitem>.
        HOMEPOINT_SET              = 6478, -- Home point set!
        CONQUEST_BASE              = 6498, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET     = 6657, -- You can't fish here.
        ITEM_DELIVERY_DIALOG       = 9957, -- We can deliver packages to Mog Houses anywhere in Vana'diel.
        PAHYALOLOHOIV_SHOP_DIALOG  = 10019, -- Nothing in this world is crrreated good or evil. However, evil can arrrise when something exists in a place where it did not originally belong.
        TOJIMUMOSULAH_SHOP_DIALOG  = 10021, -- Things meant to live will live. Things meant to die will die when their time has come. However, this does not mean you should cease your strrruggle for life.
        GHEMISENTERILO_SHOP_DIALOG = 10043, -- Can you really get everything that you want on the mainland?
        NUHCELODENKI_SHOP_DIALOG   = 10045, -- When you die, you can't take anything with you, but what fun is life if you don't have anything to live it up with?
        KHIFORYUHKOWA_SHOP_DIALOG  = 10046, -- Sometimes a strrrange Hume comes from the south to buy stuff. I wonder what he's doing down there...
        TAHNPOSBEI_SHOP_DIALOG     = 10047, -- You don't want to get whipped by those Tonberries, do you? Well, have I got the equipment forrr you!
        IFRIT_UNLOCKED             = 10516, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
        NOMAD_MOOGLE_DIALOG        = 10584, -- I'm a traveling moogle, kupo. I help adventurers in the Outlands access items they have stored in a Mog House elsewhere, kupo.
        MAMERIE_SHOP_DIALOG        = 10608, -- Is there something you require?
        EVISCERATION_LEARNED       = 10645, -- You have learned the weapon skill Evisceration!
        RETRIEVE_DIALOG_ID         = 10995, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.KAZHAM]