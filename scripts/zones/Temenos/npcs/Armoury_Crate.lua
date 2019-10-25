-----------------------------------
-- Area: Temenos
-- NPC:  Armoury Crate
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/quests")
require("scripts/globals/limbus")
-----------------------------------
local ID = require("scripts/zones/Temenos/IDs")

local loot =
{
    -- northern tower floor 1
    [130] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1954, droprate = 159},
            {itemid = 1940, droprate = 146},
            {itemid = 1932, droprate = 85},
            {itemid = 1956, droprate = 171},
            {itemid = 1934, droprate = 110},
            {itemid = 2658, droprate = 220},
            {itemid = 2716, droprate = 98},
        },
    },
    -- northern tower floor 2
    [131] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1932, droprate = 333},
            {itemid = 1954, droprate = 200},
            {itemid = 1950, droprate = 100},
            {itemid = 1940, droprate = 90},
            {itemid = 1942, droprate = 70},
            {itemid = 1934, droprate = 90},
            {itemid = 1936, droprate = 100},
            {itemid = 1958, droprate = 90},
            {itemid = 2656, droprate = 67},
            {itemid = 1956, droprate = 167},
        },
    },
    -- northern tower floor 3
    [132] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1956, droprate = 27},
            {itemid = 1932, droprate = 324},
            {itemid = 1950, droprate = 80},
            {itemid = 1934, droprate = 189},
            {itemid = 1930, droprate = 50},
        },
        {
            {itemid = 1940, droprate = 27},
            {itemid = 1936, droprate = 81},
            {itemid = 1944, droprate = 80},
            {itemid = 1958, droprate = 81},
            {itemid = 2658, droprate = 270},
            {itemid = 2714, droprate = 108},
        },
    },
    -- northern tower floor 4
    [133] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1942, droprate = 90},
            {itemid = 1934, droprate = 435},
            {itemid = 1956, droprate = 80},
            {itemid = 1940, droprate = 174},
            {itemid = 1958, droprate = 87},
            {itemid = 1954, droprate = 90},
            {itemid = 1936, droprate = 87},
            {itemid = 1930, droprate = 43},
            {itemid = 2656, droprate = 27},
            {itemid = 2658, droprate = 261},
        },
    },
    -- northern tower floor 5
    [134] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1954, droprate = 67},
            {itemid = 1940, droprate = 353},
            {itemid = 1936, droprate = 87},
            {itemid = 1956, droprate = 110},
            {itemid = 1958, droprate = 87},
            {itemid = 1942, droprate = 50},
            {itemid = 1950, droprate = 60},
            {itemid = 1932, droprate = 59},
            {itemid = 2716, droprate = 100},
            {itemid = 2714, droprate = 110},
        },
    },
    -- northern tower floor 6
    [135] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1954, droprate = 263},
            {itemid = 1932, droprate = 59},
            {itemid = 1942, droprate = 53},
            {itemid = 1934, droprate = 60},
            {itemid = 1956, droprate = 526},
        },
        {
            {itemid = 1930, droprate = 60},
            {itemid = 1936, droprate = 53},
            {itemid = 1950, droprate = 158},
            {itemid = 2716, droprate = 105},
        },
    },
    -- northern tower floor 7
    [136] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1956, droprate = 240},
            {itemid = 1932, droprate = 120},
            {itemid = 1940, droprate = 200},
        },
        {
            {itemid = 1934, droprate = 40},
            {itemid = 1954, droprate = 120},
            {itemid = 2658, droprate = 200},
            {itemid = 2716, droprate = 80},
        },
        {
            {itemid = 1875, droprate = 100},
            {itemid = 2127, droprate = 55},
        },
        {
            {itemid = 1904, droprate = 1000},
        },
    },
    -- western tower floor 1
    [137] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1948, droprate = 172},
            {itemid = 1938, droprate = 138},
            {itemid = 1952, droprate = 138},
            {itemid = 1958, droprate = 207},
            {itemid = 1930, droprate = 241},
            {itemid = 2656, droprate = 172},
        },
    },
    -- western tower floor 2
    [138] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1948, droprate = 179},
            {itemid = 1938, droprate = 571},
            {itemid = 1944, droprate = 71},
            {itemid = 1952, droprate = 179},
        },
        {
            {itemid = 1946, droprate = 120},
            {itemid = 1934, droprate = 71},
            {itemid = 1930, droprate = 143},
            {itemid = 2660, droprate = 143},
        },
    },
    -- western tower floor 3
    [139] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1948, droprate = 536},
            {itemid = 1952, droprate = 107},
            {itemid = 1938, droprate = 60},
            {itemid = 1934, droprate = 110},
            {itemid = 1930, droprate = 80},
            {itemid = 2660, droprate = 90},
        },
        {
            {itemid = 1946, droprate = 71},
            {itemid = 1944, droprate = 103},
            {itemid = 1958, droprate = 160},
            {itemid = 1954, droprate = 36},
            {itemid = 2656, droprate = 250},
            {itemid = 2716, droprate = 350},
        },
    },
    -- western tower floor 4
    [140] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1952, droprate = 533},
            {itemid = 1946, droprate = 90},
            {itemid = 1938, droprate = 133},
            {itemid = 1932, droprate = 90},
        },
        {
            {itemid = 1958, droprate = 10},
            {itemid = 1954, droprate = 133},
            {itemid = 1944, droprate = 133},
            {itemid = 1930, droprate = 133},
            {itemid = 2660, droprate = 33},
        },
    },
    -- western tower floor 5
    [141] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1954, droprate = 59},
            {itemid = 1930, droprate = 294},
            {itemid = 1946, droprate = 59},
            {itemid = 1934, droprate = 78},
            {itemid = 2716, droprate = 59},
        },
        {
            {itemid = 1958, droprate = 176},
            {itemid = 1938, droprate = 59},
            {itemid = 1948, droprate = 25},
            {itemid = 1932, droprate = 118},
            {itemid = 2656, droprate = 294},
        },
    },
    -- western tower floor 6
    [142] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1954, droprate = 200},
            {itemid = 1958, droprate = 400},
            {itemid = 1948, droprate = 100},
            {itemid = 1934, droprate = 150},
        },
        {
            {itemid = 1932, droprate = 50},
            {itemid = 1930, droprate = 60},
            {itemid = 1938, droprate = 200},
            {itemid = 1944, droprate = 60},
            {itemid = 1952, droprate = 200},
        },
    },
    -- western tower floor 7
    [143] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1948, droprate = 36},
            {itemid = 1952, droprate = 143},
            {itemid = 1930, droprate = 143},
            {itemid = 1958, droprate = 214},
            {itemid = 1938, droprate = 71},
            {itemid = 2656, droprate = 321},
        },
        {
            {itemid = 1875, droprate = 100},
            {itemid = 2127, droprate = 55},
        },
        {
            {itemid = 1906, droprate = 1000},
        },
    },
    -- eastern tower floor 1
    [144] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1944, droprate = 65},
            {itemid = 1936, droprate = 97},
            {itemid = 1946, droprate = 40},
            {itemid = 1942, droprate = 95},
            {itemid = 2660, droprate = 194},
            {itemid = 2714, droprate = 32},
            {itemid = 1950, droprate = 161},
            {itemid = 2716, droprate = 190},
            {itemid = 2656, droprate = 210},
        },
    },
    -- eastern tower floor 2
    [145] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1936, droprate = 367},
            {itemid = 1952, droprate = 70},
            {itemid = 1950, droprate = 40},
            {itemid = 1942, droprate = 333},
            {itemid = 1958, droprate = 20},
        },
        {
            {itemid = 1956, droprate = 106},
            {itemid = 1938, droprate = 33},
            {itemid = 1944, droprate = 76},
            {itemid = 1948, droprate = 95},
            {itemid = 2658, droprate = 67},
            {itemid = 1946, droprate = 133},
        },
    },
    -- eastern tower floor 3
    [146] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1942, droprate = 625},
            {itemid = 1944, droprate = 102},
            {itemid = 1950, droprate = 42},
            {itemid = 1952, droprate = 83},
            {itemid = 1946, droprate = 50},
        },
        {
            {itemid = 1940, droprate = 83},
            {itemid = 1936, droprate = 70},
            {itemid = 1938, droprate = 42},
            {itemid = 1948, droprate = 42},
            {itemid = 2660, droprate = 292},
        },
    },
    -- eastern tower floor 4
    [147] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1950, droprate = 417},
            {itemid = 1956, droprate = 75},
            {itemid = 1944, droprate = 208},
            {itemid = 1940, droprate = 167},
        },
        {
            {itemid = 1946, droprate = 62},
            {itemid = 1936, droprate = 69},
            {itemid = 2660, droprate = 208},
            {itemid = 1952, droprate = 42},
            {itemid = 2658, droprate = 83},
        },
    },
    -- eastern tower floor 5
    [148] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1944, droprate = 208},
            {itemid = 1938, droprate = 42},
            {itemid = 1946, droprate = 36},
            {itemid = 1940, droprate = 83},
            {itemid = 1942, droprate = 20},
        },
        {
            {itemid = 1952, droprate = 94},
            {itemid = 1956, droprate = 42},
            {itemid = 1936, droprate = 49},
            {itemid = 1950, droprate = 167},
            {itemid = 2714, droprate = 458},
        },
    },
    -- eastern tower floor 6
    [149] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1942, droprate = 68},
            {itemid = 1948, droprate = 74},
            {itemid = 1936, droprate = 259},
            {itemid = 1940, droprate = 74},
            {itemid = 1956, droprate = 74},
            {itemid = 1950, droprate = 62},
        },
        {
            {itemid = 2656, droprate = 150},
            {itemid = 1938, droprate = 76},
            {itemid = 1952, droprate = 53},
            {itemid = 2658, droprate = 111},
            {itemid = 2714, droprate = 370},
            {itemid = 1946, droprate = 333},
        },
    },
    -- eastern tower floor 7
    [150] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1942, droprate = 38},
            {itemid = 1950, droprate = 67},
            {itemid = 1944, droprate = 100},
            {itemid = 1936, droprate = 233},
            {itemid = 1946, droprate = 80},
            {itemid = 2660, droprate = 333},
            {itemid = 2714, droprate = 67},
        },
        {
            {itemid = 1875, droprate = 100},
            {itemid = 2127, droprate = 55},
        },
        {
            {itemid = 1905, droprate = 1000},
        },
    },
    -- central temenos floor 1
    [151] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1930, droprate = 265},
            {itemid = 1938, droprate = 118},
            {itemid = 1948, droprate = 147},
            {itemid = 1958, droprate = 147},
            {itemid = 1952, droprate = 118},
            {itemid = 2656, droprate = 235},
        },
        {
            {itemid = 1986, droprate = 1000},
        },
    },
    -- central temenos floor 2
    [152] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1944, droprate = 250},
            {itemid = 1936, droprate = 94},
            {itemid = 1950, droprate = 63},
            {itemid = 1942, droprate = 125},
            {itemid = 1946, droprate = 63},
            {itemid = 2660, droprate = 281},
            {itemid = 2714, droprate = 125},
        },
        {
            {itemid = 1908, droprate = 1000},
        },
    },
    -- central temenos floor 3
    [153] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1934, droprate = 53},
            {itemid = 1940, droprate = 132},
            {itemid = 1954, droprate = 105},
            {itemid = 1932, droprate = 211},
            {itemid = 1956, droprate = 211},
            {itemid = 1930, droprate = 100},
            {itemid = 2658, droprate = 211},
            {itemid = 2716, droprate = 105},
        },
        {
            {itemid = 1907, droprate = 1000},
        },
    },
    -- central temenos floor 4
    [154] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1920, droprate = 659},
            {itemid = 1924, droprate = 394},
            {itemid = 1923, droprate = 388},
            {itemid = 1922, droprate = 404},
        },
        {
            {itemid = 1924, droprate = 394},
            {itemid = 1922, droprate = 402},
            {itemid = 1920, droprate = 659},
            {itemid = 1923, droprate = 383},
        },
        {
            {itemid = 1921, droprate = 265},
            {itemid = 1875, droprate = 100},
        },
    },
    -- central temenos floor 5 ?
    [155] =
    {
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1875, droprate = 1000},
        },
        {
            {itemid = 1934, droprate = 200},
            {itemid = 1930, droprate = 200},
            {itemid = 1958, droprate = 200},
            {itemid = 2658, droprate = 400},
            {itemid = 1940, droprate = 200},
        },
    },
}

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local battlefield = player:getBattlefield()
    if not battlefield then
        return
    end
    local cofferID = npc:getID()
    local X = npc:getXPos()
    local Y = npc:getYPos()
    local Z = npc:getZPos()
    local cofferType = 0
    local instanceRegion = 0
    local addtime = 0
    local despawnOtherCoffer = false
    local mimicID = 0
    local lootID = 0

    for coffer = 1, #ARMOURY_CRATE_TEMENOS, 2 do
        if ARMOURY_CRATE_TEMENOS[coffer] == cofferID-ID.npc.COFFER_OFFSET then
            cofferType = ARMOURY_CRATE_TEMENOS[coffer+1][1]
            instanceRegion = ARMOURY_CRATE_TEMENOS[coffer+1][2]
            addtime = ARMOURY_CRATE_TEMENOS[coffer+1][3]
            despawnOtherCoffer = ARMOURY_CRATE_TEMENOS[coffer+1][4]
            mimicID = ARMOURY_CRATE_TEMENOS[coffer+1][5]
            lootID = ARMOURY_CRATE_TEMENOS[coffer+1][6]
        end
    end
    local coffer = cofferID-ID.npc.COFFER_OFFSET

    if cofferType == cTIME then
        dsp.battlefield.ExtendTimeLimit(battlefield, addtime, ID.text.TIME_EXTENDED)
    elseif cofferType == cITEM then
        if instanceRegion == Central_Temenos_4th_Floor and coffer ~= 79 then
            local randmimic = math.random(1, 24)
            if randmimic < 17 then
                local MimicList =
                {
                    ID.mob.TEMENOS_C_MOB[4]+20, ID.mob.TEMENOS_C_MOB[4]+21,
                    ID.mob.TEMENOS_C_MOB[4]+22, ID.mob.TEMENOS_C_MOB[4]+25,
                    ID.mob.TEMENOS_C_MOB[4]+26, ID.mob.TEMENOS_C_MOB[4]+27,
                    ID.mob.TEMENOS_C_MOB[4]+28, ID.mob.TEMENOS_C_MOB[4]+29,
                    ID.mob.TEMENOS_C_MOB[4]+30, ID.mob.TEMENOS_C_MOB[4]+31,
                    ID.mob.TEMENOS_C_MOB[4]+32, ID.mob.TEMENOS_C_MOB[4]+33,
                    ID.mob.TEMENOS_C_MOB[4]+34, ID.mob.TEMENOS_C_MOB[4]+35,
                    ID.mob.TEMENOS_C_MOB[4]+36, ID.mob.TEMENOS_C_MOB[4]+37,
                }
                GetMobByID(MimicList[randmimic]):setSpawn(X, Y, Z)
                SpawnMob(MimicList[randmimic]):setPos(X, Y, Z)
                GetMobByID(MimicList[randmimic]):updateClaim(player)
            else
                battlefield:setLocalVar("loot", 1)
                battlefield:spawnLoot(npc)
                limbus.handleLootRolls(battlefield, loot[lootID], nil, npc)
            end
            -- despawn les coffer du meme groupe
            for coffer = 1, #ARMOURY_CRATE_TEMENOS, 2 do
                if ARMOURY_CRATE_TEMENOS[coffer+1][5] == mimicID then
                    GetNPCByID(ARMOURY_CRATE_TEMENOS[coffer]+ID.npc.COFFER_OFFSET):setStatus(dsp.status.DISAPPEAR)
                end
            end
        else
            battlefield:setLocalVar("loot", 1)
            battlefield:spawnLoot(npc)
            limbus.handleLootRolls(battlefield, loot[lootID], nil, npc)
        end
        if lootID == 136 or lootID == 143 or lootID == 150 or lootID == 151 or
            lootID == 152 or lootID == 153 or lootID == 154
        then
            battlefield:setLocalVar("cutsceneTimer", 10)
            battlefield:setLocalVar("lootSeen", 1)
        end
    elseif cofferType == cRESTORE then
        dsp.battlefield.HealPlayers(battlefield)
    elseif cofferType == cMIMIC then
        if coffer == 284 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[1]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[1]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[1]+4):updateClaim(player)
        elseif coffer == 321 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[2]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[2]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[2]+4):updateClaim(player)
        elseif coffer == 348 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[3]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[3]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[3]+4):updateClaim(player)
        elseif coffer == 360 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[4]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[4]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[4]+4):updateClaim(player)
        elseif coffer == 393 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[5]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[5]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[5]+4):updateClaim(player)
        elseif coffer == 277 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[6]+4):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[6]+4):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[6]+4):updateClaim(player)
        elseif coffer == 123 then
            GetMobByID(ID.mob.TEMENOS_E_MOB[7]+2):setSpawn(X, Y, Z)
            SpawnMob(ID.mob.TEMENOS_E_MOB[7]+2):setPos(X, Y, Z)
            GetMobByID(ID.mob.TEMENOS_E_MOB[7]+2):updateClaim(player)
        end
    end
    if despawnOtherCoffer then
        limbus.hideArmouryCrates(instanceRegion, TEMENOS)
        if instanceRegion == Temenos_Eastern_Tower then --despawn mob of the current floor
            if coffer == 173 or coffer == 215 or coffer == 284 or coffer == 40 then
                --floor 1
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[1]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[1]+i)
                    end
                end
                if coffer ~= 284 then
                    GetNPCByID(ID.npc.GATE_OFFSET+7):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 174 or coffer == 216 or coffer == 321 or coffer == 45 then
                --floor 2
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[2]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[2]+i)
                    end
                end
                if coffer ~= 321 then
                    GetNPCByID(ID.npc.GATE_OFFSET+8):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 181 or coffer == 217 or coffer == 348 or coffer == 46 then
                --floor 3
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[3]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[3]+i)
                    end
                end
                if coffer ~= 348 then
                    GetNPCByID(ID.npc.GATE_OFFSET+9):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 182 or coffer == 236 or coffer == 360 or coffer == 47 then
                --floor 4
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[4]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[4]+i)
                    end
                end
                if coffer ~= 360 then
                    GetNPCByID(ID.npc.GATE_OFFSET+10):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 183 or coffer == 261 or coffer == 393 or coffer == 68 then
                --floor 5
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[5]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[5]+i)
                    end
                end
                if coffer ~= 393 then
                    GetNPCByID(ID.npc.GATE_OFFSET+11):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 202 or coffer == 190 or coffer ==  277 or coffer == 69 then
                --floor 6
                for i = 0, 3 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[6]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[6]+i)
                    end
                end
                if coffer ~= 277 then
                    GetNPCByID(ID.npc.GATE_OFFSET+12):setStatus(dsp.status.NORMAL)
                end
            elseif coffer == 70 or coffer == 123 then
                --floor 7
                for i = 0, 1 do
                    if GetMobByID(ID.mob.TEMENOS_E_MOB[7]+i):isSpawned() then
                        DespawnMob(ID.mob.TEMENOS_E_MOB[7]+i)
                    end
                end
                if coffer ~= 123 then
                    GetNPCByID(ID.npc.GATE_OFFSET+13):setStatus(dsp.status.NORMAL)
                end
            end
        end
    end
    npc:setStatus(dsp.status.DISAPPEAR)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end