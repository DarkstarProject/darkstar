-----------------------------------
-- Chocobo Digging
-- http://ffxiclopedia.wikia.com/wiki/Chocobo_Digging
-- https://www.bg-wiki.com/bg/Category:Chocobo_Digging
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/weather")
require("scripts/globals/status")
require("scripts/globals/utils")
require("scripts/globals/zone")
-----------------------------------

dsp = dsp or {}
dsp.chocoboDig = dsp.chocoboDig or {}

local digReq =
{
    NONE     = 0,
    BURROW   = 1,
    BORE     = 2,
    MODIFIER = 4,
    NIGHT    = 8,
}

local crystalMap =
{
    [dsp.weather.HOT_SPELL    ] = 4096, -- fire crystal
    [dsp.weather.HEAT_WAVE    ] = 4104, -- fire cluster
    [dsp.weather.RAIN         ] = 4101, -- water crystal
    [dsp.weather.SQUALL       ] = 4109, -- water cluster
    [dsp.weather.DUST_STORM   ] = 4099, -- earth crystal
    [dsp.weather.SAND_STORM   ] = 4107, -- earth cluster
    [dsp.weather.WIND         ] = 4098, -- wind crystal
    [dsp.weather.GALES        ] = 4106, -- wind cluster
    [dsp.weather.SNOW         ] = 4097, -- ice crystal
    [dsp.weather.BLIZZARDS    ] = 4105, -- ice cluster
    [dsp.weather.THUNDER      ] = 4100, -- lightning crystal
    [dsp.weather.THUNDERSTORMS] = 4108, -- lightning cluster
    [dsp.weather.AURORAS      ] = 4102, -- light crystal
    [dsp.weather.STELLAR_GLARE] = 4110, -- light cluster
    [dsp.weather.GLOOM        ] = 4103, -- dark crystal
    [dsp.weather.DARKNESS     ] = 4111, -- dark cluster
}

local oreMap =
{
    [dsp.day.FIRESDAY    ] = 1255, -- fire ore
    [dsp.day.EARTHSDAY   ] = 1258, -- earth ore
    [dsp.day.WATERSDAY   ] = 1260, -- water ore
    [dsp.day.WINDSDAY    ] = 1257, -- wind ore
    [dsp.day.ICEDAY      ] = 1256, -- ice ore
    [dsp.day.LIGHTNINGDAY] = 1259, -- lightning ore
    [dsp.day.LIGHTSDAY   ] = 1261, -- light ore
    [dsp.day.DARKSDAY    ] = 1262, -- dark ore
}

-----------------------------------
-- {itemId, weight, dig requirements}
-----------------------------------
local digInfo =
{
    [dsp.zone.CARPENTERS_LANDING] = -- 2
    {
        { 4504, 152, digReq.NONE    },
        {  688, 182, digReq.NONE    },
        {  697,  83, digReq.NONE    },
        { 4386,   3, digReq.NONE    },
        {17396, 129, digReq.NONE    },
        {  691, 144, digReq.NONE    },
        {  918,   8, digReq.NONE    },
        {  699,  76, digReq.NONE    },
        { 4447,  38, digReq.NONE    },
        {  695,  45, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4100,  59, digReq.BURROW  },
        { 4101,  59, digReq.BURROW  },
        {  690,  15, digReq.BORE    },
        { 1446,   8, digReq.BORE    },
        {  700,  23, digReq.BORE    },
        {  701,   8, digReq.BORE    },
        {  696,  30, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.BIBIKI_BAY] = -- 4
    {
        {  847,  70, digReq.NONE    },
        {  887,  10, digReq.NONE    },
        {  893,  55, digReq.NONE    },
        {17395, 110, digReq.NONE    },
        {  738,   5, digReq.NONE    },
        {  888, 160, digReq.NONE    },
        { 4484,  60, digReq.NONE    },
        {17397, 110, digReq.NONE    },
        {  641, 130, digReq.NONE    },
        {  885,  30, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  845, 150, digReq.BURROW  },
        {  843,  10, digReq.BURROW  },
        {  844,  90, digReq.BURROW  },
        { 1845,  10, digReq.BURROW  },
        {  838,  10, digReq.BURROW  },
        {  880,  70, digReq.BORE    },
        {  902,  20, digReq.BORE    },
        {  886,  30, digReq.BORE    },
        {  867,  10, digReq.BORE    },
        {  864,  40, digReq.BORE    },
        { 1587,  50, digReq.BORE    },
        { 1586,  30, digReq.BORE    },
        {  866,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.WAJAOM_WOODLANDS] = -- 51
    {
        {  770,  50, digReq.NONE    },
        { 2150,  60, digReq.NONE    },
        {  622, 197, digReq.NONE    },
        { 2155,  23, digReq.NONE    },
        {  739,   5, digReq.NONE    },
        {17296, 133, digReq.NONE    },
        {  703,  69, digReq.NONE    },
        { 2213, 135, digReq.NONE    },
        {  838,  21, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  688, 144, digReq.BURROW  },
        {  702,  14, digReq.BURROW  },
        {  690,  23, digReq.BURROW  },
        { 1446,   3, digReq.BURROW  },
        {  700,  14, digReq.BURROW  },
        {  699,  37, digReq.BURROW  },
        {  701,  28, digReq.BURROW  },
        {  696,  23, digReq.BURROW  },
        {  678,   9, digReq.BORE    },
        {  645,   3, digReq.BORE    },
        {  768, 193, digReq.BORE    },
        {  737,  22, digReq.BORE    },
        { 2475,   3, digReq.BORE    },
        {  738,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.BHAFLAU_THICKETS] = -- 52
    {
        {  770,  50, digReq.NONE    },
        { 2150,  60, digReq.NONE    },
        {  622, 197, digReq.NONE    },
        { 2155,  23, digReq.NONE    },
        {  739,   5, digReq.NONE    },
        {17296, 133, digReq.NONE    },
        {  703,  69, digReq.NONE    },
        { 2213, 135, digReq.NONE    },
        {  838,  21, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  688, 144, digReq.BURROW  },
        {  702,  14, digReq.BURROW  },
        {  690,  23, digReq.BURROW  },
        { 1446,   3, digReq.BURROW  },
        {  700,  14, digReq.BURROW  },
        {  699,  37, digReq.BURROW  },
        {  701,  28, digReq.BURROW  },
        {  696,  23, digReq.BURROW  },
        {  678,   9, digReq.BORE    },
        {  645,   3, digReq.BORE    },
        {  768, 193, digReq.BORE    },
        {  737,  22, digReq.BORE    },
        { 2475,   3, digReq.BORE    },
        {  738,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.WEST_RONFAURE] = -- 100
    {
        { 4504, 167, digReq.NONE    },
        {  688,  15, digReq.NONE    },
        {17396,  20, digReq.NONE    },
        {  698,   5, digReq.NONE    },
        {  840, 117, digReq.NONE    },
        {  691,  83, digReq.NONE    },
        {  833,  83, digReq.NONE    },
        {  639,  10, digReq.NONE    },
        {  694,  63, digReq.NONE    },
        {  918,  12, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545,   5, digReq.BURROW  },
        {  636,  63, digReq.BURROW  },
        {  617,  63, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
        {  573,  23, digReq.NIGHT   },
    },
    [dsp.zone.EAST_RONFAURE] = -- 101
    {
        { 4504, 224, digReq.NONE    },
        {  688, 184, digReq.NONE    },
        {17396, 276, digReq.NONE    },
        {  698,  69, digReq.NONE    },
        {  840,  63, digReq.NONE    },
        {  691, 144, digReq.NONE    },
        {  639,  29, digReq.NONE    },
        {  694,  10, digReq.NONE    },
        { 4386,  11, digReq.NONE    },
        {  918,  10, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545,  12, digReq.BURROW  },
        {  636,  29, digReq.BURROW  },
        {  617,  12, digReq.BORE    },
        { 4570,  11, digReq.MODIFIER},
        { 4487,  12, digReq.MODIFIER},
        { 4409,  10, digReq.MODIFIER},
        { 1188,  12, digReq.MODIFIER},
        { 4532,  11, digReq.MODIFIER},
        {  574,  37, digReq.NIGHT   },
    },
    [dsp.zone.LA_THEINE_PLATEAU] = -- 102
    {
        {  688, 153, digReq.NONE    },
        {17396, 155, digReq.NONE    },
        {17296, 134, digReq.NONE    },
        {  641, 103, digReq.NONE    },
        {  840,  56, digReq.NONE    },
        {  642,  49, digReq.NONE    },
        {  696,  57, digReq.NONE    },
        {  694,  40, digReq.NONE    },
        {  622,  28, digReq.NONE    },
        {  700,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545,  34, digReq.BURROW  },
        {  636,  20, digReq.BURROW  },
        {  616,   8, digReq.BURROW  },
        { 5235,   2, digReq.BURROW  },
        { 2364, 139, digReq.BORE    },
        { 2235,  44, digReq.BORE    },
        {  617,   6, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 1237,  12, digReq.MODIFIER},
    },
    [dsp.zone.VALKURM_DUNES] = -- 103
    {
        {  880, 224, digReq.NONE    },
        {  887,  39, digReq.NONE    },
        {  645,  14, digReq.NONE    },
        {  893, 105, digReq.NONE    },
        {  737,  17, digReq.NONE    },
        {  643,  64, digReq.NONE    },
        {17296, 122, digReq.NONE    },
        {  942,   6, digReq.NONE    },
        {  642,  58, digReq.NONE    },
        {  864,  22, digReq.NONE    },
        {  843,   4, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  845, 122, digReq.BURROW  },
        {  844,  71, digReq.BURROW  },
        { 1845,  33, digReq.BURROW  },
        {  838,  11, digReq.BURROW  },
        {  902,   6, digReq.BORE    },
        {  886,   3, digReq.BORE    },
        {  867,   3, digReq.BORE    },
        { 1587,  19, digReq.BORE    },
        {  888,  25, digReq.BORE    },
        { 1586,   8, digReq.BORE    },
        {  885,  10, digReq.BORE    },
        {  866,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.JUGNER_FOREST] = -- 104
    {
        { 4504, 152, digReq.NONE    },
        {  688, 182, digReq.NONE    },
        {  697,  83, digReq.NONE    },
        { 4386,   3, digReq.NONE    },
        {17396, 129, digReq.NONE    },
        {  691, 144, digReq.NONE    },
        {  918,   8, digReq.NONE    },
        {  699,  76, digReq.NONE    },
        { 4447,  38, digReq.NONE    },
        {  695,  45, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  690,  15, digReq.BORE    },
        { 1446,   8, digReq.BORE    },
        {  702,  23, digReq.BORE    },
        {  701,   8, digReq.BORE    },
        {  696,  30, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.BATALLIA_DOWNS] = -- 105
    {
        {  847,  69, digReq.NONE    },
        {  880, 137, digReq.NONE    },
        {  845,   4, digReq.NONE    },
        {  640,  82, digReq.NONE    },
        {  768, 133, digReq.NONE    },
        {  643,  82, digReq.NONE    },
        {17296, 137, digReq.NONE    },
        {  774,  26, digReq.NONE    },
        {  106,  69, digReq.NONE    },
        { 4449,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  656, 106, digReq.BURROW  },
        {  748,   8, digReq.BURROW  },
        {  749,  30, digReq.BURROW  },
        {  750, 136, digReq.BURROW  },
        { 1237,  30, digReq.BORE    },
        { 2235,  60, digReq.BORE    },
        { 2364, 150, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.NORTH_GUSTABERG] = -- 106
    {
        {  880, 226, digReq.NONE    },
        {17396, 264, digReq.NONE    },
        {17296, 176, digReq.NONE    },
        {  847,  75, digReq.NONE    },
        {  864,  59, digReq.NONE    },
        {  846,  75, digReq.NONE    },
        {  869, 170, digReq.NONE    },
        {  868,  83, digReq.NONE    },
        {  749,  63, digReq.NONE    },
        {  644,  60, digReq.NONE    },
        {  645,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545, 150, digReq.BURROW  },
        {  636,  50, digReq.BURROW  },
        {  617, 100, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
        { 1236,   3, digReq.NIGHT   },
    },
    [dsp.zone.SOUTH_GUSTABERG] = -- 107
    {
        {17296, 252, digReq.NONE    },
        {17396, 227, digReq.NONE    },
        {  846, 156, digReq.NONE    },
        {  880, 133, digReq.NONE    },
        {  936,  83, digReq.NONE    },
        {  869,  80, digReq.NONE    },
        {  749,  32, digReq.NONE    },
        {  847,  23, digReq.NONE    },
        {  644,   5, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545,   5, digReq.BURROW  },
        {  636,  63, digReq.BURROW  },
        {  617,  63, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
        {  575,  14, digReq.NIGHT   },
    },
    [dsp.zone.KONSCHTAT_HIGHLANDS] = -- 108
    {
        {  847,  13, digReq.NONE    },
        {  880, 165, digReq.NONE    },
        {  690,  68, digReq.NONE    },
        {  864,  80, digReq.NONE    },
        {  768,  90, digReq.NONE    },
        {  869,  63, digReq.NONE    },
        {  749,  14, digReq.NONE    },
        {17296, 214, digReq.NONE    },
        {  844,  14, digReq.NONE    },
        {  868,  45, digReq.NONE    },
        {  642,  71, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  845,  28, digReq.BORE    },
        {  842,  27, digReq.BORE    },
        {  843,  23, digReq.BORE    },
        { 1845,  22, digReq.BORE    },
        {  838,  19, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.PASHHOW_MARSHLANDS] = -- 109
    {
        {  846, 216, digReq.NONE    },
        {17296, 210, digReq.NONE    },
        {  869, 198, digReq.NONE    },
        {  736,  72, digReq.NONE    },
        {  695, 102, digReq.NONE    },
        { 4448,  48, digReq.NONE    },
        {  775,  36, digReq.NONE    },
        {  749,  18, digReq.NONE    },
        {  703,   6, digReq.NONE    },
        {  885,   9, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 2364, 120, digReq.BURROW  },
        { 2235,  42, digReq.BURROW  },
        { 1237,  24, digReq.BURROW  },
        { 1236,  12, digReq.BURROW  },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.ROLANBERRY_FIELDS] = -- 110
    {
        { 4450,  30, digReq.NONE    },
        { 4566,   7, digReq.NONE    },
        {  768, 164, digReq.NONE    },
        {  748,  15, digReq.NONE    },
        {  846,  97, digReq.NONE    },
        {17396,  75, digReq.NONE    },
        {  749,  45, digReq.NONE    },
        {  739,   3, digReq.NONE    },
        {17296, 216, digReq.NONE    },
        { 4448,  15, digReq.NONE    },
        {  638,  82, digReq.NONE    },
        {  106,  37, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  656, 200, digReq.BURROW  },
        {  750, 100, digReq.BURROW  },
        { 4375,  60, digReq.BORE    },
        { 4449,  15, digReq.BORE    },
        { 4374,  52, digReq.BORE    },
        { 4373,  10, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.EASTERN_ALTEPA_DESERT] = -- 114
    {
        {  880, 167, digReq.NONE    },
        {  893,  88, digReq.NONE    },
        {17296, 135, digReq.NONE    },
        {  736,  52, digReq.NONE    },
        {  644,  22, digReq.NONE    },
        {  942,   4, digReq.NONE    },
        {  738,  12, digReq.NONE    },
        {  866,  36, digReq.NONE    },
        {  642,  58, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        {  574,  33, digReq.BURROW  },
        {  575,  74, digReq.BURROW  },
        {  572,  59, digReq.BURROW  },
        { 1237,  19, digReq.BURROW  },
        {  573,  44, digReq.BURROW  },
        { 2235,  41, digReq.BURROW  },
        {  646,   3, digReq.BORE    },
        {  678,  18, digReq.BORE    },
        {  645,   9, digReq.BORE    },
        {  768, 129, digReq.BORE    },
        {  737,   3, digReq.BORE    },
        {  739,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.WEST_SARUTABARUTA] = -- 115
    {
        {  689, 132, digReq.NONE    },
        {  938,  79, digReq.NONE    },
        {17296, 132, digReq.NONE    },
        {  847, 100, digReq.NONE    },
        {  846,  53, digReq.NONE    },
        {  833, 100, digReq.NONE    },
        {  841,  53, digReq.NONE    },
        {  834,  26, digReq.NONE    },
        {  772,  50, digReq.NONE    },
        {  701,  50, digReq.NONE    },
        {  702,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  617,  50, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
        { 1237,  10, digReq.NIGHT   },
    },
    [dsp.zone.EAST_SARUTABARUTA] = -- 116
    {
        {  689, 132, digReq.NONE    },
        {  938,  79, digReq.NONE    },
        {17296, 132, digReq.NONE    },
        {  847, 100, digReq.NONE    },
        {  846,  53, digReq.NONE    },
        {  833, 100, digReq.NONE    },
        {  841,  53, digReq.NONE    },
        {  834,  26, digReq.NONE    },
        {  772,  50, digReq.NONE    },
        {  701,  50, digReq.NONE    },
        {  702,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        { 4545, 200, digReq.BURROW  },
        {  636,  50, digReq.BURROW  },
        { 5235,  10, digReq.BURROW  },
        {  617,  50, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
        {  572, 100, digReq.NIGHT   },
    },
    [dsp.zone.TAHRONGI_CANYON] = -- 117
    {
        {  880, 224, digReq.NONE    },
        {  887,  39, digReq.NONE    },
        {  645,  14, digReq.NONE    },
        {  893, 105, digReq.NONE    },
        {  737,  17, digReq.NONE    },
        {  643,  64, digReq.NONE    },
        {17296, 122, digReq.NONE    },
        {  942,   6, digReq.NONE    },
        {  642,  58, digReq.NONE    },
        {  864,  22, digReq.NONE    },
        {  843,   4, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  656,  95, digReq.BURROW  },
        {  749,  26, digReq.BURROW  },
        {  751,  33, digReq.BURROW  },
        {  750,  89, digReq.BURROW  },
        {  902,   6, digReq.BORE    },
        {  886,   3, digReq.BORE    },
        {  867,   3, digReq.BORE    },
        { 1587,  19, digReq.BORE    },
        {  888,  25, digReq.BORE    },
        { 1586,   8, digReq.BORE    },
        {  885,  10, digReq.BORE    },
        {  866,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.BUBURIMU_PENINSULA] = -- 118
    {
        {  847,  45, digReq.NONE    },
        {  887,   1, digReq.NONE    },
        {  893,  53, digReq.NONE    },
        {17395,  98, digReq.NONE    },
        {  738,   3, digReq.NONE    },
        {  888, 195, digReq.NONE    },
        { 4484,  47, digReq.NONE    },
        {17397,  66, digReq.NONE    },
        {  641, 134, digReq.NONE    },
        {  885,  12, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  845, 125, digReq.BURROW  },
        {  843,   1, digReq.BURROW  },
        {  844,  64, digReq.BURROW  },
        { 1845,  34, digReq.BURROW  },
        {  838,   7, digReq.BURROW  },
        {  880,  34, digReq.BORE    },
        {  902,   5, digReq.BORE    },
        {  886,   3, digReq.BORE    },
        {  867,   3, digReq.BORE    },
        {  864,  21, digReq.BORE    },
        { 1587,  19, digReq.BORE    },
        { 1586,   9, digReq.BORE    },
        {  866,   2, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.MERIPHATAUD_MOUNTAINS] = -- 119
    {
        {  646,   4, digReq.NONE    },
        {  845,  12, digReq.NONE    },
        {  640, 112, digReq.NONE    },
        {  768, 237, digReq.NONE    },
        {  893,  41, digReq.NONE    },
        {  748,  33, digReq.NONE    },
        {  846, 145, digReq.NONE    },
        {  869, 100, digReq.NONE    },
        {17296, 162, digReq.NONE    },
        {  771,  21, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  678,   5, digReq.BURROW  },
        {  645,   9, digReq.BURROW  },
        {  737,   5, digReq.BURROW  },
        {  643,  69, digReq.BURROW  },
        { 1650,  62, digReq.BURROW  },
        {  644,  31, digReq.BURROW  },
        {  736,  62, digReq.BURROW  },
        {  739,   5, digReq.BURROW  },
        {  678,   5, digReq.BORE    },
        {  645,   9, digReq.BORE    },
        {  737,   5, digReq.BORE    },
        {  738,   8, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.SAUROMUGUE_CHAMPAIGN] = -- 120
    {
        {  880, 224, digReq.NONE    },
        {  887,  39, digReq.NONE    },
        {  645,  14, digReq.NONE    },
        {  893, 105, digReq.NONE    },
        {  737,  17, digReq.NONE    },
        {  643,  64, digReq.NONE    },
        {17296, 122, digReq.NONE    },
        {  942,   6, digReq.NONE    },
        {  642,  58, digReq.NONE    },
        {  864,  22, digReq.NONE    },
        {  843,   4, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  656,  95, digReq.BURROW  },
        {  749,  26, digReq.BURROW  },
        {  751,  33, digReq.BURROW  },
        {  750,  89, digReq.BURROW  },
        {  902,   6, digReq.BORE    },
        {  886,   3, digReq.BORE    },
        {  867,   3, digReq.BORE    },
        { 1587,  19, digReq.BORE    },
        {  888,  25, digReq.BORE    },
        { 1586,   8, digReq.BORE    },
        {  885,  10, digReq.BORE    },
        {  866,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.THE_SANCTUARY_OF_ZITAH] = -- 121
    {
        {  688, 117, digReq.NONE    },
        {17296, 150, digReq.NONE    },
        {  880, 100, digReq.NONE    },
        {  833,  83, digReq.NONE    },
        {  696, 100, digReq.NONE    },
        {  690,  33, digReq.NONE    },
        {  772,  17, digReq.NONE    },
        {  773,  33, digReq.NONE    },
        { 4386,   9, digReq.NONE    },
        {  703,   7, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 1255,  10, digReq.NONE    }, -- all ores
        {  656, 117, digReq.BURROW  },
        {  750, 133, digReq.BURROW  },
        {  749, 117, digReq.BURROW  },
        {  748,   8, digReq.BURROW  },
        {  751,  14, digReq.BURROW  },
        {  720,   1, digReq.BURROW  },
        {  699,   9, digReq.BORE    },
        {  720,   1, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.YUHTUNGA_JUNGLE] = -- 123
    {
        {  880, 185, digReq.NONE    },
        {  628,  72, digReq.NONE    },
        {  721,  91, digReq.NONE    },
        { 4375,  40, digReq.NONE    },
        {  702,   4, digReq.NONE    },
        { 1983,  10, digReq.NONE    },
        {  701,  29, digReq.NONE    },
        { 4386,   4, digReq.NONE    },
        {  703,   9, digReq.NONE    },
        { 4448,   7, digReq.NONE    },
        {  720,   3, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 4374,  17, digReq.BURROW  },
        { 4373,  41, digReq.BURROW  },
        { 4375,  15, digReq.BURROW  },
        { 4566,   3, digReq.BURROW  },
        {  688,  23, digReq.BORE    },
        {  696,  17, digReq.BORE    },
        {  690,   3, digReq.BORE    },
        {  699,  12, digReq.BORE    },
        {  701,   9, digReq.BORE    },
        { 1446,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.YHOATOR_JUNGLE] = -- 124
    {
        {  880, 282, digReq.NONE    },
        {  689, 177, digReq.NONE    },
        { 4432, 140, digReq.NONE    },
        {  923,  90, digReq.NONE    },
        {  702,  41, digReq.NONE    },
        {  700,  44, digReq.NONE    },
        { 4450,  47, digReq.NONE    },
        {  703,  26, digReq.NONE    },
        { 4449,  12, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        { 4374,  17, digReq.BURROW  },
        { 4373,  41, digReq.BURROW  },
        { 4375,  15, digReq.BURROW  },
        { 4566,   3, digReq.BURROW  },
        {  688,  23, digReq.BORE    },
        {  696,  17, digReq.BORE    },
        {  690,   3, digReq.BORE    },
        {  699,  12, digReq.BORE    },
        {  701,   9, digReq.BORE    },
        { 1446,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
    [dsp.zone.WESTERN_ALTEPA_DESERT] = -- 125
    {
        {  880, 224, digReq.NONE    },
        {  887,  39, digReq.NONE    },
        {  645,  14, digReq.NONE    },
        {  893, 105, digReq.NONE    },
        {  737,  17, digReq.NONE    },
        {  643,  64, digReq.NONE    },
        {17296, 122, digReq.NONE    },
        {  942,   6, digReq.NONE    },
        {  642,  58, digReq.NONE    },
        {  864,  22, digReq.NONE    },
        {  843,   4, digReq.NONE    },
        { 4096, 100, digReq.NONE    }, -- all crystals
        {  845, 122, digReq.BURROW  },
        {  844,  71, digReq.BURROW  },
        { 1845,  33, digReq.BURROW  },
        {  838,  11, digReq.BURROW  },
        {  902,   6, digReq.BORE    },
        {  886,   3, digReq.BORE    },
        {  867,   3, digReq.BORE    },
        { 1587,  19, digReq.BORE    },
        {  888,  25, digReq.BORE    },
        { 1586,   8, digReq.BORE    },
        {  885,  10, digReq.BORE    },
        {  866,   3, digReq.BORE    },
        { 4570,  10, digReq.MODIFIER},
        { 4487,  11, digReq.MODIFIER},
        { 4409,  12, digReq.MODIFIER},
        { 1188,  10, digReq.MODIFIER},
        { 4532,  12, digReq.MODIFIER},
    },
}

local function updatePlayerDigCount(player, increment)
    if increment == 0 then
        player:setCharVar('[DIG]DigCount', 0)
    else
        player:setCharVar('[DIG]DigCount', player:getCharVar('[DIG]DigCount') + increment)
    end

    player:setLocalVar('[DIG]LastDigTime', os.time())
end


local function updateZoneDigCount(zoneId, increment)
    local serverVar = '[DIG]ZONE' .. zoneId .. '_ITEMS'

    -- 0 means we wanna wipe (probably only gonna happen onGameDay or something)
    if increment == 0 then
        SetServerVariable(serverVar, 0)
    else
        SetServerVariable(serverVar, GetServerVariable(serverVar) + increment)
    end
end

local function canDig(player)
    local digCount = player:getCharVar('[DIG]DigCount')
    local lastDigTime = player:getLocalVar('[DIG]LastDigTime')
    local zoneItemsDug = GetServerVariable('[DIG]ZONE'..player:getZoneID()..'_ITEMS')
    local zoneInTime = player:getLocalVar('ZoneInTime')
    local currentTime = os.time()
    local skillRank = player:getSkillRank(dsp.skill.DIG)

    -- base delay -5 for each rank
    local digDelay = 16 - (skillRank * 5)
    local areaDigDelay = 60 - (skillRank * 5)

    local prevMidnight = getMidnight() - 86400

    -- Last dig was before today, so reset player fatigue
    if lastDigTime < prevMidnight then
        updatePlayerDigCount(player, 0)
        digCount = 0
    end

    -- neither player nor zone have reached their dig limit

    if (digCount < 100 and zoneItemsDug < 20) or DIG_FATIGUE == 0 then
        -- pesky delays
        if (zoneInTime + areaDigDelay) <= currentTime and (lastDigTime + digDelay) <= currentTime then
            return true
        end
    end

    return false
end


local function calculateSkillUp(player)
    local skillRank = player:getSkillRank(dsp.skill.DIG)
    local maxSkill = utils.clamp((skillRank + 1) * 100, 0, 1000)
    local realSkill = player:getCharSkillLevel(dsp.skill.DIG)
    local increment = 1

    -- this probably needs correcting
    local roll = math.random(0, 100)

    -- make sure our skill isn't capped
    if realSkill < maxSkill then
        -- can we skill up?
        if roll <= 15 then
            if (increment + realSkill) > maxSkill then
                increment = maxSkill - realSkill
            end

            -- skill up!
            player:setSkillLevel(dsp.skill.DIG, realSkill + increment)

            -- update the skill rank
            -- Digging does not have test items, so increment rank once player hits 10.0, 20.0, .. 100.0
            if (realSkill + increment) >= (skillRank * 100) + 100 then
                player:setSkillRank(dsp.skill.DIG, skillRank + 1)
            end
        end
    end
end


local function getChocoboDiggingItem(player)
    local allItems = digInfo[player:getZoneID()]
    local burrowAbility = (DIG_GRANT_BURROW == 1) and 1 or 0
    local boreAbility = (DIG_GRANT_BORE == 1) and 1 or 0
    local modifier = player:getMod(dsp.mod.EGGHELM)
    local totd = VanadielTOTD()
    local weather = player:getWeather()
    local moon = VanadielMoonPhase()

    -- filter allItems to possibleItems and sum weights
    local possibleItems = {}
    local sum = 0

    for i = 1, #allItems do
        local item = allItems[i]
        local itemReq = item[3]
        if
            (itemReq == digReq.NONE) or
            (itemReq == digReq.BURROW and burrowAbility == 1) or
            (itemReq == digReq.BORE and boreAbility == 1) or
            (itemReq == digReq.MODIFIER and modifier == 1) or
            (itemReq == digReq.NIGHT and totd == dsp.time.NIGHT)
        then
            sum = sum + item[2]
            table.insert(possibleItems, item)
        end
    end

    -- pick weighted result
    local itemId = 0
    local pick = math.random(sum)
    sum = 0

    for i = 1, #possibleItems do
        sum = sum + possibleItems[i][2]
        if sum >= pick then
            itemId = possibleItems[i][1]
            break
        end
    end

    -- item is a crystal or ore
    if itemId == 4096 then
        if weather >= dsp.weather.HOT_SPELL then
            itemId = crystalMap[weather]
        else
            itemId = 0
        end
    elseif itemId == 1255 then
        if weather >= dsp.weather.CLOUDS and moon >= 10 and moon <= 40 and player:getSkillRank(dsp.skill.DIG) >= 7 then
            itemId = oreMap[VanadielDayElement()]
        else
            itemId = 0
        end
    end

    return itemId
end

dsp.chocoboDig.start = function(player, precheck)
    local zoneId = player:getZoneID()
    local text = zones[zoneId].text

    -- make sure the player can dig before going any further
    -- (and also cause i need a return before core can go any further with this)
    if precheck then
        return canDig(player)

    else
        local roll = math.random(0, 100)
        local moon = VanadielMoonPhase()

        -- 45-60% moon phase results in a much lower dig chance than the rest of the phases
        if moon >= 45 and moon <= 60 then
            roll = roll * .5
        end

        -- dig chance failure
        if roll > DIGGING_RATE then
            player:messageText(player, text.FIND_NOTHING)

        -- dig chance success
        else
            local itemId = getChocoboDiggingItem(player)

            -- success!
            if itemId ~= 0 then
                -- make sure we have enough room for the item
                if player:addItem(itemId) then
                    player:messageSpecial(text.ITEM_OBTAINED, itemId)
                else
                    player:messageSpecial(text.DIG_THROW_AWAY, itemId)
                end

            -- got a crystal ore, but lacked weather or skill to dig it up
            else
                player:messageText(player, text.FIND_NOTHING, false)
            end

            updatePlayerDigCount(player, 1)
            -- updateZoneDigCount(zoneId, 1) -- TODO: implement mechanic for resetting zone dig count. until then, leave this commented out
            -- TODO: learn abilities from chocobo raising
        end

        calculateSkillUp(player)

        return true
    end
end