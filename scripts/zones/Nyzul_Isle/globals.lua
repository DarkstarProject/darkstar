-----------------------------------
-- Nyzul Isle Global
-----------------------------------
local ID = require("scripts/zones/Nyzul_Isle/IDs")
-----------------------------------

nyzul = nyzul or {}


nyzul.objective =
{
    ELIMINATE_ENEMY_LEADER        = 0,
    ELIMINATE_SPECIFIED_ENEMIES   = 1,
    ACTIVATE_ALL_LAMPS            = 2,
    ELIMINATE_SPECIFIED_ENEMY     = 3,
    ELIMINATE_ALL_ENEMIES         = 4,
    FREE_FLOOR                    = 5,
}

nyzul.FloorLayout =
{
    [0]  = { -20, -0.5, -380}, -- boss floors 20, 40, 60, 80
    [1]  = { 380, -0.5, -500},
    [2]  = { 500, -0.5,  -20},
    [3]  = { 500, -0.5,   60},
    [4]  = { 500, -0.5, -100},
    [5]  = { 540, -0.5, -140},
    [6]  = { 460, -0.5, -219},
    [7]  = { 420, -0.5,  500},
    [8]  = {  60, -0.5, -335},
    [9]  = {  20, -0.5, -500},
    [10] = { -95, -0.5,   60},
    [11] = { 100, -0.5,  100},
    [12] = {-460, -4.0, -180},
    [13] = {-304, -0.5, -380},
    [14] = {-380, -0.5, -500},
    [15] = {-459, -4.0, -540},
    [16] = {-465, -4.0, -340},
}

nyzul.floorCost =
{
    [1]  = {level =  1, cost =    0},
    [2]  = {level =  6, cost =  500},
    [3]  = {level = 11, cost =  550},
    [4]  = {level = 16, cost =  600},
    [5]  = {level = 21, cost =  650},
    [6]  = {level = 26, cost =  700},
    [7]  = {level = 31, cost =  750},
    [8]  = {level = 36, cost =  800},
    [9]  = {level = 41, cost =  850},
    [10] = {level = 46, cost =  900},
    [11] = {level = 51, cost = 1000},
    [12] = {level = 56, cost = 1100},
    [13] = {level = 61, cost = 1200},
    [14] = {level = 66, cost = 1300},
    [15] = {level = 71, cost = 1400},
    [16] = {level = 76, cost = 1500},
    [17] = {level = 81, cost = 1600},
    [18] = {level = 86, cost = 1700},
    [19] = {level = 91, cost = 1800},
    [20] = {level = 96, cost = 1900},
}

nyzul.floorPick =
{
    [0]  = 0,
    [1]  = 4,
    [2]  = 12,
    [3]  = 28,
    [4]  = 60,
    [5]  = 124,
    [6]  = 252,
    [7]  = 508,
    [8]  = 1020,
    [9]  = 2044,
    [10] = 4092,
    [11] = 8188,
    [12] = 16380,
    [13] = 32764,
    [14] = 65532,
    [15] = 131068,
    [16] = 262140,
    [17] = 524284,
    [18] = 1048572,
    [19] = 2097148,
    [20] = 4194300,
    [21] = 8388604,
    [22] = 16777212,
}

nyzul.RunicDisk =
{
 --   [1] = 
}

nyzul.pickMobs =
{
    [0] = -- 20th Floor bosses
    {
        [40] = -- 20 and 40 floor Bosses
        {
            ADAMANTOISE = 17092999,
            FAFNIR      = 17093001,
        },
        [100] = -- floors 60, 80 and 100 floor bosses
        {
            KHIMAIRA = 17093002,
            CERBERUS = 17093004,
        },
    },
    [1] = -- Enemy Leaders, can appear on all floors but %20 that are on objective
    {
        MOKKE               = 17092944,
        LONG_HORNED_CHARIOT = 17092968,
    },
    [2] = -- Regular NM's
    {
        [20] = -- floor 1 to 19 NM's
        {
            BAT_EYE      = 17092824,
            EMERGENT_ELM = 17092841,
        },
        [40] = -- floor 21 to 39 NM's
        {
            OLD_TWO_WINGS = 17092842,
            TAISAIJIN     = 17092859,
        },
        [60] = -- floor 41 to 59 NM's
        {
            FUNGUS_BEETLE = 17092860,
            TAISAIJIN     = 17092877,
        },
        [80] = -- floor 61 to 79 NM's
        {
            GOLDEN_BAT = 17092878,
            TAISAIJIN  = 17092895,
        },
        [100] = -- floor 81 to 99 NM's
        {
            PANZER_PERCIVAL = 17092896,
            TAISAIJIN       = 17092913,
        },
    },
}

nyzul.FloorEntities = -- regular mobs by layout
{
    [1] = -- Aquans
    {
        start = 17092631,
        stop  = 17092642,
    },
    [2] = -- Amorphs
    {
        start = 17092643,
        stop  = 17092654,
    },
    [3] = -- Arcana
    {
        start = 17092655,
        stop  = 17092666,
    },
    [4] = -- Undead
    {
        start = 17092667,
        stop  = 17092678,
    },
    [5] = -- Vermin
    {
        start = 17092679,
        stop  = 17092690,
    },
    [6] = -- Demons
    {
        start = 17092691,
        stop  = 17092702,
    },
    [7] = -- Dragons
    {
        start = 17092703,
        stop  = 17092714,
    },
    [8] = -- Birds
    {
        start = 17092715,
        stop  = 17092726,
    },
    [9] = -- Beasts
    {
        start = 17092727,
        stop  = 17092738,
    },
    [10] = -- Plantoids
    {
        start = 17092739,
        stop  = 17092750,
    },
    [11] =  -- Lizards
    {
        start = 17092751,
        stop  = 17092762,
    },
    [12] = -- Amorphs
    {
        start = 17092763,
        stop  = 17092774,
    },
    [13] = -- Mixed
    {
        start = 17092775,
        stop  = 17092786,
    },
    [14] = -- Mixed
    {
        start = 17092787,
        stop  = 17092798,
    },
    [15] = -- Amorphs
    {
        start = 17092799,
        stop  = 17092810,
    },
    [16] = -- Arcana
    {
        start = 17092811,
        stop  = 17092822,
    },
    [17] =
    {
        Dahak = 17092823,
    },
}

nyzul.SpawnPoint = -- set spawnpoint by layout
{
    [1] =
    {
    },
    [2] =
    {
    },
    [3] =
    {
    },
    [4] =
    {
    },
    [5] =
    {
        [0]  = {566, 0, -143, math.random(0,359)},
        [1]  = {577, 0, -142, math.random(0,359)},
        [2]  = {619, 0, -139, math.random(0,359)},
        [3]  = {550, 0,   10, math.random(0,359)},
        [4]  = {619, 0,  -60, math.random(0,359)},
        [5]  = {626, 0,  -17, math.random(0,359)},
        [6]  = {619, 0,   18, math.random(0,359)},
        [7]  = {579, 0,   20, math.random(0,359)},
        [8]  = {539, 0,   19, math.random(0,359)},
        [9]  = {573, 0, -126, math.random(0,359)},
        [10] = {578, 0, -153, math.random(0,359)},
        [11] = {593, 0, -146, math.random(0,359)},
        [12] = {607, 0, -142, math.random(0,359)},
        [13] = {620, 0, -129, math.random(0,359)},
        [14] = {628, 0, -109, math.random(0,359)},
        [15] = {614, 0, -104, math.random(0,359)},
        [16] = {616, 0,  -89, math.random(0,359)},
        [17] = {623, 0,  -96, math.random(0,359)},
        [18] = {622, 0,  -73, math.random(0,359)},
        [19] = {619, 0,  -50, math.random(0,359)},
        [20] = {629, 0,  -32, math.random(0,359)},
        [21] = {615, 0,  -24, math.random(0,359)},
        [22] = {615, 0,   -7, math.random(0,359)},
        [23] = {618, 0,    7, math.random(0,359)},
        [24] = {606, 0,   21, math.random(0,359)},
        [25] = {594, 0,   23, math.random(0,359)},
        [26] = {584, 0,    9, math.random(0,359)},
        [27] = {576, 0,   15, math.random(0,359)},
        [28] = {567, 0,   34, math.random(0,359)},
        [29] = {553, 0,   24, math.random(0,359)},
        [30] = {541, 0,   11, math.random(0,359)},
    },
    [6] =
    {
    },
    [7] =
    {
    },
    [8] =
    {
    },
    [9] =
    {
    },
    [10] =
    {
    },
    [11] =
    {
    },
    [12] =
    {
    },
    [13] =
    {
    },
    [14] =
    {
    },
    [15] =
    {
    },
    [16] =
    {
    },
}