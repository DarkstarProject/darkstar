-----------------------------------
-- Area: Alzadaal_Undersea_Ruins
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ALZADAAL_UNDERSEA_RUINS] =
{
    text =
    {
        NOTHING_HAPPENS         = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        RESPONSE                = 7228, -- There is no response...
        DEVICE_MALFUNCTIONING   = 7244, -- The device appears to be malfunctioning...
        CANNOT_ENTER            = 7440, -- You cannot enter at this time. Please wait a while before trying again.
        AREA_FULL               = 7441, -- This area is fully occupied. You were unable to enter.
        MEMBER_NO_REQS          = 7445, -- Not all of your party members meet the requirements for this objective. Unable to enter area.
        MEMBER_TOO_FAR          = 7449, -- One or more party members are too far away from the entrance. Unable to enter area.
        MEMBER_IMBUED_ITEM      = 7450, -- One or more party members are carrying imbued items. Unable to enter area.
        IMBUED_ITEM             = 7451, -- You are carrying imbued items. Unable to enter area.
        MYTHIC_REQUIRED         = 7453, -- You do not have the appropriate mythic weapon equipped. Unable to enter area.
    },
    mob =
    {
        OB                      = 17072171,
        CHEESE_HOARDER_GIGIROON = 17072172,
        ARMED_GEARS             = 17072178,
        WULGARU                 = 17072179,
    },
    npc =
    {
    },
}

return zones[dsp.zone.ALZADAAL_UNDERSEA_RUINS]