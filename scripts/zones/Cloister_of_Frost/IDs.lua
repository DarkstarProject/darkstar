-----------------------------------
-- Area: Cloister_of_Frost
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CLOISTER_OF_FROST] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED          = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6387, -- Obtained: <item>.
        GIL_OBTAINED                     = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                    = 7048, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7209, -- You cannot enter the battlefield at present. Please wait a little longer.
        PROTOCRYSTAL                     = 7233, -- It is a giant crystal.
        SHIVA_UNLOCKED                   = 7567, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
        CANNOT_REMOVE_FRAG               = 7660, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG            = 7661, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS           = 7662, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS                  = 7663, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT                  = 7664, -- It is an ancient Zilart monument.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CLOISTER_OF_FROST]