-----------------------------------
-- Area: Bastok-Jeuno_Airship
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.BASTOK_JEUNO_AIRSHIP] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6382, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6388, -- Obtained: <item>.
        GIL_OBTAINED            = 6389, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6391, -- Obtained key item: <keyitem>.
        WILL_REACH_JEUNO        = 7208, -- The airship will reach Jeuno in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        WILL_REACH_BASTOK       = 7209, -- The airship will reach Bastok in [less than an hour/about 1 hour/about 2 hours/about 3 hours/about 4 hours/about 5 hours/about 6 hours/about 7 hours] (# [minute/minutes] in Earth time).
        IN_JEUNO_MOMENTARILY    = 7210, -- We will be arriving in Jeuno momentarily.
        IN_BASTOK_MOMENTARILY   = 7211, -- We will be arriving in Bastok momentarily.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.BASTOK_JEUNO_AIRSHIP]