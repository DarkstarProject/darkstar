-----------------------------------
-- Area: Mhaura
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MHAURA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL      = 6393, -- You do not have enough gil.
        HOMEPOINT_SET            = 6479, -- Home point set!
        CONQUEST_BASE            = 6537, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET   = 6713, -- You can't fish here.
        NOMAD_MOOGLE_DIALOG      = 6813, -- I'm a traveling moogle, kupo. I help adventurers in the Outlands access items they have stored in a Mog House elsewhere, kupo.
        SUBJOB_UNLOCKED          = 7054, -- You can now use support jobs!
        GRAINE_SHOP_DIALOG       = 7160, -- Hello there, I'm Graine the armorer. I've got just what you need!
        RUNITOMONITO_SHOP_DIALOG = 7161, -- Hi! Welcome! I'm Runito-Monito, and weapons is my middle name!
        PIKINIMIKINI_SHOP_DIALOG = 7162, -- Hi, I'm Pikini-Mikini, Mhaura's item seller. I've got the wares, so size doesn't matter!
        TYAPADOLIH_SHOP_DIALOG   = 7163, -- Welcome, strrranger! Tya Padolih's the name, and dealin' in magic is my game!
        GOLDSMITHING_GUILD       = 7164, -- Everything you need for your goldsmithing needs!
        SMITHING_GUILD           = 7165, -- Welcome to the Blacksmiths' Guild salesroom!
        RAMUH_UNLOCKED           = 7378, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
        MAURIRI_DELIVERY_DIALOG  = 7756, -- Mauriri is my name, and sending parcels from Mhaura is my game.
        PANORU_DELIVERY_DIALOG   = 7757, -- Looking for a delivery company that isn't lamey-wame? The quality of my service puts Mauriri to shame!
        DO_NOT_POSSESS           = 7759, -- You do not possess <item>. You were not permitted to board the ship...
        RETRIEVE_DIALOG_ID       = 7794, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
        LAUGHING_BISON  = 17797183,
        EXPLORER_MOOGLE = 17797253,
    },
}

return zones[dsp.zone.MHAURA]