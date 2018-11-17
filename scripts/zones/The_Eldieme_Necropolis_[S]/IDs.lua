-----------------------------------
-- Area: The_Eldieme_Necropolis_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.THE_ELDIEME_NECROPOLIS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED       = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED                 = 6388, -- Obtained: <item>.
        GIL_OBTAINED                  = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED              = 6391, -- Obtained key item: <keyitem>.
        LAYTON_SHOP_DIALOG            = 7103, -- Might you be a student of the same field as I? If that is the case, I might be able to provide you with the proper grimoires...at a price, of course.
        YOU_CAN_NOW_BECOME_A_SCHOLAR  = 7712, -- You can now become a scholar!
        YOU_LEARN_EMBRAVA_AND_KAUSTRA = 7896, -- <name> learns Embrava and Kaustra!
        ITEM_DELIVERY_DIALOG          = 7902, -- Have something to send?
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.THE_ELDIEME_NECROPOLIS_S]