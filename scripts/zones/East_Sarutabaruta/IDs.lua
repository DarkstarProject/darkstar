-----------------------------------
-- Area: East_Sarutabaruta
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.EAST_SARUTABARUTA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED           = 6387, -- Obtained: <item>.
        GIL_OBTAINED            = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>.
        CONQUEST_BASE           = 7048, -- Tallying conquest results...
        FISHING_MESSAGE_OFFSET  = 7207, -- You can't fish here.
        DIG_THROW_AWAY          = 7220, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING            = 7222, -- You dig and you dig, but find nothing.
        SIGNPOST_OFFSET         = 7377, -- Southeast: South Tower, Horutoto Ruins Southwest: Windurst Woods
        TABY_CANATAHEY_DIALOG   = 7387, -- This is the entrrrance to Windurst. Please maintain orderrrly conduct while you'rrre in town.
        HEIH_PORHIAAP_DIALOG    = 7388, -- These grrrasslands make up East Sarutabaruta. Lately the number of monsters has drrramatically increased, causing us all sorts of trrrouble.
        SAMA_GOHJIMA_PREDIALOG  = 7390, -- The ministerrr of the Orastery is in the laborrratory beneath here. To get there, you should check the walls verrry carrrefully.
        SAMA_GOHJIMA_POSTDIALOG = 7391, -- Were you able to find the laborrratory? There are many such hidden passages in the Horutoto Ruins.
        REGIME_REGISTERED       = 9921, -- New training regime registered!
    },
    mob =
    {
        SHARP_EARED_ROPIPI_PH =
        {
            [17252507] = 17252489, -- 363.152 -16.705 -326.213
            [17252506] = 17252489, -- 303.282 -17.642 -415.870
            [17252487] = 17252489, -- 224.258 -17.858 -486.256
            [17252488] = 17252489, -- 227.825 -16.978 -317.467
        },
        SPINY_SPIPI_PH        =
        {
            [17252656] = 17252657, -- 285.575 -12.656 126.129
            [17252634] = 17252657, -- 367.961 -12.894 83.454
            [17252655] = 17252657, -- 354.185 -4.590 244.205
            [17252654] = 17252657, -- 421.795 -5.536 277.605
        },
        DUKE_DECAPOD          = 17252725,
    },
    npc =
    {
    },
}

return zones[dsp.zone.EAST_SARUTABARUTA]