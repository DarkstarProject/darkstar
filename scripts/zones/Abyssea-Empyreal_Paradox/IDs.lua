-----------------------------------
-- Area: Abyssea-Empyreal_Paradox
-----------------------------------
require("scripts/globals/zones")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ABYSSEA_EMPYREAL_PARADOX] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        CRUOR_TOTAL             = 6985, -- Obtained <Numeric Parameter 0> cruor. (Total: <Numeric Parameter 1>)<Prompt>
        CRUOR_OBTAINED          = 7394, -- <Possible Special Code: 1F>y<Player Name> obtains <Numeric Parameter 0> cruor.
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.ABYSSEA_EMPYREAL_PARADOX]