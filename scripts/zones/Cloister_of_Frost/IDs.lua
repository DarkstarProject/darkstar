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
        ITEM_CANNOT_BE_OBTAINED          = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                    = 6388, -- Obtained: <item>.
        GIL_OBTAINED                     = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED                 = 6391, -- Obtained key item: <keyitem>.
        CONQUEST_BASE                    = 7049, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7210, -- You cannot enter the battlefield at present. Please wait a little longer.
        PROTOCRYSTAL                     = 7234, -- It is a giant crystal.
        SHIVA_UNLOCKED                   = 7568, -- You are now able to summon [Ifrit/Titan/Leviathan/Garuda/Shiva/Ramuh].
        CANNOT_REMOVE_FRAG               = 7662, -- It is an oddly shaped stone monument. A shining stone is embedded in it, but cannot be removed...
        ALREADY_OBTAINED_FRAG            = 7663, -- You have already obtained this monument's <keyitem>. Try searching for another.
        ALREADY_HAVE_ALL_FRAGS           = 7664, -- You have obtained all of the fragments. You must hurry to the ruins of the ancient shrine!
        FOUND_ALL_FRAGS                  = 7665, -- You have obtained <keyitem>! You now have all 8 fragments of light!
        ZILART_MONUMENT                  = 7666, -- It is an ancient Zilart monument.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CLOISTER_OF_FROST]