--------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/status")
require("scripts/globals/zone")
--------------------------------------

limbus = {}

-- dsp.ki.WHITE_CARD = 349
-- dsp.ki.RED_CARD = 350
-- dsp.ki.BLACK_CARD = 351
-- dsp.ki.COSMOCLEANSE = 734

APOLLYON_SE_NE = 1 -- out 557 -1 441 128
APOLLYON_NW_SW = 2 -- out -561 0 443 242
TEMENOS        = 3

 --  REGION
NW_Apollyon      = 1
SW_Apollyon      = 2
NE_Apollyon      = 3
SE_Apollyon      = 4
CS_Apollyon      = 5
Central_Apollyon = 6
Temenos_Western_Tower     = 1
Temenos_Northern_Tower    = 2
Temenos_Eastern_Tower     = 3
Central_Temenos_Basement  = 4
Central_Temenos_1st_Floor = 5
Central_Temenos_2nd_Floor = 6
Central_Temenos_3rd_Floor = 7
Central_Temenos_4th_Floor = 8

-- Armoury crate type
cTIME    = 1
cITEM    = 2
cRESTORE = 3
cMIMIC   = 4

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

-- armoryID, (type, regionID, time, despawnothercoffer, mimicID, lootID)
ARMOURY_CRATE_APOLLYON =
{
    -----------------------------------------------
    -- SE_Apollyon
    -----------------------------------------------
    -- floor 1
    1,   {cTIME,    SE_Apollyon,  5, false, 0,   0}, -- time
    2,   {cITEM,    SE_Apollyon,  0, false, 0, 110}, -- items
    3,   {cRESTORE, SE_Apollyon,  0, false, 0,   0}, -- restore
    -- floor 2
    232, {cTIME,    SE_Apollyon,  5, false, 0,   0}, -- time
    233, {cITEM,    SE_Apollyon,  0, false, 0, 111}, -- items
    234, {cRESTORE, SE_Apollyon,  0, false, 0,   0}, -- restore
    -- floor 3
    246, {cTIME,    SE_Apollyon, 10, false, 0,   0}, -- time
    247, {cITEM,    SE_Apollyon,  0, false, 0, 112}, -- items
    248, {cRESTORE, SE_Apollyon,  0, false, 0,   0}, -- restore
    -- floor 4
    263, {cITEM,    SE_Apollyon,  0, false, 0, 113}, -- items

    -----------------------------------------------
    -- SW_Apollyon
    -----------------------------------------------
    -- floor 1
    14,  {cTIME,    SW_Apollyon, 10, false, 0,   0}, -- time
    15,  {cITEM,    SW_Apollyon,  0, false, 0, 119}, -- items
    16,  {cRESTORE, SW_Apollyon,  0, false, 0,   0}, -- restore
    -- floor 2
    70,  {cTIME,    SW_Apollyon, 10,  true, 0,   0}, -- time
    71,  {cITEM,    SW_Apollyon,  0,  true, 0, 120}, -- items
    72,  {cRESTORE, SW_Apollyon,  0,  true, 0,   0}, -- restore
    -- floor 3
    195, {cTIME,    SW_Apollyon, 10, false, 0,   0}, -- time
    196, {cITEM,    SW_Apollyon,  5, false, 0, 121}, -- items
    197, {cRESTORE, SW_Apollyon,  0, false, 0,   0}, -- restore
    -- floor 4
    313, {cITEM,    SW_Apollyon,  0, false, 0, 122}, -- items

    -----------------------------------------------
    -- NW_Apollyon
    -----------------------------------------------
    -- floor 1
    40,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T1
    41,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T2
    42,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T3
    107, {cITEM,    NW_Apollyon, 0, false, 0, 123}, -- item
    264, {cRESTORE, NW_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 2
    43,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T1
    44,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T2
    45,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T3
    108, {cITEM,    NW_Apollyon, 0, false, 0, 124}, -- item
    289, {cRESTORE, NW_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 3
    109, {cITEM,    NW_Apollyon, 0, false, 0, 125}, -- item
    177, {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T1
    189, {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T2
    190, {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T3
    327, {cRESTORE, NW_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 4
    97,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T2
    98,  {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T3
    110, {cITEM,    NW_Apollyon, 0, false, 0, 126}, -- item
    179, {cRESTORE, NW_Apollyon, 0, false, 0,   0}, -- restore
    262, {cTIME,    NW_Apollyon, 5, false, 0,   0}, -- time T1
    -- floor 5
    111, {cITEM,    NW_Apollyon, 0, false, 0, 127}, -- item

    -----------------------------------------------
    -- NE_Apollyon
    -----------------------------------------------
    -- floor 1
    81,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T2
    82,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T3
    118, {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T1
    119, {cITEM,    NE_Apollyon, 0, false, 0, 114}, -- items
    120, {cRESTORE, NE_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 2
    83,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T2
    84,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T3
    125, {cTIME,    NE_Apollyon, 5, false, 0,  10}, -- time T1
    126, {cITEM,    NE_Apollyon, 0, false, 0, 115}, -- items
    127, {cRESTORE, NE_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 3
    85,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T2
    94,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T3
    139, {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T1
    140, {cITEM,    NE_Apollyon, 0, false, 0, 116}, -- items
    141, {cRESTORE, NE_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 4
    95,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T2
    96,  {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T3
    153, {cTIME,    NE_Apollyon, 5, false, 0,   0}, -- time T1
    154, {cITEM,    NE_Apollyon, 0, false, 0, 117}, -- items
    155, {cRESTORE, NE_Apollyon, 0, false, 0,   0}, -- restore
    -- floor 5
    178, {cITEM,    NE_Apollyon, 0, false, 0, 118}, -- items

    -- 32, {}, -- mimic
    -- 33, {}, -- mimic
    -- 34, {}, -- mimic
    -- 35, {}, -- mimic
    -- 36, {}, -- mimic
    -- 37, {}, -- mimic
    -- 38, {}, -- mimic
    39,  {cITEM,  Central_Apollyon, 0, false, 0, 128}, --  omega
    210, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    211, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    212, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    213, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    214, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    215, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    216, {cMIMIC, SW_Apollyon,      0, false, 0,   0}, -- PH for mimic
    259, {cITEM,  Central_Apollyon, 0, false, 0, 129}, --  Pod
}

-- armoryID, (type, regionID, time, despawnothercoffer, mimicID, lootID)
ARMOURY_CRATE_TEMENOS =
{
    -----------------------------------------------
    -- Temenos_Western_Tower
    -----------------------------------------------
    1,   {cITEM,    Temenos_Western_Tower,  0, false, 0, 137},
    2,   {cITEM,    Temenos_Western_Tower,  0, false, 0, 138},
    3,   {cITEM,    Temenos_Western_Tower,  0, false, 0, 139},
    10,  {cITEM,    Temenos_Western_Tower,  0, false, 0, 140},
    11,  {cITEM,    Temenos_Western_Tower,  0, false, 0, 141},
    12,  {cITEM,    Temenos_Western_Tower,  0, false, 0, 142},
    17,  {cITEM,    Temenos_Western_Tower,  0, false, 0, 143}, -- Boss chest
    128, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    129, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    139, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    140, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    141, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    151, {cTIME,    Temenos_Western_Tower, 15, false, 0,   0},
    203, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},
    204, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},
    205, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},
    206, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},
    207, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},
    208, {cRESTORE, Temenos_Western_Tower,  0, false, 0,   0},

    -----------------------------------------------
    -- Temenos_Northern_Tower
    -----------------------------------------------
    18,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 130}, --  F1
    19,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 131}, --  F2
    26,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 132}, --  F3
    27,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 133}, --  F4
    28,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 134}, --  F5
    38,  {cITEM,    Temenos_Northern_Tower,  0, true,  0, 135}, --  F6
    39,  {cITEM,    Temenos_Northern_Tower,  0, false, 0, 136}, --  F7 -- Boss chest
    152, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F1
    153, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F2
    160, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F3
    161, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F4
    162, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F5
    172, {cTIME,    Temenos_Northern_Tower, 15, true,  0,   0}, --  F6
    209, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F1
    210, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F2
    211, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F3
    212, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F4
    213, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F5
    214, {cRESTORE, Temenos_Northern_Tower,  0, true,  0,   0}, --  F6

    -----------------------------------------------
    -- Temenos_Eastern_Tower
    -----------------------------------------------
    40,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 144},
    45,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 145},
    46,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 146},
    47,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 147},
    68,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 148},
    69,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 149},
    70,  {cITEM,    Temenos_Eastern_Tower,  0, true, 0, 150}, -- Boss chest
    123, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    173, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    174, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    181, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    182, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    183, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    190, {cTIME,    Temenos_Eastern_Tower, 15, true, 0,   0},
    215, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    216, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    217, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    236, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    261, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    202, {cRESTORE, Temenos_Eastern_Tower,  0, true, 0,   0},
    284, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    321, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    348, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    360, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    393, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},
    277, {cMIMIC,   Temenos_Eastern_Tower,  0, true, 0,   0},

    -----------------------------------------------
    -- Central_Temenos_1st_Floor
    -----------------------------------------------
    71, {cITEM, Central_Temenos_1st_Floor, 0, false, 0, 151}, -- Boss chest

    -----------------------------------------------
    -- Central_Temenos_2nd_Floor
    -----------------------------------------------
    77, {cITEM, Central_Temenos_2nd_Floor, 0, false, 0, 152}, -- Boss chest

    -----------------------------------------------
    -- Central_Temenos_3rd_Floor
    -----------------------------------------------
    78, {cITEM, Central_Temenos_3rd_Floor, 0, false, 0, 153}, -- Boss chest

    -----------------------------------------------
    -- Central_Temenos_4th_Floor
    -----------------------------------------------
    79,  {cITEM, Central_Temenos_4th_Floor, 0, false, 0, 154}, -- Boss chest
    80,  {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    86,  {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    87,  {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    88,  {cITEM, Central_Temenos_4th_Floor, 0, false, 1, 155},
    89,  {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    95,  {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    96,  {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    97,  {cITEM, Central_Temenos_4th_Floor, 0, false, 2, 155},
    98,  {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    104, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    105, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    106, {cITEM, Central_Temenos_4th_Floor, 0, false, 3, 155},
    107, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},
    113, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},
    114, {cITEM, Central_Temenos_4th_Floor, 0, false, 4, 155},
    115, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},
    116, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},
    122, {cITEM, Central_Temenos_4th_Floor, 0, false, 5, 155},

    -----------------------------------------------
    -- Central_Temenos_Basement
    -----------------------------------------------
    197, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    199, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    200, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    201, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
    127, {cTIME, Central_Temenos_Basement, 5, false, 0, 0},
}

function limbus.enter(player, entrance)
    switch (entrance): caseof
    {
        [1] = function ()
            player:setPos(643, 0.1, -600, 124, 38)  --  instance entrer 600 1 -600
        end, --  sortiezone  637, -4, -642, 642, 4, -637
        [2] = function ()
            player:setPos(-668, 0.1, -666, 209, 38)  --  instance entrer -599 0 -600
        end, --  sortiezone -642, -4, -642, -637, 4, -637
    }
end

function limbus.hideArmouryCrates(region, zone)
    if zone == APOLLYON_SE_NE or zone == APOLLYON_NW_SW then
        local ID = zones[dsp.zone.APOLLYON]
        for i = 1, #ARMOURY_CRATE_APOLLYON, 2 do
            if ARMOURY_CRATE_APOLLYON[i+1][2] == region then
                GetNPCByID(ARMOURY_CRATE_APOLLYON[i]+ID.npc.COFFER_OFFSET):setStatus(dsp.status.DISAPPEAR)
            end
        end
    elseif zone == TEMENOS then
        local ID = zones[dsp.zone.TEMENOS]
        for i = 1, #ARMOURY_CRATE_TEMENOS, 2 do
            if ARMOURY_CRATE_TEMENOS[i+1][2] == region then
                GetNPCByID(ARMOURY_CRATE_TEMENOS[i]+ID.npc.COFFER_OFFSET):setStatus(dsp.status.DISAPPEAR)
            end
        end
    end
end

function limbus.hideTemenosDoors(region)
    local ID = zones[dsp.zone.TEMENOS]
    if region == Temenos_Northern_Tower then
        for i = 0, 6 do
            GetNPCByID(ID.npc.GATE_OFFSET+i):setStatus(dsp.status.DISAPPEAR)
        end
    elseif region == Temenos_Eastern_Tower then
        for i = 7, 13 do
            GetNPCByID(ID.npc.GATE_OFFSET+i):setStatus(dsp.status.DISAPPEAR)
        end
    elseif region == Temenos_Western_Tower then
        for i = 14, 20 do
            GetNPCByID(ID.npc.GATE_OFFSET+i):setStatus(dsp.status.DISAPPEAR)
        end
    elseif region == Central_Temenos_1st_Floor then
        GetNPCByID(ID.npc.GATE_OFFSET+21):setStatus(dsp.status.DISAPPEAR)
    elseif region == Central_Temenos_2nd_Floor then
        GetNPCByID(ID.npc.GATE_OFFSET+22):setStatus(dsp.status.DISAPPEAR)
    elseif region == Central_Temenos_3rd_Floor then
        GetNPCByID(ID.npc.GATE_OFFSET+23):setStatus(dsp.status.DISAPPEAR)
    elseif region == Central_Temenos_4th_Floor then
        GetNPCByID(ID.npc.GATE_OFFSET+24):setStatus(dsp.status.DISAPPEAR)
    elseif region == Central_Temenos_Basement then
        GetNPCByID(ID.npc.GATE_OFFSET+25):setStatus(dsp.status.DISAPPEAR)
    end
end

function limbus.isMobDead(mobID)
    local ActionValue = GetMobAction(mobID)
    --  Todo: replace this
    if ActionValue == 0 or ActionValue == 21 or ActionValue == 22 or ActionValue == 23 then
        return true
    else
        return false
    end
end

function limbus.spawnArmouryCrates(region)
    if region == SW_Apollyon then
        local ID = zones[dsp.zone.APOLLYON]
        GetNPCByID(ID.npc.COFFER_OFFSET+210):setPos(MIMICPOSITION[2][1], MIMICPOSITION[2][2], MIMICPOSITION[2][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+210):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setPos(MIMICPOSITION[4][1], MIMICPOSITION[4][2], MIMICPOSITION[4][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+211):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+212):setPos(MIMICPOSITION[6][1], MIMICPOSITION[6][2], MIMICPOSITION[6][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+212):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+213):setPos(MIMICPOSITION[8][1], MIMICPOSITION[8][2], MIMICPOSITION[8][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+213):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+214):setPos(MIMICPOSITION[10][1], MIMICPOSITION[10][2], MIMICPOSITION[10][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+214):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+215):setPos(MIMICPOSITION[12][1], MIMICPOSITION[12][2], MIMICPOSITION[12][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+215):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+216):setPos(MIMICPOSITION[14][1], MIMICPOSITION[14][2], MIMICPOSITION[14][3])
        GetNPCByID(ID.npc.COFFER_OFFSET+216):setStatus(dsp.status.NORMAL)
        SetServerVariable("[SW_Apollyon]MimicTrigger", 1)
    elseif region == Central_Temenos_4th_Floor then
        local ID = zones[dsp.zone.TEMENOS]
        GetNPCByID(ID.npc.COFFER_OFFSET+80):setPos(-560, -6, -459)
        GetNPCByID(ID.npc.COFFER_OFFSET+80):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+86):setPos(-540, -6, -459)
        GetNPCByID(ID.npc.COFFER_OFFSET+86):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+87):setPos(-576, -6, -459)
        GetNPCByID(ID.npc.COFFER_OFFSET+87):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+88):setPos(-528, -6, -459)
        GetNPCByID(ID.npc.COFFER_OFFSET+88):setStatus(dsp.status.NORMAL)

        GetNPCByID(ID.npc.COFFER_OFFSET+89):setPos(-592, -6, -487)
        GetNPCByID(ID.npc.COFFER_OFFSET+89):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+95):setPos(-566, -6, -486)
        GetNPCByID(ID.npc.COFFER_OFFSET+95):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+96):setPos(-566, -6, -513)
        GetNPCByID(ID.npc.COFFER_OFFSET+96):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+97):setPos(-592, -6, -513)
        GetNPCByID(ID.npc.COFFER_OFFSET+97):setStatus(dsp.status.NORMAL)

        GetNPCByID(ID.npc.COFFER_OFFSET+98):setPos(-531, -0.5, -501)
        GetNPCByID(ID.npc.COFFER_OFFSET+98):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+104):setPos(-527, -6, -512)
        GetNPCByID(ID.npc.COFFER_OFFSET+104):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+105):setPos(-552, -6, -512)
        GetNPCByID(ID.npc.COFFER_OFFSET+105):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+106):setPos(-552, -6, -488)
        GetNPCByID(ID.npc.COFFER_OFFSET+106):setStatus(dsp.status.NORMAL)
    
        GetNPCByID(ID.npc.COFFER_OFFSET+107):setPos(-488, 2, -510)
        GetNPCByID(ID.npc.COFFER_OFFSET+107):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+113):setPos(-486, 2, -491)
        GetNPCByID(ID.npc.COFFER_OFFSET+113):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+114):setPos(-508, 2, -513)
        GetNPCByID(ID.npc.COFFER_OFFSET+114):setStatus(dsp.status.NORMAL)
    
        GetNPCByID(ID.npc.COFFER_OFFSET+115):setPos(-488, 2, -408)
        GetNPCByID(ID.npc.COFFER_OFFSET+115):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+116):setPos(-485, 2, -423)
        GetNPCByID(ID.npc.COFFER_OFFSET+116):setStatus(dsp.status.NORMAL)
        GetNPCByID(ID.npc.COFFER_OFFSET+122):setPos(-506, 2, -406)
        GetNPCByID(ID.npc.COFFER_OFFSET+122):setStatus(dsp.status.NORMAL)
    end
end

function limbus.randomCoffer(floor, region)
    local cofferID = 0
    local cofferType = 0
    local spawnchance = math.random(0, 100)

    if spawnchance < 31 then
        if spawnchance < 15 then
            cofferType = cITEM
        elseif spawnchance < 25 then
            cofferType = cRESTORE
        elseif spawnchance < 30 then
            cofferType = cTIME
        end
    else
        --  print("nothing_spawn")
    end

    if region == Temenos_Western_Tower and cofferType == cITEM then
        switch (floor): caseof
        {
            [1] = function() cofferID = 1 end,
            [2] = function() cofferID = 2 end,
            [3] = function() cofferID = 3 end,
            [4] = function() cofferID = 10 end,
            [5] = function() cofferID = 11 end,
            [6] = function() cofferID = 12 end,
        }
    elseif region == Temenos_Western_Tower and cofferType == cRESTORE then
        switch (floor): caseof
        {
            [1] = function() cofferID = 203 end,
            [2] = function() cofferID = 204 end,
            [3] = function() cofferID = 205 end,
            [4] = function() cofferID = 206 end,
            [5] = function() cofferID = 207 end,
            [6] = function() cofferID = 208 end,
        }
    elseif region == Temenos_Western_Tower and cofferType == cTIME then
        switch (floor): caseof
        {
            [1] = function() cofferID = 128 end,
            [2] = function() cofferID = 129 end,
            [3] = function() cofferID = 139 end,
            [4] = function() cofferID = 140 end,
            [5] = function() cofferID = 141 end,
            [6] = function() cofferID = 151 end,
        }
    end
    --  print("cofferID" ..cofferID)
    return cofferID
end

function limbus.handleLootRolls(battlefield, lootTable, players, npc)
    players = players or battlefield:getPlayers()
        if npc then
            npc:setAnimation(90)
        end
        for i = 1, #lootTable do
            local lootGroup = lootTable[i]
            if lootGroup then
                local max = 0
                for _, entry in pairs(lootGroup) do
                    max = max + entry.droprate
                end
                local roll = math.random(max)
                for _, entry in pairs(lootGroup) do
                    max = max - entry.droprate
                    if roll > max then
                        if entry.itemid ~= 0 then
                            players[1]:addTreasure(entry.itemid, npc)
                        end
                        break
                    end
                end
            end
        end
end

function limbus.despawnCS()
    for n = 16933130, 16933136 do
        if not limbus.isMobDead(n) then
            DespawnMob(n)
        end
    end

    for n = 16933138, 16933143 do
        if not limbus.isMobDead(n) then
            DespawnMob(n)
        end
    end

    for n = 16933145, 16933152 do
        if not limbus.isMobDead(n) then
            DespawnMob(n)
        end
    end
end

function IselementalDayAreDead()
    local day = GetServerVariable("[SW_Apollyon]ElementalTrigger") - 1
    local daykill=false
    if (day == 0) then  --  fire
        if (limbus.isMobDead(16932913) == true and limbus.isMobDead(16932921) == true and limbus.isMobDead(16932929) == true) then
            daykill = true
        end
    elseif (day == 1) then --  earth
        if (limbus.isMobDead(16932912) == true and limbus.isMobDead(16932920) == true and limbus.isMobDead(16932928) == true) then
            daykill = true
        end
    elseif (day == 2) then --  water
        if (limbus.isMobDead(16932916) == true and limbus.isMobDead(16932924) == true and limbus.isMobDead(16932932) == true) then
            daykill = true
        end
    elseif (day == 3) then --  wind
        if (limbus.isMobDead(16932910) == true and limbus.isMobDead(16932918) == true and limbus.isMobDead(16932926) == true) then
            daykill = true
        end
    elseif (day == 4) then --  ice
        if (limbus.isMobDead(16932914) == true and limbus.isMobDead(16932922) == true and limbus.isMobDead(16932930) == true) then
            daykill = true
        end
    elseif (day == 5) then --  lightning
        if (limbus.isMobDead(16932917) == true and limbus.isMobDead(16932925) == true and limbus.isMobDead(16932933) == true) then
            daykill = true
        end
    elseif (day == 6) then --  ligth
        if (limbus.isMobDead(16932931) == true and limbus.isMobDead(16932915) == true and limbus.isMobDead(16932923) == true) then
            daykill = true
        end
    elseif (day == 7) then  --  dark
        if (limbus.isMobDead(16932911) == true and limbus.isMobDead(16932919) == true and limbus.isMobDead(16932927) == true) then
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

    if (pZone == dsp.zone.TEMENOS) then
        --  WHY? Why is there even HERE?
    elseif (pZone == dsp.zone.APOLLYON) then
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

    if (pZone == dsp.zone.TEMENOS) then
        --  The hell?
    elseif (pZone == dsp.zone.APOLLYON) then
        SetServerVariable("[CS_Apollyon]Already_Received", GetServerVariable("[CS_Apollyon]Already_Received") + number)
    end
end