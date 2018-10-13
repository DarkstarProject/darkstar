-----------------------------------
-- Area: West_Sarutabaruta
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.WEST_SARUTABARUTA] =
{
    text =
    {
        NOTHING_HAPPENS             = 119, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED     = 6381, -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED               = 6387, -- Obtained: <item>.
        GIL_OBTAINED                = 6388, -- Obtained <number> gil.
        KEYITEM_OBTAINED            = 6390, -- Obtained key item: <keyitem>.
        NOTHING_OUT_OF_ORDINARY     = 6401, -- There is nothing out of the ordinary here.
        FISHING_MESSAGE_OFFSET      = 7048, -- You can't fish here.
        DIG_THROW_AWAY              = 7061, -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING                = 7063, -- You dig and you dig, but find nothing.
        CONQUEST_BASE               = 7148, -- Tallying conquest results...
        SIGN_1                      = 7377, -- Northeast: Central Tower, Horutoto Ruins Northwest: Giddeus South: Port Windurst
        SIGN_3                      = 7378, -- East: East Sarutabaruta West: Giddeus
        SIGN_5                      = 7379, -- Northeast: Central Tower, Horutoto Ruins East: East Sarutabaruta West: Giddeus
        SIGN_7                      = 7380, -- South: Windurst East: East Sarutabaruta
        SIGN_9                      = 7381, -- West: Giddeus North: East Sarutabaruta South: Windurst
        SIGN_11                     = 7382, -- North: East Sarutabaruta Southeast: Windurst
        SIGN_13                     = 7383, -- East: Port Windurst West: West Tower, Horutoto Ruins
        SIGN_15                     = 7384, -- East: East Sarutabaruta West: Giddeus Southeast: Windurst
        SIGN_17                     = 7385, -- Northwest: Northwest Tower, Horutoto Ruins  East: Outpost Southwest: Giddeus
        PAORE_KUORE_DIALOG          = 7387, -- Welcome to Windurst! Proceed through this gateway to entaru Port Windurst.
        KOLAPO_OILAPO_DIALOG        = 7388, -- Hi-diddly-diddly! This is the gateway to Windurst! The grasslands you're on now are known as West Sarutabaruta.
        MAATA_ULAATA                = 7389, -- Hello-wello! This is the central tower of the Horutoto Ruins. It's one of the several ancient-wancient magic towers which dot these grasslands.
        IPUPU_DIALOG                = 7392, -- I decided to take a little strolly-wolly, but before I realized it, I found myself way out here! Now I am sorta stuck... Woe is me!
        FROST_DEPOSIT_TWINKLES      = 7399, -- A frost deposit at the base of the tree twinkles in the starlight.
        MELT_BARE_HANDS             = 7401, -- It looks like it would melt if you touched it with your bare hands...
        HARVESTING_IS_POSSIBLE_HERE = 7437, -- Harvesting is possible here if you have <item>.
        CONQUEST                    = 7453, -- You've earned conquest points!
        REGIME_REGISTERED           = 10185, -- New training regime registered!
        DONT_SWAP_JOBS              = 10186, -- hanging your job will result in the cancellation of your current training regime.
        REGIME_CANCELED             = 10187, -- Training regime canceled.
    },
    mob =
    {
        NUNYENUNC_PH   =
        {
            [17248323] = 17248517, -- -95.00 -17.000 383.000
            [17248515] = 17248517, -- -7.194 -17.288 431.604
            [17248516] = 17248517, -- 53.159 -24.540 554.652
            [17248514] = 17248517, -- 159.501 -20.117 485.528
        },
        TOM_TIT_TAT_PH =
        {
            [17248467] = 17248468, -- 31.149 -20.045 358.265
            [17248466] = 17248468, -- 77.509 -20.719 434.757
            [17248507] = 17248468, -- 139.154 -21.418 505.416
            [17248506] = 17248468, -- 151.484 -21.133 494.038
            [17248543] = 17248468, -- 211.910 -19.944 546.316
            [17248546] = 17248468, -- 211.099 -20.673 568.574
            [17248544] = 17248468, -- 239.421 -19.659 583.122
            [17248545] = 17248468, -- 274.296 -20.357 587.339
        },
    },
    npc =
    {
        W_SARUTA_SIGNPOST_OFFSET = 17248790,
        OVERSEER_BASE            = 17248823,
        HARVESTING =
        {
            17248839,
            17248840,
            17248841,
            17248842,
            17248843,
            17248844,
        },
    },
}

return zones[dsp.zone.WEST_SARUTABARUTA]