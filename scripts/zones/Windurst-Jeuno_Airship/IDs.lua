-----------------------------------
-- Area: Windurst-Jeuno_Airship
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WINDURST_JEUNO_AIRSHIP] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        WILL_REACH_JEUNO        = 7048, -- The airship will reach Jeuno in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        WILL_REACH_WINDURST     = 7049, -- The airship will reach Windurst in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        IN_JEUNO_MOMENTARILY    = 7050, -- We will be arriving in Jeuno momentarily.
        IN_WINDURST_MOMENTARILY = 7051, -- We will be arriving in Windurst momentarily.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.WINDURST_JEUNO_AIRSHIP]