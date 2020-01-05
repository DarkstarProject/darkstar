-----------------------------------
-- Area: Lower Jeuno
--  NPC: Treasure Coffer
-- Type: Add-on NPC
-- !pos 41.169 3.899 -51.005 245
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
-----------------------------------

local optionToKI =
{
    [ 1] = dsp.ki.CRIMSON_KEY,
    [ 2] = dsp.ki.VIRIDIAN_KEY,
    [ 3] = dsp.ki.AMBER_KEY,
    [ 4] = dsp.ki.AZURE_KEY,
    [ 5] = dsp.ki.IVORY_KEY,
    [ 6] = dsp.ki.EBON_KEY,
    [ 8] = dsp.ki.WHITE_CORAL_KEY,
    [ 9] = dsp.ki.BLUE_CORAL_KEY,
    [10] = dsp.ki.PEACH_CORAL_KEY,
    [11] = dsp.ki.BLACK_CORAL_KEY,
    [12] = dsp.ki.RED_CORAL_KEY,
    [13] = dsp.ki.ANGEL_SKIN_KEY,
    [15] = dsp.ki.MOOGLE_KEY,
    [16] = dsp.ki.BIRD_KEY,
    [17] = dsp.ki.CACTUAR_KEY,
    [18] = dsp.ki.BOMB_KEY,
    [19] = dsp.ki.CHOCOBO_KEY,
    [20] = dsp.ki.TONBERRY_KEY,
}

local prizes =
{
    [dsp.ki.CRIMSON_KEY] =
    {
        {cutoff =   70, itemId = 13206, augments = {{9, 0,  5}, {516, 0, 1}, {517, 0, 1}, {518, 0, 1}, { 32, 0, 1}, { 96, 0, 1}}}, -- Gold Obi
        {cutoff =   80, itemId = 13445, augments = {{9, 0,  8}, {516, 0, 1}, {517, 0, 1}, {518, 0, 2}, { 39, 0, 1}, { 35, 0, 2}}}, -- Gold Ring
        {cutoff =  186, itemId = 13446, augments = {{1, 0, 15}, { 13, 0, 2}, { 25, 0, 5}, { 31, 0, 2}, {195, 0, 1}, { 35, 0, 2}}}, -- Mythril Ring
        {cutoff =  276, itemId = 13643, augments = {{9, 0,  5}, {516, 0, 1}, {517, 0, 1}, {518, 0, 1}, {100, 0, 1}, { 39, 0, 1}}}, -- Sarcenet Cape
        {cutoff =  351, itemId = 13196, augments = {{1, 0,  5}, { 23, 0, 1}, { 27, 0, 1}, {512, 0, 1}, {520, 0, 1}, {515, 0, 1}}}, -- Silver Belt
        {cutoff =  460, itemId = 13571, augments = {{1, 0,  5}, { 25, 0, 3}, { 29, 0, 3}, {512, 0, 0}, {769, 0, 1}, { 32, 0, 1}}}, -- Wolf Mantle
    },
    [dsp.ki.VIRIDIAN_KEY] =
    {
        {cutoff =   65, itemId = 13639, augments = {{9, 0, 19}, {1, 0, 19}, {40, 0, 1}, {771, 0, 6}, {768, 0, 6}, {34, 2, 4}}}, -- Aurora Mantle mp/hp/-enm/eres/fres/-def
        {cutoff =  142, itemId = 13271, augments = {{23, 0, 2}, {31, 0, 1}, {9, 0, 13}, {26, 0, 1}, {1, 0, 12}, {49, 0, 2}}}, -- Corsette acc/eva/mp/-att/hp/haste
        {cutoff =  237, itemId = 12364, augments = {{9, 0, 9}, {517, 0, 1}, {516, 0, 1}, {512, 0, 1}, {518, 0, 1}, {35, 0, 1}}}, -- Nymph Shield mp/mnd/int/str/chr/macc
        {cutoff =  356, itemId = 13570, augments = {{5, 0, 5}, {13, 0, 10}, {515, 0, 1}, {513, 0, 1}, {23, 0, 3}, {27, 0, 3}}}, -- Ram Mantle -hp/-mp/agi/dex/acc/racc
        {cutoff =  457, itemId = 13198, augments = {{1, 0, 4}, {512, 0, 1}, {513, 0, 1}, {514, 0, 1}, {24, 0, 2}, {27, 0, 3}}}, -- Swordbelt hp/str/dex/vit/-acc/racc
        {cutoff =  463, itemId = 13207, augments = {{1, 0, 3}, {9, 0, 11}, {35, 0, 2}, {290, 0, 2}, {50, 0, 1}, {100, 0, 2}}}, -- Brocade Obi hp/mp/macc/enhance/slow/pmacc
    },
    [dsp.ki.AMBER_KEY] =
    {
        {cutoff = 111, itemId = 16263, augments = {{9, 0, 12}, {35, 0, 1}, {516, 0, }, {518, 0, 2}, {517, 0, 2}, {97, 0, 4}, {39 , 0, 1}}}, -- Beak Necklace mp/macc/int/chr/mnd/petattratt/enm
        {cutoff = 219, itemId = 13207, augments = {{1, 0, 3}, {9, 0, 11}, {35, 0, 2}, {290, 0, 2}, {50, 0, 1}, {100, 0, 2}}}, -- Brocade Obi hp/mp/macc/enhance/slow/pmacc
        {cutoff = 334, itemId = 13091, augments = {{513, 0, 1}, {512, 0, 2}, {25, 0, 6}, {29, 0, 6}, {142, 0, 1}, {24, 0, 3}, {773, 0, 5}}}, -- Carapace Gorget dex/str/att/ratt/stp/-acc/rwin
        {cutoff = 436, itemId = 13445, augments = {{9, 0, 13}, {517, 0, 1}, {35, 0, 2}, {39, 0, 1}, {516, 0, 1}, {518, 0, 1}}}, -- Gold Ring mp/mnd/macc/enm/int/chr
        {cutoff = 561, itemId = 13593, augments = {{1, 0, 29}, {520, 0, 1}, {513, 0, 1}, {515, 0, 2}, {514, 0, 2}, {39, 0, 1}, {774, 0, 5}}}, -- Raptor Mantle hp/dex/-dex/agi/vit/enm/rlig
    },
    [dsp.ki.AZURE_KEY] =
    {
        {cutoff = 106, itemId = 13597, augments = {{512, 0, 1}, {513, 0, 1}, {26, 0, 5}, {23, 0, 6}, {31, 0, 6}, {195, 0, 1}}}, -- Beak Mantle str/dex/-att/acc/eva/sb
        {cutoff = 203, itemId = 13092, augments = {{515, 0, 3}, {23, 0, 7}, {27, 0, 7}, {30, 0, 3}, {195, 0, 1}, {771, 0, 3}}}, -- Coeurl Gorget agi/acc/racc/ratt/sb/rear
        {cutoff = 305, itemId = 13447, augments = {{1, 0, 9}, {512, 0, 1}, {513, 0, 1}, {514, 0, 1}, {26, 0, 2}, {23, 0, 2}}}, -- Platinum Ring hp/str/dex/vit/-att/acc
        {cutoff = 386, itemId = 13208, augments = {{9, 0, 19}, {516, 0, 4}, {515, 0, 4}, {516, 0, 4}, {36, 0, 2}, {52, 0, 2}}}, -- Rainbow Obi mp/int/mnd/chr/-macc/mprwh
        {cutoff = 490, itemId = 13125, augments = {{5, 0, 13}, {9, 0, 12}, {515, 0, 2}, {516, 0, 1}, {517, 0, 1}, {518, 0, 1}}}, -- Torque -hp/mp/agi/int/mnd/chr
    },
    [dsp.ki.IVORY_KEY] =
    {
        {cutoff =   62, itemId = 13357, augments = {{518, 0, 1}, {40, 0, 1}, {1, 0, 9}, {9, 0, 9}, {105, 0, 1}, {96, 0, 1}, {34, 0, 3}}}, -- Angels Earring chr/-enm/hp/mp/-penm/paccracc/-def
        {cutoff =   70, itemId = 13356, augments = {{33, 0, 3}, {39, 0, 1}, {1, 0, 9}, {9, 0, 9}, {104, 0, 1}, {521, 0, 1}}}, -- Death Earring def/enm/hp/mp/-penm/-vit
        {cutoff =  113, itemId = 13353, augments = {{516, 0, 1}, {515, 0, 1}, {133, 0, 1}, {9, 0, 5}, {36, 0, 1}, {101, 0, 1}}}, -- Diamond Earring int/agi/mab/mp/-macc/pmab
        {cutoff =  196, itemId = 13351, augments = {{515, 0, 1}, {31, 0, 4}, {98, 0, 4}, {27, 0, 2}, {514, 0, 1}, {30, 0, 1}}}, -- Emerald Earring agi/eva/peva/racc/vit/-att
        {cutoff =  301, itemId = 13352, augments = {{25, 0, 4}, {516, 0, 1}, {107, 0, 4}, {29, 0, 4}, {512, 0, 1}, {24, 0, 2}}}, -- Ruby Earring att/int/pattratt/ratt/str/-acc
        {cutoff =  392, itemId = 13355, augments = {{35, 0, 1}, {517, 0, 1}, {9, 0, 5}, {100, 0, 1}, {512, 0, 1}, {5, 0, 6}}}, -- Sapphire Earring acc/mnd/mp/pmacc/str/-hp
        {cutoff =  478, itemId = 13354, augments = {{23, 0, 2}, {513, 0, 1}, {517, 0, 1}, {106, 0, 2}, {142, 0, 1}, {195, 0, 1}, {26, 0, 4}}}, -- Spinel Earring acc/dex/mnd/paccracc/stp/sb/-att
        {cutoff =  497, itemId = 13318, augments = {{33, 0, 4}, {513, 0, 1}, {1, 0, 19}, {99, 0, 4}, {514, 0, 1}, {32, 0, 2}}}, -- Topaz Earring def/dex/hp/pdef/vit/-eva
    },
    [dsp.ki.EBON_KEY] =
    {
        {cutoff =  31, itemId = 13463, augments = {{783, 0, 29}, {34, 0, 14}, {17, 0, 9}, {518, 0, 1}, {512, 0, 1}, {513, 0, 1}}}, -- Angels Ring -rdar/-def/hp/chr/str/dex
        {cutoff =  82, itemId = 13462, augments = {{782, 0, 29}, {525, 0, 5}, {9, 0, 19}, {33, 0, 4}, {516, 0, 1}, {517, 0, 1}}}, -- Death Ring -rlig/-chr/mp/def/int/mnd
        {cutoff = 174, itemId = 13450, augments = {{776, 0, 29}, {519, 0, 5}, {9, 0, 19}, {516, 0, 1}, {517, 0, 1}, {518, 0, 1}}}, -- Diamond Ring -rfir/-str/mp/int/mnd/chr
        {cutoff = 225, itemId = 13448, augments = {{777, 0, 29}, {523, 0, 5}, {1, 0, 19}, {515, 0, 1}, {514, 0, 1}, {518, 0, 1}}}, -- Emerald Ring -rice/-int/hp/agi/vit/chr
        {cutoff = 296, itemId = 13449, augments = {{781, 0, 29}, {524, 0, 5}, {1, 0, 19}, {512, 0, 1}, {513, 0, 1}, {518, 0, 1}}}, -- Ruby Ring -rwat/-mnd/hp/str/dex/chr
        {cutoff = 357, itemId = 13452, augments = {{780, 0, 29}, {520, 0, 5}, {9, 0, 19}, {517, 0, 1}, {516, 0, 1}, {518, 0, 1}}}, -- Sapphire Ring -rthu/-dex/mp/mnd/int/chr
        {cutoff = 459, itemId = 13451, augments = {{779, 0, 29}, {521, 0, 5}, {1, 0, 19}, {513, 0, 1}, {512, 0, 1}, {518, 0, 1}}}, -- Spinel Ring -rear/-vit/hp/dex/str/chr
        {cutoff = 500, itemId = 13453, augments = {{778, 0, 29}, {522, 0, 5}, {1, 0, 19}, {514, 0, 1}, {515, 0, 1}, {518, 0, 1}}}, -- Topaz Ring -rwin/-agi/hp/vit/agi/chr
    },
    [dsp.ki.WHITE_CORAL_KEY] =
    {
        {cutoff =   31, itemId = 12433, augments = {{1, 0, 1}, {9, 0, 2}, {514, 0, 1}, {24, 0, 2}, {142, 0, 0}, {177, 0, 1}}}, -- Brass Mask hp/mp/vit/-acc/stp/rpois
        {cutoff =  109, itemId = 12986, augments = {{13, 0, 5}, {517, 0, 1}, {100, 0, 1}, {40, 0, 1}, {773, 0, 2}, {53, 1, 3}}}, -- Chestnut Sabots -mp/mnd/pmacc/-enm/rwat/sird
        {cutoff =  218, itemId = 12721, augments = {{23, 0, 1}, {768, 0, 1}, {769, 0, 1}, {513, 0, 1}, {515, 0, 1}}}, -- Cotton Gloves acc/rfir/rice/dex/agi
        {cutoff =  296, itemId = 12826, augments = {{29, 0, 1}, {25, 0, 2}, {195, 0, 1}, {99, 0, 1}, {179, 0, 3}}}, -- Studded Trousers ratt/att/sb/pdef/rblind
        {cutoff =  437, itemId = 12602, augments = {{771, 0, 4}, {515, 0, 1}, {29, 0, 1}, {27, 0, 3}, {40, 0, 1}, {519, 0, 1}}}, -- Wool Robe rear/agi/ratt/racc/-enm/-str
    },
    [dsp.ki.BLUE_CORAL_KEY] =
    {
        {cutoff =   42, itemId = 12571, augments = {{1, 0, 3}, {291, 0, 1}, {52, 0, 1}, {184, 0, 2}, {322, 0, 1}, {39, 0, 1}}}, -- Cuir Bouilli hp/enfski/mprwh/rstu/-ssct/enm
        {cutoff =  250, itemId = 14118, augments = {{1, 0, 1}, {512, 0, 1}, {518, 0, 1}, {133, 0, 1}, {774, 0, 1}}}, -- Iron Greaves hp/str/chr/mab/rlig
        {cutoff =  292, itemId = 12866, augments = {{9, 0, 6}, {524, 0, 1}, {141, 0, 1}, {53, 0, 3}, {35, 0, 1}}}, -- Linen Slacks mp/-mnd/consmp/sird/macc
        {cutoff =  375, itemId = 12450, augments = {{1, 0, 6},{513, 0, 1}, {515, 0, 1}, {25, 0, 1}, {772, 0, 5}}}, -- Padded Cap dex/agi/att/rthu
        {cutoff =  458, itemId = 12731, augments = {{5, 0, 4}, {96, 0, 1}, {176, 0, 1}, {31, 0, 2}, {9, 0, 6}}}, -- Velvet Cuffs -hp/paccracc/rsle/eva
    },
    [dsp.ki.PEACH_CORAL_KEY] =
    {
        {cutoff =   66, itemId = 13712, augments = {{23, 0, 5}, {25, 0, 5}, {31, 0, 5}, {195, 0, 3}, {178, 0, 2}, {50, 0, 1}}}, -- Carapace Harness acc/att/eva/sb/rpar/slow
        {cutoff =  198, itemId = 12956, augments = {{1, 0, 5}, {9, 1, 11}, {514, 0, 2}, {99, 0, 3}, {35, 0, 1}}}, -- Raptor Ledelsens hp/mp/vit/pdef/macc
        {cutoff =  303, itemId = 12476, augments = {{13, 0, 1}, {289, 0, 2}, {291, 0, 2}, {100, 0, 1}, {293, 0, 2}}}, -- Silk Hat -mp/heaski/enfski/pmaac/darski
        {cutoff =  395, itemId = 14003, augments = {{23, 0, 2}, {25, 0, 2}, {49, 0, 1}, {187, 0, 2}, {770, 0, 2}}}, -- Steel Finger Gauntlets acc/att/haste/rslo/rwin
        {cutoff =  487, itemId = 12867, augments = {{516, 0, 3}, {517, 0, 3}, {518, 0, 3}, {320, 0, 2}, {53, 0, 3}, {39, 0, 2}}}, -- White Slacks int/mnd/chr/bpad/sird/enm
    },
    [dsp.ki.BLACK_CORAL_KEY] =
    {
        {cutoff =   90, itemId = 13698, augments = {{9, 0, 5}, {25, 0, 5}, {23, 0, 5}, {31, 0, 5}, {27, 0, 5}, {5, 0, 14}}}, -- Beak Helm mp/att/acc/eva/racc/-hp
        {cutoff =  194, itemId = 12988, augments = {{1, 0, 11}, {29, 0, 2}, {27, 0, 2}, {51, 0, 1}, {513, 0, 1}, {522, 0, 1}}}, -- Pigaches hp/ratt/racc/hprwh/dex/-agi
        {cutoff =  224, itemId = 12811, augments = {{512, 0, 3}, {514, 0, 3}, {518, 0, 3}, {97, 0, 2}, {9, 0, 12}, {26, 0, 4}}}, -- Darksteel Breeches str/vit/chr/pttratt/mp/-att
        {cutoff =  433, itemId = 12707, augments = {{516, 0, 3}, {518, 0, 3}, {517, 0, 3}, {52, 0, 3}, {13, 0, 12}, {775, 0, 4}}}, -- Scorpion Mitts int/chr/mnd/mprwh/-mp/rdar
        {cutoff =  552, itemId = 12604, augments = {{770, 0, 5}, {515, 0, 2}, {31, 0, 2}, {180, 0, 3}, {181, 0, 3}}}, -- Silk Coat rwin/agi/eva/rsil
    },
    [dsp.ki.RED_CORAL_KEY] =
    {
        {cutoff =  109, itemId = 16289, augments = {{51, 0, 1}, {35, 0, 2}, {298, 0, 4}, {291, 0, 4}, {292, 0, 4}}}, -- Alloy Torque hprwh/macc/winski/enfski/eleski
        {cutoff =  200, itemId = 16288, augments = {{768, 0, 3}, {512, 0, 4}, {513, 0, 4}, {142, 0, 2}, {102, 0, 2}, {24, 0, 5}}}, -- Aureate Necklace rfir/str/dex/stp/pcrith/-acc
        {cutoff =  273, itemId = 16290, augments = {{516, 0, 2}, {518, 0, 2}, {517, 0, 2}, {40, 0, 1}, {53, 0, 3}, {36, 0, 2}}}, -- Burly Gorget int/chr/mnd/-enm/sird/-macc
        {cutoff =  382, itemId = 16286, augments = {{5, 0, 11}, {513, 0, 1}, {23, 0, 7}, {25, 0, 3}, {96, 0, 3}, {772, 0, 2}}}, -- Nitid Choker -hp/dex/acc/att/paccracc/rthun
        {cutoff =  473, itemId = 16287, augments = {{34, 0, 4}, {512, 0, 1}, {27, 0, 1}, {29, 0, 6}, {186, 0, 1}, {98, 0, 2}}}, -- Pneuma Collar -def/str/racc/ratt/rgrav/peva
    },
    [dsp.ki.ANGEL_SKIN_KEY] =
    {
        {cutoff =   65, itemId = 16254, augments = {{782, 0, 19}, {180, 0, 1}, {101, 0, 1}, {518, 0, 3}, {320, 0, 1}, {5, 0, 4}}}, -- Altius Mantle -rlig/rsil/pmab/chr/bpad/-hp
        {cutoff =  162, itemId = 16253, augments = {{1, 0, 29}, {9, 0, 29}, {54, 0, 1}, {50, 0, 1}, {51, 0, 1}, {777, 0, 19}}}, -- Chiffon Cape hp/mp/pdt/slow/hprwh/-rice
        {cutoff =  243, itemId = 16255, augments = {{52, 0, 1}, {178, 0, 2}, {517, 0, 3}, {53, 0, 3}, {36, 0, 2}, {292, 0, 3}}}, -- Cortege Cape mprwh/rpar/mnd/sird/macc/eleski
        {cutoff =  356, itemId = 16252, augments = {{24, 0, 3}, {25, 0, 17}, {512, 0, 2}, {195, 0, 2}, {32, 0, 2}}}, -- Resilient Mantle -acc/att/str/sb/-eva
        {cutoff =  437, itemId = 16256, augments = {{12, 0, 4}, {141, 0, 2}, {40, 0, 2}, {516, 0, 3}, {97, 0, 2}, {323, 0, 3}}}, -- Rugged Mantle -mp/cmp/-enm/int/pattratt/cct
    },
    [dsp.ki.MOOGLE_KEY] =
    {
        {cutoff =  167, itemId = 12442, augments = {{23, 0, 1}, {25, 0, 1}, {1, 0, 4}, {9, 0, 4}, {769, 0, 1}, {773, 0, 1}}}, -- Studded Bandana acc/att/hp/mp/rice/rwat
        {cutoff =  374, itemId = 13209, augments = {{514, 0, 1}, {515, 0, 1}, {1, 0, 4}, {9, 0, 4}, {778, 0, 1}, {768, 0, 1}}}, -- Chain Belt vit/agi/hp/mp/rwin/rfir
        {cutoff =  707, itemId = 13083, augments = {{9, 0, 11}, {1, 0, 4}, {40, 0, 1}, {53, 0, 1}, {775, 0, 1}, {774, 0, 1}}}, -- Chain Choker mp/hp/-enm/sird/rdar/rlig
    },
    [dsp.ki.BIRD_KEY] =
    {
        {cutoff = 143, itemId = 12987, augments = {{774, 0, 2}, {39, 0, 2}, {53, 0, 2}, {35, 0, 1}, {9, 0, 5}, {518, 0, 1}}}, -- Ebony Sabots rlig/enm/sird/macc/mp/chr
        {cutoff = 393, itemId = 13783, augments = {{1, 0, 9}, {51, 0, 2}, {512, 0, 1}, {520, 0, 3}, {25, 0, 5}, {97, 0, 2}}}, -- Iron Scale Mail hp/hprwh/str/-dex/att/pattratt
        {cutoff = 536, itemId = 12293, augments = {{768, 0, 3}, {35, 0, 1}, {329, 0, 1}, {9, 0, 3}, {96, 0, 2}, {521, 0, 1}}}, -- Oak Shield rfir/macc/cp/mp/petaccracc/-vit
        {cutoff = 653, itemId = 13200, augments = {{188, 0, 1}, {186, 0, 1}, {512, 0, 1}, {25, 0, 3}, {32, 0, 5}, {23, 0, 3}}}, -- Waistbelt rchar/rgrav/str/att/-eva/acc
    },
    [dsp.ki.CACTUAR_KEY] =
    {
        {cutoff = 109, itemId = 13111, augments = {{512, 0, 1}, {513, 0, 1}, {50, 0, 3}, {1, 0, 4}, {142, 0, 1}, {773, 0, 1}}}, -- Nodowa str/dex/slow/hp/stp/rwat
        {cutoff = 196, itemId = 12604, augments = {{516, 0, 3}, {517, 0, 3}, {518, 0, 3}, {137, 0, 0}, {185, 0, 4}, {36, 0, 2}}}, -- Silk Coat int/mnd/chr/regen/rbli/-macc
        {cutoff = 305, itemId = 13981, augments = {{518, 0, 1}, {520, 0, 2}, {25, 0, 2}, {23, 0, 2}, {178, 0, 1}, {184, 0, 1}}}, -- Turtle Bangles chr/-dex/att/acc/rpar/rstu
        {cutoff = 370, itemId = 13711, augments = {{517, 0, 1}, {1, 0, 5}, {27, 0, 4}, {30, 0, 4}, {770, 0, 4}, {768, 0, 4}}}, -- Carapace Mask mnd/hp/racc/-ratt/rwin/rfir
    },
    [dsp.ki.BOMB_KEY] =
    {
        {cutoff = 308, itemId = 12980, augments = {{34, 0, 5}, {9, 0, 11}, {141, 0, 2}, {40, 0, 1}, {105, 0, 1}}}, -- Battle Boots -def/mp/cmp/-enm/-penm
        {cutoff = 462, itemId = 12860, augments = {{9, 0, 4}, {515, 0, 1}, {517, 0, 1}, {29, 0, 2}, {98, 0, 1}}}, -- Silk Slops mp/agi/mnd/ratt/peva
        {cutoff = 616, itemId = 13589, augments = {{1, 0, 4}, {515, 0, 1}, {31, 0, 1}, {769, 0, 1}, {55, 0, 1}}}, -- Tiger Mantle hp/agi/eva/rice/-mdt
        {cutoff = 693, itemId = 12427, augments = {{49, 0, 2}, {24, 0, 2}, {180, 0, 1}, {100, 0, 1}, {1, 0, 11}, {25, 0, 2}}}, -- Bascinet haste/-acc/rsil/pmacc/-hp/-att
    },
    [dsp.ki.CHOCOBO_KEY] =
    {
        {cutoff =  190, itemId = 16008, augments = {{13, 15, 30}, {133, 0, 1}, {35, 0, 1}, {141, 0, 2}, {53, 0, 4}, {257, 0, 4}, {258, 0, 4}, {259, 0, 4}, {260, 0, 4}, {261, 0, 4}, {262, 0, 4}, {263, 0, 4}, {264, 0, 4}, {265, 0, 4}, {266, 0, 4}, {267, 0, 4}, {268, 0, 4}, {281, 0, 4}, {282, 0, 4}, {283, 0, 4}, {286, 0, 4}}}, -- Aptus Earring -mp/mab/macc/cmp/sird/allmagicskillsseparated
        {cutoff =  285, itemId = 16372, augments = {{195, 0, 2}, {188, 0, 3}, {51, 0, 1}, {1, 0, 7}, {774, 0, 6}, {783, 0, 6}}}, -- Stearc Subligar sb/rcha/hprwh/hp/rlig/-rdar
        {cutoff =  571, itemId = 16295, augments = {{5, 15, 30}, {23, 0, 4}, {25, 0, 4}, {27, 0, 4}, {29, 0, 4}, {288, 0, 4}, {289, 0, 4}, {290, 0, 4}, {291, 0, 4}, {292, 0, 4}, {293, 0, 4}, {294, 0, 4}, {295, 0, 4}, {296, 0, 4}, {297, 0, 4}, {298, 0, 4}, {299, 0, 4}, {300, 0, 4}, {301, 0, 4}}}, -- Varius Torque -hp/acc/att/racc/ratt/allcombatskillsseparated
    },
    [dsp.ki.TONBERRY_KEY] =
    {
        {cutoff =  291, itemId = 15938, augments = {{49, 0, 4}, {512, 0, 2}, {513, 0, 2}, {195, 0, 4}, {31, 0, 4}, {24, 9, 14}}}, -- Esprit Belt int/mnd/chr/macc/enm/sird
        {cutoff =  600, itemId = 15937, augments = {{516, 0, 4}, {517, 0, 4}, {518, 0, 4}, {35, 0, 3}, {39, 2, 4}, {53, 0, 2}}}, -- Fettle Belt haste/str/dex/sb/eva/-acc
    },
}

local function givePrize(player, ki)
    if not player:hasKeyItem(ki) then
        player:showText(player, ID.text.NO_KEY)
    else
        local p = prizes[ki]
        if p ~= nil then
            -- determine prize
            local prize = nil
            local roll = math.random(p[#p].cutoff)
            for i = 1, #p do
                if roll <= p[i].cutoff then
                    prize = p[i]
                    break
                end
            end

            -- determine augments           
            local addAug = {}
            if prize.augments ~= nil then
                local pAug = prize.augments
                local alreadyRolled = {}
                for i = 1, 4 do
                    roll = math.random(0, #pAug)
                    local a = pAug[roll]
                    if a ~= nil and alreadyRolled[a[1]] == nil then
                        alreadyRolled[a[1]] = true
                        table.insert(addAug, a[1])
                        table.insert(addAug, math.random(a[2],a[3]))
                    end
                end
            end
            for i = #addAug, 7 do
                table.insert(addAug, 0)
            end

            -- give prize
            if player:getFreeSlotsCount() == 0 then
                player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, prize.itemId)
            else
                player:addItem(prize.itemId, 1, unpack(addAug))
                player:messageSpecial(ID.text.ITEM_OBTAINED, prize.itemId)
                player:delKeyItem(ki)
            end
        end
    end
end

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local receivedNexusCape = player:getCharVar("receivedNexusCape")

    local arg1 =
        (not player:hasKeyItem(dsp.ki.CRIMSON_KEY)   and   2 or 0) +
        (not player:hasKeyItem(dsp.ki.VIRIDIAN_KEY)  and   4 or 0) +
        (not player:hasKeyItem(dsp.ki.AMBER_KEY)     and   8 or 0) +
        (not player:hasKeyItem(dsp.ki.AZURE_KEY)     and  16 or 0) +
        (not player:hasKeyItem(dsp.ki.IVORY_KEY)     and  32 or 0) +
        (not player:hasKeyItem(dsp.ki.EBON_KEY)      and  64 or 0) +
        (not player:hasKeyItem(dsp.ki.PRISMATIC_KEY) and 128 or 0)
        
    local arg2 =
        (not player:hasKeyItem(dsp.ki.WHITE_CORAL_KEY) and   2 or 0) +
        (not player:hasKeyItem(dsp.ki.BLUE_CORAL_KEY)  and   4 or 0) +
        (not player:hasKeyItem(dsp.ki.PEACH_CORAL_KEY) and   8 or 0) +
        (not player:hasKeyItem(dsp.ki.BLACK_CORAL_KEY) and  16 or 0) +
        (not player:hasKeyItem(dsp.ki.RED_CORAL_KEY)   and  32 or 0) +
        (not player:hasKeyItem(dsp.ki.ANGEL_SKIN_KEY)  and  64 or 0) +
        (not player:hasKeyItem(dsp.ki.OXBLOOD_KEY)     and 128 or 0)

    local arg3 =
        (not player:hasKeyItem(dsp.ki.MOOGLE_KEY)   and   2 or 0) +
        (not player:hasKeyItem(dsp.ki.BIRD_KEY)     and   4 or 0) +
        (not player:hasKeyItem(dsp.ki.CACTUAR_KEY)  and   8 or 0) +
        (not player:hasKeyItem(dsp.ki.BOMB_KEY)     and  16 or 0) +
        (not player:hasKeyItem(dsp.ki.CHOCOBO_KEY)  and  32 or 0) +
        (not player:hasKeyItem(dsp.ki.TONBERRY_KEY) and  64 or 0) +
        (not player:hasKeyItem(dsp.ki.BEHEMOTH_KEY) and 128 or 0)

    local arg4 =
        ((ENABLE_ACP == 0 or arg1 == 254) and 2 or 0) +
        ((ENABLE_AMK == 0 or arg2 == 254) and 4 or 0) +
        ((ENABLE_ASA == 0 or arg3 == 254) and 8 or 0) +
        ((ENABLE_ACP * ENABLE_AMK * ENABLE_ASA == 0 or receivedNexusCape == 1) and 16 or 0) +
        ((ENABLE_ACP * ENABLE_AMK * ENABLE_ASA == 0 or receivedNexusCape == 0) and 32 or 0)
    
    player:startEvent(10099,arg1,arg2,arg3,arg4,0,0,0,0)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10099 then
        if option == 16777216 and player:getCharVar("receivedNexusCape") == 0 and npcUtil.giveItem(player, 11538) then
            player:setCharVar("receivedNexusCape", 1)
        elseif option == 33554432 or (option == 16777216 and player:getCharVar("receivedNexusCape") == 0) then
            player:addUsedItem(11538)
        elseif option >= 1 and option <= 20 then
            local ki = optionToKI[option]
            if ki ~= nil then
                givePrize(player, ki)
            end
        end
    end
end