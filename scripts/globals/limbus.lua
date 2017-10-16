--------------------------------------
require("scripts/globals/keyitems")
--------------------------------------

APOLLYON_SE_NE = 1 -- out 557 -1 441 128
APOLLYON_NW_SW = 2 -- out -561 0 443 242
TEMENOS = 3
-- WHITE_CARD = 349
-- RED_CARD = 350
-- BLACK_CARD = 351
-- COSMOCLEANSE = 734

GATE_OFFSET = 16929221;

 --  REGION
Temenos_Northern_Tower = 1
Temenos_Eastern_Tower = 2
Temenos_Western_Tower = 3
Central_Temenos_4th_Floor = 4
Central_Temenos_3rd_Floor = 5
Central_Temenos_2nd_Floor = 6
Central_Temenos_1st_Floor = 7
Central_Temenos_Basement = 8
SW_Apollyon = 1
NW_Apollyon = 2
SE_Apollyon = 3
NE_Apollyon = 4
Central_Apollyon = 5
CS_Apollyon = 6

APOLLYON_SE_NE_BCNM_LIST =
{
    -- instanceID, white, red, black, bitmap, bit, instanceRegion
    1292, {false, false, true, 8, NE_Apollyon}, --  'NE_Apollyon'  region 3  438 0 -89
    1293, {false, false, true, 4, SE_Apollyon}, --  'SE_Apollyon'    468 0 -625
    1294, {false, false, false, 32, CS_Apollyon}, --  'CS_Apollyon'    0   0 -210
    1295, {false, false, false, 64, CS_Apollyon}, --  'CS_Apollyon_II'    0   0 -133
    1296, {false, false, false, 16, Central_Apollyon}, --  'Central_Apollyon'    0   0 210
    1297, {false, false, false, 128, Central_Apollyon}  --  'Central_Apollyon_II'  0   0 210
}

APOLLYON_NW_SW_BCNM_LIST =
{
    1290, {false, true, false, 2, NW_Apollyon}, --  'NW_Apollyon'    -439  0 -89
    1291, {false, true, false, 1, SW_Apollyon}, --  'SW_Apollyon'    -468  0 -626
    1294, {false, false, false, 32, CS_Apollyon}, --  'CS_Apollyon'    0   0 -210
    1295, {false, false, false, 64, CS_Apollyon}, --  'CS_Apollyon_II'    0   0 -133
    1296, {false, false, false, 16, Central_Apollyon}, --  'Central_Apollyon'    0   0 210
    1297, {false, false, false, 128, Central_Apollyon}  --  'Central_Apollyon_II'    0   0 210
}

TEMENOS_LIST =
{
    1298, {true, false, false, 4, Temenos_Western_Tower}, --  'Temenos_Western_Tower'    380 71 -184
    1299, {true, false, false, 1, Temenos_Northern_Tower}, --  'Temenos_Northern_Tower'   380 71 375
    1300, {true, false, false, 2, Temenos_Eastern_Tower}, --  'Temenos_Eastern_Tower'    380 -2 96
    1301, {false, false, false, 128, Central_Temenos_Basement}, --  'Central_Temenos_Basement' 580 -2 -544
    1302, {false, false, false, 256, Central_Temenos_Basement}, --  'Central_Temenos_Basement_II' 540 -2 -544
    1303, {false, false, false, 64, Central_Temenos_1st_Floor}, --  'Central_Temenos_1st_Floor' 260 -162 -504
    1304, {false, false, false, 32, Central_Temenos_2nd_Floor}, --  'Central_Temenos_2nd_Floor' 20 -2 -544
    1305, {false, false, false, 16, Central_Temenos_3rd_Floor}, --  'Central_Temenos_3rd_Floor' -296 -162 -500
    1306, {false, false, false, 8, Central_Temenos_4th_Floor}, --  'Central_Temenos_4th_Floor'  -540 -2  -584
    1307, {false, false, false, 512, Central_Temenos_4th_Floor}  --  'Central_Temenos_4th_Floor_II'  -540 -2  -584
}

MIMICPOSITION =
{
    1, {-363, 0, -282};
    2, {-359, 0, -277};
    3, {-326, 0, -301};
    4, {-331, 0, -330};
    5, {-340, 0, -330};
    6, {-345, 0, -311};
    7, {-339, 0, -300};
    8, {-335, 0, -281};
}

STATUS_NORMAL = 0
STATUS_DISAPPEAR = 2
cTIME = 1
cITEM = 2
cRESTORE = 3
cMIMIC = 4

ARMOURY_CRATES_LIST_APOLLYON =
{
    -- armoryID, (type, regionID, time, despawnothercoffer, mimicID, lootID)
    1, {cTIME, SE_Apollyon, 5, false, 0, 0}, --  time    SE_Apollyon floor 1
    2, {cITEM, SE_Apollyon, 0, false, 0, 110}, --  items    SE_Apollyon floor 1
    3, {cRESTORE, SE_Apollyon, 0, false, 0, 0}, --  restore    SE_Apollyon floor 1

    14, {cTIME, SW_Apollyon, 10, true, 0, 0}, --  time    SW_Apollyon floor 1
    15, {cITEM, SW_Apollyon, 0, true, 0, 119}, --  items    SW_Apollyon floor 1
    16, {cRESTORE, SW_Apollyon, 0, true, 0, 0}, --  restore    SW_Apollyon floor 1

    -- 32, {}, -- mimic
    -- 33, {}, -- mimic
    -- 34, {}, -- mimic
    -- 35, {}, -- mimic
    -- 36, {}, -- mimic
    -- 37, {}, -- mimic
    -- 38, {}, -- mimic
    39, {cITEM, Central_Apollyon, 0, false, 0, 128}, --  omega
    40, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 1 T1
    41, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 1 T2
    42, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 1 T3
    43, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 2 T1
    44, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 2 T2
    45, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time   NW_Apollyon floor 2 T3

    70, {cTIME, SW_Apollyon, 10, true, 0, 0}, --  time    SW_Apollyon floor 2
    71, {cITEM, SW_Apollyon, 0, true, 0, 120}, --  items    SW_Apollyon floor 2
    72, {cRESTORE, SW_Apollyon, 0, true, 0, 0}, --  restore    SW_Apollyon floor 2

    81, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 1 T2
    82, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 1 T3

    83, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 2 T2
    84, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 2 T3

    85, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 3 T2
    94, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 3 T3

    95, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 4 T2
    96, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 4 T3

    97, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 4 T2
    98, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 4  T3

    107, {cITEM, NW_Apollyon, 0, false, 0, 123}, --  item    NW_Apollyon floor 1
    108, {cITEM, NW_Apollyon, 0, false, 0, 124}, --  item    NW_Apollyon floor 2
    109, {cITEM, NW_Apollyon, 0, false, 0, 125}, --  item    NW_Apollyon floor 3
    110, {cITEM, NW_Apollyon, 0, false, 0, 126}, --  item    NW_Apollyon floor 4
    111, {cITEM, NW_Apollyon, 0, false, 0, 127}, --  item    NW_Apollyon floor 5

    118, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 1 T1
    119, {cITEM, NE_Apollyon, 0, false, 0, 114}, --  items    NE_Apollyon floor 1
    120, {cRESTORE, NE_Apollyon, 0, false, 0, 0}, --  restore    NE_Apollyon floor 1

    125, {cTIME, NE_Apollyon, 5, false, 0, 10}, --  time    NE_Apollyon floor 2 T1
    126, {cITEM, NE_Apollyon, 0, false, 0, 115}, --  items    NE_Apollyon floor 2
    127, {cRESTORE, NE_Apollyon, 0, false, 0, 0}, --  restore    NE_Apollyon floor 2

    139, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 3 T1
    140, {cITEM, NE_Apollyon, 0, false, 0, 116}, --  items    NE_Apollyon floor 3
    141, {cRESTORE, NE_Apollyon, 0, false, 0, 0}, --  restore    NE_Apollyon floor 3

    153, {cTIME, NE_Apollyon, 5, false, 0, 0}, --  time    NE_Apollyon floor 4 T1
    154, {cITEM, NE_Apollyon, 0, false, 0, 117}, --  items    NE_Apollyon floor 4
    155, {cRESTORE, NE_Apollyon, 0, false, 0, 0}, --  restore    NE_Apollyon floor 4

    177, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 3 T1
    178, {cITEM, NE_Apollyon, 0, false, 0, 118}, --  items    NE_Apollyon floor 5
    179, {cRESTORE, NW_Apollyon, 0, false, 0, 0}, --  restore    NW_Apollyon floor 4

    189, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 3 T2
    190, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 3 T3

    195, {cTIME, SW_Apollyon, 10, false, 0, 0}, --  time    SW_Apollyon floor 3
    196, {cITEM, SW_Apollyon, 5, false, 0, 121}, --  items    SW_Apollyon floor 3
    197, {cRESTORE, SW_Apollyon, 0, false, 0, 0}, --  restore    SW_Apollyon floor 3

    210, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    211, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    212, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    213, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    214, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    215, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic
    216, {cMIMIC, SW_Apollyon, 0, false, 0, 0}, -- PH for mimic

    232, {cTIME, SE_Apollyon, 5, false, 0, 0}, --  time    SE_Apollyon floor 2
    233, {cITEM, SE_Apollyon, 0, false, 0, 111}, --  items    SE_Apollyon floor 2
    234, {cRESTORE, SE_Apollyon, 0, false, 0, 0}, --  restore  SE_Apollyon floor 2

    246, {cTIME, SE_Apollyon, 10, false, 0, 0}, --  time    SE_Apollyon floor 3
    247, {cITEM, SE_Apollyon, 0, false, 0, 112}, --  items    SE_Apollyon floor 3
    248, {cRESTORE, SE_Apollyon, 0, false, 0, 0}, --  restore  SE_Apollyon floor 3

    259, {cITEM, Central_Apollyon, 0, false, 0, 129}, --  Pod

    262, {cTIME, NW_Apollyon, 5, false, 0, 0}, --  time    NW_Apollyon floor 4 T1
    263, {cITEM, SE_Apollyon, 0, false, 0, 113}, --  items    SE_Apollyon floor 4
    264, {cRESTORE, NW_Apollyon, 0, false, 0, 0}, --  restore    NW_Apollyon floor 1

    289, {cRESTORE, NW_Apollyon, 0, false, 0, 0}, --  restore    NW_Apollyon floor 2

    313, {cITEM, SW_Apollyon, 0, false, 0, 122}, --  items    SW_Apollyon floor 4

    327, {cRESTORE, NW_Apollyon, 0, false, 0, 0}, --  restore    NW_Apollyon floor 3
}

ARMOURY_CRATES_LIST_TEMENOS =
{
    -- armoryID, (type, regionID, time, despawnothercoffer, mimicID, lootID)
    1, {cITEM, Temenos_Western_Tower, 0, false, 0, 137},
    2, {cITEM, Temenos_Western_Tower, 0, false, 0, 138},
    3, {cITEM, Temenos_Western_Tower, 0, false, 0, 139},
    10, {cITEM, Temenos_Western_Tower, 0, false, 0, 140},
    11, {cITEM, Temenos_Western_Tower, 0, false, 0, 141},
    12, {cITEM, Temenos_Western_Tower, 0, false, 0, 142},
    17, {cITEM, Temenos_Western_Tower, 0, false, 0, 143},

    18, {cITEM, Temenos_Northern_Tower, 0, true, 0, 130}, --  F1
    19, {cITEM, Temenos_Northern_Tower, 0, true, 0, 131}, --  F2
    26, {cITEM, Temenos_Northern_Tower, 0, true, 0, 132}, --  F3
    27, {cITEM, Temenos_Northern_Tower, 0, true, 0, 133}, --  F4
    28, {cITEM, Temenos_Northern_Tower, 0, true, 0, 134}, --  F5
    38, {cITEM, Temenos_Northern_Tower, 0, true, 0, 135}, --  F6
    39, {cITEM, Temenos_Northern_Tower, 0, false, 0, 136}, --  F7

    40, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 144},
    45, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 145},
    46, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 146},
    47, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 147},
    68, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 148},
    69, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 149},
    70, {cITEM, Temenos_Eastern_Tower, 0, true, 0, 150},

    71, {cITEM, Central_Temenos_1st_Floor, 0, false, 0, 151},

    77, {cITEM, Central_Temenos_2nd_Floor, 0, false, 0, 152},

    78, {cITEM, Central_Temenos_3rd_Floor, 0, false, 0, 153},


    --  central 4eme floor -------------------------------
    79, {cITEM, Central_Temenos_4th_Floor, 0, true, 0, 154},
    --
    80, {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    86, {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    87, {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    88, {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},

    89, {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    95, {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    96, {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    97, {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},

    98, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    104, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    105, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    106, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},

    107, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},
    113, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},
    114, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},

    115, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},
    116, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},
    122, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},
    --
    123, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    127, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    -------------------------------------------
    128, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},
    129, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},
    139, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},
    140, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},
    141, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},
    151, {cTIME, Temenos_Western_Tower, 15, false, 0, 0},

    152, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F1
    153, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F2
    160, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F3
    161, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F4
    162, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F5
    172, {cTIME, Temenos_Northern_Tower, 15, true, 0, 0}, --  F6

    173, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},
    174, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},
    181, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},
    182, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},
    183, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},
    190, {cTIME, Temenos_Eastern_Tower, 15, true, 0, 0},

    197, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    199, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    200, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    201, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    202, {cTIME, Central_Temenos_Basement, 0, false, 0, 181},


    203, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},
    204, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},
    205, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},
    206, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},
    207, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},
    208, {cRESTORE, Temenos_Western_Tower, 0, false, 0, 0},

    209, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F1
    210, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F2
    211, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F3
    212, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F4
    213, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F5
    214, {cRESTORE, Temenos_Northern_Tower, 0, true, 0, 0}, --  F6

    215, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},
    216, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},
    217, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},
    236, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},
    261, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},
    277, {cRESTORE, Temenos_Eastern_Tower, 0, true, 0, 0},

    284, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    321, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    348, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    360, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0},
    393, {cMIMIC, Temenos_Eastern_Tower, 0, true, 0, 0}
}

function enterApollyon(player, entrance)
    switch (entrance): caseof
    {
        [APOLLYON_SE_NE] = function (x)
            player:setPos(643, 0.1, -600, 124, 0x26)  --  instance entrer 600 1 -600
        end, --  sortiezone  637, -4, -642, 642, 4, -637
        [APOLLYON_NW_SW] = function (x)
            player:setPos(-668, 0.1, -666, 209, 0x26)  --  instance entrer -599 0 -600
        end, --  sortiezone -642, -4, -642, -637, 4, -637
    }
end

function HideArmouryCrates(Region, Zone)
    if (Zone == APOLLYON_SE_NE or Zone == APOLLYON_NW_SW) then
        for X = 1, #ARMOURY_CRATES_LIST_APOLLYON, 2 do
            if (ARMOURY_CRATES_LIST_APOLLYON[X+1][2] == Region) then
                GetNPCByID((ARMOURY_CRATES_LIST_APOLLYON[X])+16932864):setStatus(STATUS_DISAPPEAR)
            end
        end
    elseif (Zone == TEMENOS) then
        for X = 1, #ARMOURY_CRATES_LIST_TEMENOS, 2 do
            if (ARMOURY_CRATES_LIST_TEMENOS[X+1][2] == Region) then
                GetNPCByID((ARMOURY_CRATES_LIST_TEMENOS[X])+16928768):setStatus(STATUS_DISAPPEAR)
            end
        end
    end
end

function HideTemenosDoor(Region)

    if (Region == Temenos_Northern_Tower) then
        GetNPCByID(GATE_OFFSET +  0):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  1):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  2):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  3):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  4):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  5):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  6):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Temenos_Eastern_Tower) then
        GetNPCByID(GATE_OFFSET +  7):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  8):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET +  9):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 10):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 11):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 12):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 13):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Temenos_Western_Tower) then
        GetNPCByID(GATE_OFFSET + 14):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 15):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 16):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 17):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 18):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 19):setStatus(STATUS_DISAPPEAR)
        GetNPCByID(GATE_OFFSET + 20):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Central_Temenos_1st_Floor) then
        GetNPCByID(GATE_OFFSET + 21):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Central_Temenos_2nd_Floor) then
        GetNPCByID(GATE_OFFSET + 22):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Central_Temenos_3rd_Floor) then
        GetNPCByID(GATE_OFFSET + 23):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Central_Temenos_4th_Floor) then
        GetNPCByID(GATE_OFFSET + 24):setStatus(STATUS_DISAPPEAR)
    elseif (Region == Central_Temenos_Basement) then
        GetNPCByID(GATE_OFFSET + 25):setStatus(STATUS_DISAPPEAR)
    end
end

function IselementalDayAreDead()
    local day = GetServerVariable("[SW_Apollyon]ElementalTrigger") - 1
    local daykill=false
    if (day == 0) then  --  fire
        if (GetMobByID(16932913):isDead() and GetMobByID(16932921):isDead() and GetMobByID(16932929):isDead()) then
            daykill = true
        end
    elseif (day == 1) then --  earth
        if (GetMobByID(16932912):isDead() and GetMobByID(16932920):isDead() and GetMobByID(16932928):isDead()) then
            daykill = true
        end
    elseif (day == 2) then --  water
        if (GetMobByID(16932916):isDead() and GetMobByID(16932924):isDead() and GetMobByID(16932932):isDead()) then
            daykill = true
        end
    elseif (day == 3) then --  wind
        if (GetMobByID(16932910):isDead() and GetMobByID(16932918):isDead() and GetMobByID(16932926):isDead()) then
            daykill = true
        end
    elseif (day == 4) then --  ice
        if (GetMobByID(16932914):isDead() and GetMobByID(16932922):isDead() and GetMobByID(16932930):isDead()) then
            daykill = true
        end
    elseif (day == 5) then --  lightning
        if (GetMobByID(16932917):isDead() and GetMobByID(16932925):isDead() and GetMobByID(16932933):isDead()) then
            daykill = true
        end
    elseif (day == 6) then --  light
        if (GetMobByID(16932931):isDead() and GetMobByID(16932915):isDead() and GetMobByID(16932923):isDead()) then
            daykill = true
        end
    elseif (day == 7) then  --  dark
        if (GetMobByID(16932911):isDead() and GetMobByID(16932919):isDead() and GetMobByID(16932927):isDead()) then
            daykill = true
        end
    end

    return daykill
end

--------------------------------------------------
 --  alreadyReceived
 --  I use this function for TE and Boss Trigger
--------------------------------------------------

function alreadyReceived(player, number, region)
    local LimbusVar = 0
    local bit = {}
    local pZone = player:getZoneID()

    if (pZone == 37) then
        --  WHY? Why is there even HERE?
    elseif (pZone == 38) then
        LimbusVar = GetServerVariable("[CS_Apollyon]Already_Received")
    end

    for i = 12, 0, -1 do
        local twop = 2^i
        if (LimbusVar >= twop) then
            bit[i+1] = 1
            LimbusVar = LimbusVar - twop
        else
            bit[i+1] = 0
        end
    end
    --  printf("received %u", bit[number])
    if (bit[number] == 0) then
        return false
    else
        return true
    end
end

function addLimbusList(player, number, Region)
    local pZone = player:getZoneID()

    if (pZone == 37) then
        --  The hell?
    elseif (pZone == 38) then
        SetServerVariable("[CS_Apollyon]Already_Received", GetServerVariable("[CS_Apollyon]Already_Received") + number)
    end
end

function getBattlefieldEntrance(player, inst)
    local zone = player:getZoneID();

    -- Temenos
    if (zone == 37) then
        if     (inst == 1) then return  380,   71.0,  376;
        elseif (inst == 2) then return  380,   -2.5,   96;
        elseif (inst == 3) then return  380,   71.5, -184;
        elseif (inst == 4) then return -540,   -2.5, -584;
        elseif (inst == 5) then return -296, -162.5, -500;
        elseif (inst == 6) then return   20,   -2.5, -544;
        elseif (inst == 7) then return  260, -162.5, -504;
        elseif (inst == 8) then return  580,   -2.5, -544;
        else                    return  580,   -1.5,    5;
        end
    
    -- Apollyon
    elseif (zone == 38) then
        if     (inst == 1) then return -468, 0, -626;
        elseif (inst == 2) then return -439, 0,  -89;
        elseif (inst == 3) then return  468, 0, -625;
        elseif (inst == 4) then return  438, 0,  -89;
        elseif (inst == 5) then return    0, 0,  210;
        elseif (inst == 6) then return    0, 0, -210;
        else                    return  643, 0, -600;
        end

    end
end

function belongsInBattlefield(player)
    local zone = player:getZoneID();
    local key = player:getVar("characterLimbusKey");
    
    -- Temenos
    if (zone == 37) then
        if (key == GetServerVariable("[Temenos_N_Tower]UniqueID")   ) then return 1; end
        if (key == GetServerVariable("[Temenos_E_Tower]UniqueID")   ) then return 2; end
        if (key == GetServerVariable("[Temenos_W_Tower]UniqueID")   ) then return 3; end
        if (key == GetServerVariable("[C_Temenos_4th]UniqueID")     ) then return 4; end
        if (key == GetServerVariable("[C_Temenos_3rd]UniqueID")     ) then return 5; end
        if (key == GetServerVariable("[C_Temenos_2nd]UniqueID")     ) then return 6; end
        if (key == GetServerVariable("[C_Temenos_1st]UniqueID")     ) then return 7; end
        if (key == GetServerVariable("[C_Temenos_Base]UniqueID")    ) then return 8; end
        if (key == GetServerVariable("[C_Temenos_Base_II]UniqueID") ) then return 8; end
        if (key == GetServerVariable("[C_Temenos_4th_II]UniqueID")  ) then return 4; end
    
    -- Apollyon
    elseif (zone == 38) then
        if (key == GetServerVariable("[SW_Apollyon]UniqueID")           ) then return 1; end
        if (key == GetServerVariable("[NW_Apollyon]UniqueID")           ) then return 2; end
        if (key == GetServerVariable("[SE_Apollyon]UniqueID")           ) then return 3; end
        if (key == GetServerVariable("[NE_Apollyon]UniqueID")           ) then return 4; end
        if (key == GetServerVariable("[Central_Apollyon]UniqueID")      ) then return 5; end
        if (key == GetServerVariable("[CS_Apollyon]UniqueID")           ) then return 6; end
        if (key == GetServerVariable("[CS_Apollyon_II]UniqueID")        ) then return 6; end
        if (key == GetServerVariable("[Central_Apollyon_II]UniqueID")   ) then return 5; end

    end
    return -1;
end

function despawnLimbusCS()
    for n = 16933130, 16933136, 1 do
        if (GetMobByID(n):isSpawned()) then
            DespawnMob(n)
        end
    end

    for n = 16933138, 16933143, 1 do
        if (GetMobByID(n):isSpawned()) then
            DespawnMob(n)
        end
    end

    for n = 16933145, 16933152, 1 do
        if (GetMobByID(n):isSpawned()) then
            DespawnMob(n)
        end
    end
end

function SpawnCofferSWfloor3()
    --  print("spawn_coffer")
    GetNPCByID(16932864+210):setPos(MIMICPOSITION[2][1], MIMICPOSITION[2][2], MIMICPOSITION[2][3])
    GetNPCByID(16932864+210):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+211):setPos(MIMICPOSITION[4][1], MIMICPOSITION[4][2], MIMICPOSITION[4][3])
    GetNPCByID(16932864+211):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+212):setPos(MIMICPOSITION[6][1], MIMICPOSITION[6][2], MIMICPOSITION[6][3])
    GetNPCByID(16932864+212):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+213):setPos(MIMICPOSITION[8][1], MIMICPOSITION[8][2], MIMICPOSITION[8][3])
    GetNPCByID(16932864+213):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+214):setPos(MIMICPOSITION[10][1], MIMICPOSITION[10][2], MIMICPOSITION[10][3])
    GetNPCByID(16932864+214):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+215):setPos(MIMICPOSITION[12][1], MIMICPOSITION[12][2], MIMICPOSITION[12][3])
    GetNPCByID(16932864+215):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+216):setPos(MIMICPOSITION[14][1], MIMICPOSITION[14][2], MIMICPOSITION[14][3])
    GetNPCByID(16932864+216):setStatus(STATUS_NORMAL)
    SetServerVariable("[SW_Apollyon]MimicTrigger", 1)
end

function SpawnCofferNEfloor1()
    --print ("spawn_coffer")
    GetNPCByID(16932864+81):setPos(453,0,31)
    GetNPCByID(16932864+81):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+82):setPos(459,0,29)
    GetNPCByID(16932864+82):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+118):setPos(452,0,15)
    GetNPCByID(16932864+118):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+120):setPos(470,0,32)
    GetNPCByID(16932864+120):setStatus(STATUS_NORMAL)

    GetNPCByID(16932864+83):setPos(333,0,228)
    GetNPCByID(16932864+83):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+84):setPos(410,0,279)
    GetNPCByID(16932864+84):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+125):setPos(316,0,363)
    GetNPCByID(16932864+125):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+127):setPos(369,0,325)
    GetNPCByID(16932864+127):setStatus(STATUS_NORMAL)

    GetNPCByID(16932864+85):setPos(211,0,554)
    GetNPCByID(16932864+85):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+94):setPos(307,0,530)
    GetNPCByID(16932864+94):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+139):setPos(362,0,556)
    GetNPCByID(16932864+139):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+141):setPos(363,0,538)
    GetNPCByID(16932864+141):setStatus(STATUS_NORMAL)

    GetNPCByID(16932864+95):setPos(587,0,536)
    GetNPCByID(16932864+95):setStatus(STATUS_NORMAL) 
    GetNPCByID(16932864+96):setPos(560,0,580)
    GetNPCByID(16932864+96):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+153):setPos(558,0,644)
    GetNPCByID(16932864+153):setStatus(STATUS_NORMAL)
    GetNPCByID(16932864+155):setPos(585,0,597)
    GetNPCByID(16932864+155):setStatus(STATUS_NORMAL)
end

function SpawnCofferTemenosCFloor4()
    --  print("spawn_coffer")
    GetNPCByID(16928768+80):setPos(-560, -6, -459)
    GetNPCByID(16928768+80):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+86):setPos(-540, -6, -459)
    GetNPCByID(16928768+86):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+87):setPos(-576, -6, -459)
    GetNPCByID(16928768+87):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+88):setPos(-528, -6, -459)
    GetNPCByID(16928768+88):setStatus(STATUS_NORMAL)

    GetNPCByID(16928768+89):setPos(-592, -6, -487)
    GetNPCByID(16928768+89):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+95):setPos(-566, -6, -486)
    GetNPCByID(16928768+95):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+96):setPos(-566, -6, -513)
    GetNPCByID(16928768+96):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+97):setPos(-592, -6, -513)
    GetNPCByID(16928768+97):setStatus(STATUS_NORMAL)

    GetNPCByID(16928768+98):setPos(-531, -0.5, -501)
    GetNPCByID(16928768+98):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+104):setPos(-527, -6, -512)
    GetNPCByID(16928768+104):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+105):setPos(-552, -6, -512)
    GetNPCByID(16928768+105):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+106):setPos(-552, -6, -488)
    GetNPCByID(16928768+106):setStatus(STATUS_NORMAL)

    GetNPCByID(16928768+107):setPos(-488, 2, -510)
    GetNPCByID(16928768+107):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+113):setPos(-486, 2, -491)
    GetNPCByID(16928768+113):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+114):setPos(-508, 2, -513)
    GetNPCByID(16928768+114):setStatus(STATUS_NORMAL)

    GetNPCByID(16928768+115):setPos(-488, 2, -408)
    GetNPCByID(16928768+115):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+116):setPos(-485, 2, -423)
    GetNPCByID(16928768+116):setStatus(STATUS_NORMAL)
    GetNPCByID(16928768+122):setPos(-506, 2, -406)
    GetNPCByID(16928768+122):setStatus(STATUS_NORMAL)
end

function Randomcoffer(Floor, region)
    local cofferID = 0
    local cofferType = 0
    local spawnchance=math.random(0, 100)

    if (spawnchance < 31) then
        if (spawnchance < 15) then
            cofferType=cITEM
        elseif (spawnchance < 25) then
            cofferType=cRESTORE
        elseif (spawnchance < 30) then
            cofferType=cTIME
        end
    else
        --  print("nothing_spawn")
    end

    if (region == Temenos_Western_Tower and cofferType == cITEM) then
        switch (Floor): caseof
        {
            [1] = function (x)
                cofferID = 1
            end,
            [2] = function (x)
                cofferID = 2
            end,
            [3] = function (x)
                cofferID = 3
            end,
            [4] = function (x)
                cofferID = 10
            end,
            [5] = function (x)
                cofferID = 11
            end,
            [6] = function (x)
                cofferID = 12
            end,
        }
    elseif (region == Temenos_Western_Tower and cofferType == cRESTORE) then
        switch (Floor): caseof
        {
            [1] = function (x)
                cofferID = 203
            end,
            [2] = function (x)
                cofferID = 204
            end,
            [3] = function (x)
                cofferID = 205
            end,
            [4] = function (x)
                cofferID = 206
            end,
            [5] = function (x)
                cofferID = 207
            end,
            [6] = function (x)
                cofferID = 208
            end,
        }
    elseif (region == Temenos_Western_Tower and cofferType == cTIME) then
        switch (Floor): caseof
        {
            [1] = function (x)
                cofferID = 128
            end,
            [2] = function (x)
                cofferID = 129
            end,
            [3] = function (x)
                cofferID = 139
            end,
            [4] = function (x)
                cofferID = 140
            end,
            [5] = function (x)
                cofferID = 141
            end,
            [6] = function (x)
                cofferID = 151
            end,
        }
    end
    --  print("cofferID" ..cofferID)
    return cofferID
end
