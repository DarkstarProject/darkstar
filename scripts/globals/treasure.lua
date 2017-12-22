-------------------------------------------------
--    Treasure functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Picking_your_Coffers_and_Chests
--      http://ffxi.allakhazam.com/db/jobs.html?fjob=10&mid=1086187627165365190&num=150
-------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-------------------------------------------------
-- THF tools/keys & their chance increment
-------------------------------------------------

skeletonKey = 0x45B; -- 1115
  livingKey = 0x3FF; -- 1023
   thftools = 0x3FE; -- 1022

   SK_SUCCESS_INCREMENT = 0.2
   LK_SUCCESS_INCREMENT = 0.15
  TTK_SUCCESS_INCREMENT = 0.1

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

---------------------------------------
-- Items
---------------------------------------

    BurstScroll = 0x12D4;
  MagesBalladII = 0x1383;
     AdeptsRope = 0x33AE;
ElectrumHairpin = 0x3610;
    PhalanxRing = 0x34CC;
      GigantAxe = 0x4146;
 TropicalShield = 0x3035;
   ElectrumRing = 0x34CB;
      EmethPick = 0x4122;
      Falcastra = 0x4183;
       LifeBelt = 0x33AF;
CougarBaghnakhs = 0x413E;
       PyroRobe = 0x359B;
        MothAxe = 0x414F;
  ShieldEarring = 0x3435;
    FrostShield = 0x3032;
    ReplicaMaul = 0x4412;
   BattleGloves = 0x31FF;
        HeatRod = 0x42AF;
      ForceBelt = 0x33A6;
 FlameBoomerang = 0x438B;
  SafeguardRing = 0x394E;
 LightGauntlets = 0x3699;
     HiReraiser = 0x104D;
PhysicalEarring = 0x3456;
    VileElixir1 = 0x104F;

---------------------------------------
-- Gems
---------------------------------------

      Amber = 0x32E;
   Amethyst = 0x320;
   Ametrine = 0x32B;
 Aquamarine = 0x317;
Chrysoberyl = 0x321;
 ClearTopaz = 0x329;
   Fluorite = 0x32A;
     Garnet = 0x316;
  Goshenite = 0x328;
LapisLazuli = 0x31B;
  LightOpal = 0x31C;
  Moonstone = 0x322;
       Onyx = 0x31F;
    Painite = 0x31D;
    Peridot = 0x314;
   Sardonyx = 0x327;
     Sphene = 0x32F;
   Sunstone = 0x323;
 Tourmaline = 0x326;
  Turquoise = 0x31E;
     Zircon = 0x325;

-------------------------------------------------
-- AF by Zone
-------------------------------------------------

function getAFbyZone(zone)
    -- job#1, quest#1, item#1, job#2, quest#2, item#2, ...
    if (zone == 147) then -- Beadeaux
        -- Beast Jackcoat (BST), Gallant Breeches (PLD), Temple Cyclas (MNK)
        return {9,BORGHERTZ_S_WILD_HANDS,12646,
                7,BORGHERTZ_S_STALWART_HANDS,14220,
                2,BORGHERTZ_S_STRIKING_HANDS,12639};
    elseif (zone == 150) then -- Monastic Cavern
        -- Chaos Flanchard (DRK), Hunter's Jerkin (RNG), Wizard's Coat (BLM)
        return { 8,BORGHERTZ_S_SHADOWY_HANDS,14221,
                11,BORGHERTZ_S_CHASING_HANDS,12648,
                 4,BORGHERTZ_S_SORCEROUS_HANDS,12641};
    elseif (zone == 151) then -- Castle Oztroja
        -- Chaos Cuirass(DRK), Choral Cannions (BRD), Rogue's Culottes (THF), Warlock's Tabard (RDM)
        return { 8,BORGHERTZ_S_SHADOWY_HANDS,12645,
                10,BORGHERTZ_S_HARMONIOUS_HANDS,14223,
                 6,BORGHERTZ_S_SNEAKY_HANDS,14219,
                 5,BORGHERTZ_S_VERMILLION_HANDS,12642};
    elseif (zone == 153) then -- The Boyahda Tree
        -- Ninja Hatsuburi (NIN)
        return {13,BORGHERTZ_S_LURKING_HANDS,13869};
    elseif (zone == 159) then -- Temple of Uggalepih
        -- Evoker's Doublet (SMN), Myochin Domaru (SAM)
        return {15,BORGHERTZ_S_CALLING_HANDS,12650,
                12,BORGHERTZ_S_LOYAL_HANDS,13781};
    elseif (zone == 161) then -- Castle Zvahl Baileys
        -- Fighter's Cuisses (WAR), Rogue's Vest (THF)
        return {1,BORGHERTZ_S_WARRING_HANDS,14214,
                6,BORGHERTZ_S_SNEAKY_HANDS,12643};
    elseif (zone == 169) then -- Toraimarai Canal
        -- Evoker's Pigaches (SMN)
        return {15,BORGHERTZ_S_CALLING_HANDS,14103};
    elseif (zone == 176) then -- Sea Serpent Grotto
        -- Ninja Kyahan (NIN)
        return {13,BORGHERTZ_S_LURKING_HANDS,14101};
    elseif (zone == 195) then -- The eldieme Necropolis
        -- Wizard's Tonban (BLM)
        return {4,BORGHERTZ_S_SORCEROUS_HANDS,14217};
    elseif (zone == 197) then -- Crawler's Nest
        -- Choral Roundlet (BRD), Fighter's Mask (WAR), Healer's Pantaloons (WHM), Hunter's Braccae (RNG)
        return {10,BORGHERTZ_S_HARMONIOUS_HANDS,13857,
                 1,BORGHERTZ_S_WARRING_HANDS,12511,
                 3,BORGHERTZ_S_HEALING_HANDS,14216,
                11,BORGHERTZ_S_CHASING_HANDS,14224};
    elseif (zone == 200) then -- Garlaige Citadel
        -- Beast Helm (BST), Gallant Coronet (PLD), Healer's Cap (WHM), Temple Crown (MNK), Warlock's Tights (RDM)
        return {9,BORGHERTZ_S_WILD_HANDS,12517,
                7,BORGHERTZ_S_STALWART_HANDS,12515,
                3,BORGHERTZ_S_HEALING_HANDS,13855,
                2,BORGHERTZ_S_STRIKING_HANDS,12512,
                5,BORGHERTZ_S_VERMILLION_HANDS,14218};
    elseif (zone == 205) then -- Ifrit's Cauldron
        -- Drachen Mail (DRG)
        return {14,BORGHERTZ_S_DRAGON_HANDS,12649};
    elseif (zone == 208) then -- Quicksand Caves
        -- Drachen Greaves (DRG), Myochin Haidate (SAM)
        return {14,BORGHERTZ_S_DRAGON_HANDS,14102,
                12,BORGHERTZ_S_LOYAL_HANDS,14225};
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
    local weak = player:getStatusEffect(EFFECT_WEAKNESS);
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
    elseif (player:getMainJob() == JOBS.THF and player:getMainLvl() >= minLVL) then -- ifplayer is THF with level higher or equal than minimun lv for coffer/chest
        success = thfKeySuccess(trade,player:getMainLvl(),treasureLVL);
        chance_answer = {success,nil};
    else
        -- Player is not THF (as main job) or doesn't haven enough level to open the coffer
        chance_answer = {-1,CHEST_FAIL};
    end

    return chance_answer;
end

function chestLoot(zone,npc)
    --[[-----------------------------------------------
                           Chest Loot
    ---------------------------------------------------
    ---------------------------------------
    -- Items
    ---------------------------------------

        BurstScroll = 0x12D4;
      MagesBalladII = 0x1383;
         AdeptsRope = 0x33AE;
    ElectrumHairpin = 0x3610;
        PhalanxRing = 0x34CC;
          GigantAxe = 0x4146;
     TropicalShield = 0x3035;
       ElectrumRing = 0x34CB;
          EmethPick = 0x4122;
          Falcastra = 0x4183;
           LifeBelt = 0x33AF;
    CougarBaghnakhs = 0x413E;
           PyroRobe = 0x359B;
            MothAxe = 0x414F;
      ShieldEarring = 0x3435;
        FrostShield = 0x3032;
        ReplicaMaul = 0x4412;
       BattleGloves = 0x31FF;
            HeatRod = 0x42AF;
          ForceBelt = 0x33A6;
     FlameBoomerang = 0x438B;
      SafeguardRing = 0x394E;
     LightGauntlets = 0x3699;
         HiReraiser = 0x104D;
    PhysicalEarring = 0x3456;
        VileElixir1 = 0x104F;

    ---------------------------------------
    -- Gems
    ---------------------------------------

          Amber = 0x32E;
       Amethyst = 0x320;
       Ametrine = 0x32B;
     Aquamarine = 0x317;
    Chrysoberyl = 0x321;
     ClearTopaz = 0x329;
       Fluorite = 0x32A;
         Garnet = 0x316;
      Goshenite = 0x328;
        Jadeite = 0x310;
    LapisLazuli = 0x31B;
      LightOpal = 0x31C;
      Moonstone = 0x322;
           Onyx = 0x31F;
        Painite = 0x31D;
        Peridot = 0x314;
       Sardonyx = 0x327;
         Sphene = 0x32F;
       Sunstone = 0x323;
     Tourmaline = 0x326;
      Turquoise = 0x31E;
         Zircon = 0x325;
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
    --]]-----------------------------------------------

    local gil =
    {
        9,  {0.762,5200,12500},
        11, {0.731,3200,6400},
        28, {0.929,5100,9900},
        141,{0.500,800,2100},
        142,{0.450,800,235},
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
        9,  {0.238,0x32B,0x31E,0x32F,0x316,0x31F,0x314,0x328},
        11, {0.269,0x32B,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
        28, {0.071,0x316,0x31F,0x32F,0x314,0x31C},
        141,{0.036,0x32E,0x320,0x31B,0x327,0x326},
        142,{0.100,0x32E,0x320,0x31B,0x327,0x326},
        143,{0.136,0x31B,0x320,0x32E,0x327,0x326,0x329},
        145,{0.069,0x32E,0x320,0x329,0x31B,0x327,0x326},
        147,{0.090,0x32B,0x316,0x31C,0x31E,0x328,0x32F},
        149,{0.107,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
        151,{0.080,0x32B,0x316,0x328,0x31C,0x314,0x327,0x32F,0x31E},
        157,{0.161,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x326},
        158,{0.161,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x326},
        161,{0.008,0x32B,0x316,0x328,0x314,0x31F,0x32F},
        162,{0.204,0x31E,0x316,0x328,0x314,0x32F,0x31C},
        176,{0.071,0x32B,0x328,0x316,0x31C,0x32F,0x314,0x31F,0x31E},
        190,{0.093,0x32E,0x320,0x329,0x31B,0x327,0x326},
        191,{0.230,0x32E,0x320,0x329,0x31B,0x327,0x326},
        192,{0.109,0x32E,0x320,0x329,0x31B,0x326},
        193,{0.214,0x320,0x329,0x326,0x327,0x31C,0x31B,0x32E,0x31F},
        194,{0.109,0x32E,0x320,0x329,0x31B,0x326},
        195,{0.105,0x32B,0x328,0x31C,0x31F,0x32F,0x316},
        196,{0.233,0x326,0x329,0x32E,0x320,0x31C,0x31B,0x31F},
        197,{0.162,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
        198,{0.060,0x32E,0x320,0x329,0x31B,0x31C,0x31F,0x327,0x326},
        200,{0.059,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
        204,{0.091,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E},
        213,{0.194,0x32B,0x316,0x328,0x31C,0x31F,0x314,0x32F,0x31E}
    };
    local items =
    {
        9,  {},
        11, {},
        28, {},
        141,{0.464,0x413E},
        142,{0.450,0x413E},
        143,{0.409,0x438B},
        145,{0.483,0x3435},
        147,{0.758,0x33AE},
        149,{0.464,0x34CB},
        151,{0.480,0x3610},
        157,{0.484,0x4122},
        158,{0.484,0x4122},
        161,{0.610,0x34CC},
        162,{0.490,0x34CC},
        176,{},
        190,{0.433,0x31FF},
        191,{0.462,0x3035},
        192,{0.432,0x414F},
        193,{0.476,0x33A6},
        194,{0.432,0x414F},
        195,{0.474,0x4183},
        196,{0.465,0x3032,0x4412},
        197,{0.444,0x4146},
        198,{0.415,0x42AF},
        200,{0.365,0x359B},
        204,{0.440,0x33AF},
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
    --[[-----------------------------------------------
                           Chest Loot
    ---------------------------------------------------
    ---------------------------------------
    -- Items
    ---------------------------------------

        BurstScroll = 0x12D4;
      MagesBalladII = 0x1383;
         AdeptsRope = 0x33AE;
    ElectrumHairpin = 0x3610;
        PhalanxRing = 0x34CC;
          GigantAxe = 0x4146;
     TropicalShield = 0x3035;
       ElectrumRing = 0x34CB;
          EmethPick = 0x4122;
          Falcastra = 0x4183;
           LifeBelt = 0x33AF;
    CougarBaghnakhs = 0x413E;
           PyroRobe = 0x359B;
            MothAxe = 0x414F;
       ScreamFungus = 0x115F
      ShieldEarring = 0x3435;
        FrostShield = 0x3032;
        ReplicaMaul = 0x4412;
       BattleGloves = 0x31FF;
            HeatRod = 0x42AF;
          ForceBelt = 0x33A6;
     FlameBoomerang = 0x438B;
      SafeguardRing = 0x394E;
     LightGauntlets = 0x3699;
         HiReraiser = 0x104D;
    PhysicalEarring = 0x3456;
        VileElixir1 = 0x104F;

    ---------------------------------------
    -- Gems
    ---------------------------------------

          Amber = 0x32E;
       Amethyst = 0x320;
       Ametrine = 0x32B;
     Aquamarine = 0x317;
    Chrysoberyl = 0x321;
     ClearTopaz = 0x329;
       Fluorite = 0x32A;
         Garnet = 0x316;
      Goshenite = 0x328;
        Jadeite = 0x310;
    LapisLazuli = 0x31B;
      LightOpal = 0x31C;
      Moonstone = 0x322;
           Onyx = 0x31F;
        Painite = 0x31D;
        Peridot = 0x314;
       Sardonyx = 0x327;
         Sphene = 0x32F;
       Sunstone = 0x323;
     Tourmaline = 0x326;
      Turquoise = 0x31E;
         Zircon = 0x325;

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
    --]]-----------------------------------------------
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
        12, {0.073,0x317,0x31D,0x310,0x323,0x325,0x321,0x322},
        130,{0.179,0x317,0x321,0x32A,0x310,0x322,0x31D,0x325,0x323},
        147,{0.240,0x317,0x321,0x322,0x31D,0x314,0x323,0x325,0x32A,0x310},
        150,{0.055,0x321,0x32A,0x310,0x322,0x31D,0x323},
        151,{0.044,0x317,0x321,0x32A,0x310,0x322,0x31D,0x323,0x325},
        153,{0.092,0x317,0x321,0x32A,0x310,0x322,0x323,0x325,0x31D},
        159,{0.154,0x31D,0x321,0x32A,0x322,0x325,0x323},
        160,{0.300,0x31D,0x325},
        161,{0.080,0x317,0x321,0x32A,0x310,0x322,0x31D,0x323,0x325},
        169,{0.100,0x317,0x321,0x310,0x322,0x31D,0x323,0x325},
        174,{0.057,0x322,0x321,0x31D,0x310,0x323,0x317,0x325,0x32A},
        176,{0.450,0x317,0x32A,0x310,0x322,0x323,0x31D,0x321},
        177,{0.500,0x317,0x325},
        195,{0.250,0x321,0x32A,0x322,0x31D,0x323},
        197,{0.387,0x317,0x321,0x310,0x31D,0x325,0x323},
        200,{0.125,0x321,0x310,0x322},
        205,{0.103,0x322,0x31D,0x323,0x321,0x32A,0x317},
        208,{0.227,0x317,0x321,0x32A,0x310,0x31D,0x323}
    };
    local items =
    {
        12, {},
        130,{},
        147,{0.385,0x12D4},
        150,{0.127,0x3456},
        151,{0.304,0x394E},
        153,{0.115,0x115F},
        159,{},
        160,{},
        161,{0.189,0x1383},
        169,{},
        174,{},
        176,{},
        177,{},
        195,{0.250,0x104F},
        197,{0.226,0x104D},
        200,{0.125,0x3699},
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
