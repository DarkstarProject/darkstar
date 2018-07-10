-------------------------------------------------
--    Treasure functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

--[[
    -- Items reference

    BurstScroll = 4820;
  MagesBalladII = 4995;
     AdeptsRope = 13230;
ElectrumHairpin = 13840;
    PhalanxRing = 13516;
      GigantAxe = 16710;
 TropicalShield = 12341;
   ElectrumRing = 13515;
      EmethPick = 16674;
      Falcastra = 16771;
       LifeBelt = 13231;
CougarBaghnakhs = 16702;
       PyroRobe = 13723;
        MothAxe = 16719;
  ShieldEarring = 13365;
    FrostShield = 12338;
    ReplicaMaul = 17426;
   BattleGloves = 12799;
        HeatRod = 17071;
      ForceBelt = 13222;
 FlameBoomerang = 17291;
  SafeguardRing = 14670;
 LightGauntlets = 13977;
     HiReraiser = 4173;
PhysicalEarring = 13398;
    VileElixir1 = 4175;

    -- Gems reference

      Amber = 814;
   Amethyst = 800;
   Ametrine = 811;
 Aquamarine = 791;
Chrysoberyl = 801;
 ClearTopaz = 809;
   Fluorite = 810;
     Garnet = 790;
  Goshenite = 808;
LapisLazuli = 795;
  LightOpal = 796;
  Moonstone = 802;
       Onyx = 799;
    Painite = 797;
    Peridot = 788;
   Sardonyx = 807;
     Sphene = 815;
   Sunstone = 803;
 Tourmaline = 806;
  Turquoise = 798;
     Zircon = 805;
--]]

-------------------------------------------------
-- THF tools/keys & their chance increment
-------------------------------------------------

local skeletonKey   = 1115; -- 1115
local livingKey     = 1023; -- 1023
local thftools      = 1022; -- 1022

local SK_SUCCESS_INCREMENT  = 0.2;
local LK_SUCCESS_INCREMENT  = 0.15;
local TTK_SUCCESS_INCREMENT = 0.1;

---------------------------------------
-- Spawn Mimic
---------------------------------------

function spawnMimic(zone,npc,player)
    -- zone,mobid
    local mimic =
    {
        12, 16826564,
        130,17309979,
        147,17379783,
        150,17391805,
        151,17396144,
        153,17404336,
        159,17428497,
        160,17432583,
        161,17436965,
        169,17469761,
        174,17490230,
        176,17498564,
        177,17502567,
        195,17576270,
        197,17584426,
        200,17596728,
        205,17617157,
        208,17629190
    };

    for nb = 1, #mimic, 2 do
        if (zone == mimic[nb]) then
            SpawnMob(mimic[nb + 1]):updateEnmity(player);
            setMobPos(mimic[nb + 1],npc:getXPos(),npc:getYPos(),npc:getZPos(),npc:getRotPos());
            break;
        else
            printf("treasure.lua Mimic missing from zone %d", zone);
        end
    end
end;

-------------------------------------------------
-- AF by Zone
-------------------------------------------------

function getAFbyZone(zone)
    -- job#1, quest#1, item#1, job#2, quest#2, item#2, ...
    if (zone == 147) then -- Beadeaux
        return {
            dsp.job.BST,    BORGHERTZ_S_WILD_HANDS,         12646, -- Beast Jackcoat
            dsp.job.PLD,    BORGHERTZ_S_STALWART_HANDS,     14220, -- Gallant Breeches
            dsp.job.MNK,    BORGHERTZ_S_STRIKING_HANDS,     12639, -- Temple Cyclas
        };
    elseif (zone == 150) then -- Monastic Cavern
        return {
            dsp.job.DRK,    BORGHERTZ_S_SHADOWY_HANDS,      14221, -- Chaos Flanchard
            dsp.job.RNG,    BORGHERTZ_S_CHASING_HANDS,      12648, -- Hunter's Jerkin
            dsp.job.BLM,    BORGHERTZ_S_SORCEROUS_HANDS,    12641, -- Wizard's Coat
        };
    elseif (zone == 151) then -- Castle Oztroja
        return {
            dsp.job.DRK,    BORGHERTZ_S_SHADOWY_HANDS,      12645, -- Chaos Cuirass
            dsp.job.BRD,    BORGHERTZ_S_HARMONIOUS_HANDS,   14223, -- Choral Cannions
            dsp.job.THF,    BORGHERTZ_S_SNEAKY_HANDS,       14219, -- Rogue's Culottes
            dsp.job.RDM,    BORGHERTZ_S_VERMILLION_HANDS,   12642, -- Warlock's Tabard
        };
    elseif (zone == 153) then -- The Boyahda Tree
        return {
            dsp.job.NIN,    BORGHERTZ_S_LURKING_HANDS,      13869, -- Ninja Hatsuburi
        };
    elseif (zone == 159) then -- Temple of Uggalepih
        return {
            dsp.job.SMN,    BORGHERTZ_S_CALLING_HANDS,      12650, -- Evoker's Doublet
            dsp.job.SAM,    BORGHERTZ_S_LOYAL_HANDS,        13781, -- Myochin Domaru
        };
    elseif (zone == 161) then -- Castle Zvahl Baileys
        return {
            dsp.job.WAR,    BORGHERTZ_S_WARRING_HANDS,      14214, -- Fighter's Cuisses
            dsp.job.THF,    BORGHERTZ_S_SNEAKY_HANDS,       12643, -- Rogue's Vest
        };
    elseif (zone == 169) then -- Toraimarai Canal
        return {
            dsp.job.SMN,    BORGHERTZ_S_CALLING_HANDS,      14103, -- Evoker's Pigaches
        };
    elseif (zone == 176) then -- Sea Serpent Grotto
        return {
            dsp.job.NIN,    BORGHERTZ_S_LURKING_HANDS,      14101, -- Ninja Kyahan
        };
    elseif (zone == 195) then -- The eldieme Necropolis
        return {
            dsp.job.BLM,    BORGHERTZ_S_SORCEROUS_HANDS,    14217, -- Wizard's Tonban
        };
    elseif (zone == 197) then -- Crawler's Nest
        return {
            dsp.job.BRD,    BORGHERTZ_S_HARMONIOUS_HANDS,   13857, -- Choral Roundlet
            dsp.job.WAR,    BORGHERTZ_S_WARRING_HANDS,      12511, -- Fighter's Mask
            dsp.job.WHM,    BORGHERTZ_S_HEALING_HANDS,      14216, -- Healer's Pantaloons
            dsp.job.RNG,    BORGHERTZ_S_CHASING_HANDS,      14224, -- Hunter's Braccae
        };
    elseif (zone == 200) then -- Garlaige Citadel
        return {
            dsp.job.BST,    BORGHERTZ_S_WILD_HANDS,         12517, -- Beast Helm
            dsp.job.PLD,    BORGHERTZ_S_STALWART_HANDS,     12515, -- Gallant Coronet
            dsp.job.WHM,    BORGHERTZ_S_HEALING_HANDS,      13855, -- Healer's Cap
            dsp.job.MNK,    BORGHERTZ_S_STRIKING_HANDS,     12512, -- Temple Crown
            dsp.job.RDM,    BORGHERTZ_S_VERMILLION_HANDS,   14218, -- Warlock's Tights
        };
    elseif (zone == 205) then -- Ifrit's Cauldron
        return {
            dsp.job.DRG,    BORGHERTZ_S_DRAGON_HANDS,       12649, -- Drachen Mail
        };
    elseif (zone == 208) then -- Quicksand Caves
        return {
            dsp.job.DRG,    BORGHERTZ_S_DRAGON_HANDS,       14102, -- Drachen Greaves
            dsp.job.SAM,    BORGHERTZ_S_LOYAL_HANDS,        14225, -- Myochin Haidate
        };
    end
end

---------------------------------------
-- Returns the success increment depending on the THF tool used.
---------------------------------------

function thfKeySuccess(trade,playerLVL,treasureLVL)
    local sk  = trade:hasItemQty(skeletonKey,1);
    local lk  = trade:hasItemQty(livingKey,1);
    local ttk = trade:hasItemQty(thftools,1);
    local success = 0;
    if (sk) then
        success = (playerLVL/treasureLVL) - 0.50 + SK_SUCCESS_INCREMENT;
    elseif (lk) then
        success = (playerLVL/treasureLVL) - 0.50 + LK_SUCCESS_INCREMENT;
    elseif (ttk) then
        success = (playerLVL/treasureLVL) - 0.50 + TTK_SUCCESS_INCREMENT;
    end
    return success;
end

---------------------------------------
-- Returns true if the key is a THF "key", false in other case.
---------------------------------------

function isTHFKey(trade)
    local sk  = trade:hasItemQty(skeletonKey,1);
    local lk  = trade:hasItemQty(livingKey,1);
    local ttk = trade:hasItemQty(thftools,1);
    if (sk or lk or ttk) then
        return true;
    else
        return false;
    end
end

---------------------------------------
-- Chance calculation based on job, key used and lvl of the chest/coffer
---------------------------------------

function openChance(player,npc,trade,TreasureType,treasureLVL,minLVL,questItemNeeded)
    local success = 0;
    local chance_answer = {nil,nil}; -- {success%,messageType}
    local weak = player:getStatusEffect(dsp.effect.WEAKNESS);
    local illu  = player:getVar("["..player:getZoneID().."]".."Treasure_"..TreasureType);

    -- SE implemented this in order to prevent coffer farming.
    -- No one in the same area can open more than 1 coffer per hour except for AF, maps or quests items.

    if (weak ~= nil) then -- old code: os.time() <= weak
        chance_answer = {-1,CHEST_WEAK};
    elseif (os.time() < illu and questItemNeeded == 0) then
        UpdateTreasureSpawnPoint(npc:getID());
        if (TreasureType == "Chest") then
            chance_answer = {-2,CHEST_ILLUSION};
        elseif (TreasureType == "Coffer") then
            if (isTHFKey(trade)) then
                chance_answer = {-1,CHEST_ILLUSION}; -- if you used a THF tool you will lose it.
            else
                chance_answer = {-2,CHEST_ILLUSION}; -- if you traded a zone key droped from mobs you will keep the key
            end
        end
    elseif (not(isTHFKey(trade))) then
        chance_answer = {1,nil}; -- Zone Key is always 100% success
    elseif (player:getMainJob() == dsp.job.THF and player:getMainLvl() >= minLVL) then -- ifplayer is THF with level higher or equal than minimun lv for coffer/chest
        success = thfKeySuccess(trade,player:getMainLvl(),treasureLVL);
        chance_answer = {success,nil};
    else
        -- Player is not THF (as main job) or doesn't haven enough level to open the coffer
        chance_answer = {-1,CHEST_FAIL};
    end

    return chance_answer;
end

function chestLoot(zone,npc)
    --[[
    Description:
          Gil = Zone, { [1] Drop rate, [2] Minimum gil, [3] Maximum gil }
        Gems = Zone, { [1] Drop rate, [2] gem1,        [3] gem2,       [4] gem3,  ... ,[10] gem10 }
       Items = Zone, { [1] Drop rate, [2] item1,       [3] item2}

    Date:
    Any update should be here with the date which was modified as well as an URL where info was taken.
        * 07/21/2009
                   URL : http://wiki.ffxiclopedia.org/wiki/Treasure_Chest/Coffer_Guide
        Done : First collection of all the loot and drop rate.
        * 19/06/2013
                  Done : Drop and drop rate by zone
    --]]

    local gil =
    {
        9,  {0.762,5200,12500},
        11, {0.731,3200,6400},
        28, {0.929,5100,9900},
        141,{0.500,800,2100},
        142,{0.450,800,2350},
        143,{0.455,840,1600},
        145,{0.448,800,1600},
        147,{0.152,3440,9000},
        149,{0.429,3060,6320},
        151,{0.440,3200,6320},
        157,{0.355,2450,7000},
        158,{0.355,2450,7000},
        161,{0.382,5000,13950},
        162,{0.306,5000,10000},
        176,{0.929,3355,8900},
        190,{0.474,390,1300},
        191,{0.308,450,900},
        192,{0.459,450,1034},
        193,{0.310,1800,3600},
        194,{0.459,450,1034},
        195,{0.421,5100,12450},
        196,{0.302,1980,3600},
        197,{0.394,4702,10000},
        198,{0.525,1800,5200},
        200,{0.576,4425,10000},
        204,{0.469,4050,7920},
        213,{0.806,3200,11679}
    };
    local gems =
    {
        9,  {0.238,811,798,815,790,799,788,808},
        11, {0.269,811,808,796,799,788,815,798},
        28, {0.071,790,799,815,788,796},
        141,{0.036,814,800,795,807,806},
        142,{0.100,814,800,795,807,806},
        143,{0.136,795,800,814,807,806,809},
        145,{0.069,814,800,809,795,807,806},
        147,{0.090,811,790,796,798,808,815},
        149,{0.107,811,790,808,796,799,788,815,798},
        151,{0.080,811,790,808,796,788,807,815,798},
        157,{0.161,814,800,809,795,796,799,806},
        158,{0.161,814,800,809,795,796,799,806},
        161,{0.008,811,790,808,788,799,815},
        162,{0.204,798,790,808,788,815,796},
        176,{0.071,811,808,790,796,815,788,799,798},
        190,{0.093,814,800,809,795,807,806},
        191,{0.230,814,800,809,795,807,806},
        192,{0.109,814,800,809,795,806},
        193,{0.214,800,809,806,807,796,795,814,799},
        194,{0.109,814,800,809,795,806},
        195,{0.105,811,808,796,799,815,790},
        196,{0.233,806,809,814,800,796,795,799},
        197,{0.162,811,790,808,796,799,788,815,798},
        198,{0.060,814,800,809,795,796,799,807,806},
        200,{0.059,811,790,808,796,799,788,815,798},
        204,{0.091,811,790,808,796,799,788,815,798},
        213,{0.194,811,790,808,796,799,788,815,798}
    };
    local items =
    {
        9,  {},
        11, {},
        28, {},
        141,{0.464,16702},
        142,{0.450,16702},
        143,{0.409,17291},
        145,{0.483,13365},
        147,{0.758,13230},
        149,{0.464,13515},
        151,{0.480,13840},
        157,{0.484,16674},
        158,{0.484,16674},
        161,{0.610,13516},
        162,{0.490,13516},
        176,{},
        190,{0.433,12799},
        191,{0.462,12341},
        192,{0.432,16719},
        193,{0.476,13222},
        194,{0.432,16719},
        195,{0.474,16771},
        196,{0.465,12338,17426},
        197,{0.444,16710},
        198,{0.415,17071},
        200,{0.365,13723},
        204,{0.440,13231},
        213,{}
    };

    -- Loot calculation
    local rand = math.random();

    for u = 1, #gil, 2 do
        if (gil[u] == zone) then
            if (rand <= gil[u + 1][1]) then
                reward = {"gil",math.random(gil[u + 1][2],gil[u + 1][3])};
            elseif (rand <= (gil[u + 1][1] + gems[u + 1][1])) then
                local num_gems = 0;
                local curr_gem = 2;
                while(gems[u + 1][curr_gem] ~= nil) do
                    curr_gem = curr_gem +1;
                    num_gems = num_gems + 1;
                end
                rand_gem = math.random(1,num_gems) + 1;
                reward = {"item",gems[u + 1][rand_gem]};
            else
                local num_item = 0;
                local curr_item = 2;
                while(items[u + 1][curr_item] ~= nil) do
                    curr_item = curr_item +1;
                     num_item = num_item + 1;
                end
                rand_item = math.random(1,num_item) + 1;
                reward = {"item",items[u + 1][rand_item]};
            end
            break;
        end
    end
    return reward;
end

function cofferLoot(zone,npc)
    --[[
    Description:
         Gil = Zone, { [1] Drop rate, [2] Minimum gil, [3] Maximum gil }
        Gems = Zone, { [1] Drop rate, [2] gem1,        [3] gem2,       [4] gem3,  ... ,[10] gem10 }
       Items = Zone, { [1] Drop rate, [2] item1,       [3] item2}

    Date:
    Any update should be here with the date which was modified as well as an URL where info was taken.
        * 07/21/2009
                   URL : http://wiki.ffxiclopedia.org/wiki/Treasure_Chest/Coffer_Guide
                  Done : First collection of all the loot and drop rate.
        * 19/06/2013
                  Done : Drop and drop rate by zone
    --]]
    
    local gil =
    {
        12, {0.927,9800,19180},
        130,{0.821,9576,19460},
        147,{0.375,4700,25000},
        150,{0.818,7320,14400},
        151,{0.652,7320,18000},
        153,{0.793,7110,20520},
        159,{0.846,7320,14400},
        160,{0.700,8000,16770},
        161,{0.731,6300,26880},
        169,{0.900,7440,14280},
        174,{0.943,5200,16100},
        176,{0.550,6145,19580},
        177,{0.500,9940,18900},
        195,{0.500,7590,18039},
        197,{0.387,6040,12100},
        200,{0.750,6668,18700},
        205,{0.897,7200,21060},
        208,{0.773,6160,16100}
    };
    local gems =
    {
        12, {0.073,791,797,784,803,805,801,802},
        130,{0.179,791,801,810,784,802,797,805,803},
        147,{0.240,791,801,802,797,788,803,805,810,784},
        150,{0.055,801,810,784,802,797,803},
        151,{0.044,791,801,810,784,802,797,803,805},
        153,{0.092,791,801,810,784,802,803,805,797},
        159,{0.154,797,801,810,802,805,803},
        160,{0.300,797,805},
        161,{0.080,791,801,810,784,802,797,803,805},
        169,{0.100,791,801,784,802,797,803,805},
        174,{0.057,802,801,797,784,803,791,805,810},
        176,{0.450,791,810,784,802,803,797,801},
        177,{0.500,791,805},
        195,{0.250,801,810,802,797,803},
        197,{0.387,791,801,784,797,805,803},
        200,{0.125,801,784,802},
        205,{0.103,802,797,803,801,810,791},
        208,{0.227,791,801,810,784,797,803}
    };
    local items =
    {
        12, {},
        130,{},
        147,{0.385,4820},
        150,{0.127,13398},
        151,{0.304,14670},
        153,{0.115,4447},
        159,{},
        160,{},
        161,{0.189,4995},
        169,{},
        174,{},
        176,{},
        177,{},
        195,{0.250,4175},
        197,{0.226,4173},
        200,{0.125,13977},
        205,{},
        208,{}
    };

    -- Loot calculation
    local rand = math.random();

    for u = 1, #gil, 2 do
        if (gil[u] == zone) then
            if (rand <= gil[u + 1][1]) then
                reward = {"gil",math.random(gil[u + 1][2],gil[u + 1][3])};
            elseif (rand <= (gil[u + 1][1] + gems[u + 1][1])) then
                local num_gems = 0;
                local curr_gem = 2;
                while(gems[u + 1][curr_gem] ~= nil) do
                    curr_gem = curr_gem +1;
                    num_gems = num_gems + 1;
                end
                rand_gem = math.random(1,num_gems) + 1;
                reward = {"item",gems[u + 1][rand_gem]};
            else
                local num_item = 0;
                local curr_item = 2;
                while(items[u + 1][curr_item] ~= nil) do
                    curr_item = curr_item +1;
                     num_item = num_item + 1;
                end
                rand_item = math.random(1,num_item) + 1;
                reward = {"item",items[u + 1][rand_item]};
            end
            break;
        end
    end
    return reward;
end
