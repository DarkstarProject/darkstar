-----------------------------------
-- Area: Pashhow_Marshlands_[S]
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PASHHOW_MARSHLANDS_S] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET  = 7145, -- You can't fish here.
        ALREADY_OBTAINED_TELE   = 7690, -- You already possess the gate crystal for this telepoint.
    },
    mob =
    {
        KINEPIKWA = 17146147,
    },
    npc =
    {
        PASHHOW_S_MARKINGS_OFFSET = 17146626,
    },
}

return zones[dsp.zone.PASHHOW_MARSHLANDS_S]