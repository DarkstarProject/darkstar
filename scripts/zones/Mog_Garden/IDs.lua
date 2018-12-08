-----------------------------------
-- Area: Mog_Garden
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MOG_GARDEN] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED  = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6388, -- Obtained: <item>.
        GIL_OBTAINED             = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6391, -- Obtained key item: <keyitem>.
        NOT_HAVE_ENOUGH_GIL      = 6395, -- You do not have enough gil
        ITEM_OBTAINEDX           = 6397, -- You obtain <number> <item>!
        FISHING_MESSAGE_OFFSET   = 7208, -- You can't fish here.
        STARS_ON_KEYITEM         = 7496, -- <item> [has/have] come aglow.
        MOGLOCKER_MESSAGE_OFFSET = 7512, -- Your particular paid period of Mog Locker patronage has been extended until the following time, kupo!
        NOTHING_OUT_OF_ORDINARY  = 7586, -- There is nothing out of the ordinary here.
        RETRIEVE_DIALOG_ID       = 8563, -- You retrieve <item> from the porter moogle's care.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.MOG_GARDEN]