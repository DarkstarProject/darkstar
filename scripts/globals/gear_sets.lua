-----------------------------------
-- Gear sets
-- Allows the use of gear sets with modifiers
-----------------------------------
require("scripts/globals/status");
-----------------------------------

local matchtype = {
    any           = 0,
    earring_weapon = 1,
    weapon_weapon  = 2
}

-- placeholder for unknown mod types
local MOD_UNKNOWN = 0;

-- apparently these are static, so i'll leave them here
local extraDamageChance = 35;
local extraAttackChance = 25;
local nullDamageChance = 15;
local instantCastChance = 15;


--              {id, {item, ids, in, no, particular, order}, minimum matches required, match type, mods{id, value, modvalue for each additional match, additional whole set bonus}
local GearSets =  {
             {id = 1, items = {16092,14554,14969,15633,15719},  matches = 5, matchType = matchtype.any, mods = {{MOD_HASTE_GEAR, 50, 0, 0}} },    --  Usukane's set (5% Haste)
             {id = 2, items = {16088,14550,14965,15629,15715},  matches = 5, matchType = matchtype.any, mods = {{MOD_CRITHITRATE, 5, 0, 0}} },    --  Skadi's set (5% critrate is guess)
             {id = 3, items = {16084,14546,14961,15625,15711},  matches = 5, matchType = matchtype.any, mods = {{MOD_DOUBLE_ATTACK, 5, 0, 0}} },  --  Ares's set (5% DA)
             {id = 4, items = {16107,14569,14984,15648,15734},  matches = 5, matchType = matchtype.any, mods = {{MOD_ACC, 20, 0, 0}} },           --  Denali Jacket Set (Increases Accuracy +20)
             {id = 5, items = {16106,14568,14983,15647,15733},  matches = 5, matchType = matchtype.any, mods = {{MOD_HPP, 10, 0, 0}} },           --  Askar Korazin Set (Max HP Boost %10)
             {id = 6, items = {16069,14530,14940,15609,15695},  matches = 5, matchType = matchtype.any, mods = {{MOD_SUBTLE_BLOW, 8, 0, 0}} },    --  Pahluwan Khazagand Set (8% is guess)
             {id = 7, items = {16100,14562,14977,15641,15727},  matches = 5, matchType = matchtype.any, mods = {{MOD_MATT, 5, 0, 0}} },           --  Morrigan's Robe Set (+5 Magic. Atk Bonus)
             {id = 8, items = {16096,14558,14973,15637,15723},  matches = 5, matchType = matchtype.any, mods = {{MOD_FASTCAST, 5, 0, 0}} },       --  Marduk's Jubbah Set (5% fastcast)
             {id = 9, items = {16108,14570,14985,15649,15735},  matches = 5, matchType = matchtype.any, mods = {{MOD_MDEF, 10, 0, 0}} },          --  Goliard Saio Set - Total Set Bonus +10% Magic Def. Bonus
             
             {id = 10, items = {16064,14527,14935,15606,15690},  matches = 5, matchType = matchtype.any, mods = {{MOD_REFRESH, 1, 0, 0}} },      --  Yigit Gomlek Set (1mp per tick) Adds "Refresh" effect
             {id = 11, items = {11503,13759,12745,14210,11413},  matches = 5, matchType = matchtype.any, mods = {{MOD_HASTE_GEAR, 50, 0, 0}} },   --  Perle Hauberk Set 5% haste
             {id = 12, items = {11504,13760,12746,14257,11414},  matches = 5, matchType = matchtype.any, mods = {{MOD_STORETP, 8, 0, 0}} },      --  Aurore Doublet Set  store tp +8
             {id = 13, items = {11505,13778,12747,14258,11415},  matches = 5, matchType = matchtype.any, mods = {{MOD_FASTCAST, 10, 0, 0}} },    --  Teal Saio Set  fastcast 10%
             {id = 14, items = {10890,10462,10512,11980,10610},  matches = 5, matchType = matchtype.any, mods = {{MOD_HASTE_GEAR, 60, 0, 0}} },   --  Calma Armor Set haste%6
             {id = 15, items = {10892,10464,10514,11982,10612},  matches = 5, matchType = matchtype.any, mods = {{MOD_MACC, 5, 0, 0}} },        --  Magavan Armor Set  magic accuracy +5
             {id = 16, items = {10891,10463,10513,11981,10611},  matches = 5, matchType = matchtype.any, mods = {{MOD_CRITHITRATE, 5, 0, 0}} },  --  Mustela Harness Set  crit rate 5%
         --   {id = 17, items = {16146,14588,15009,16315,15755},  matches = 2, matchType = matchtype.any, mods = {{MOD_UNKNOWN, 5, 5, 10}} },           --  Iron Ram Haubert Set
             {id = 18, items = {16147,14589,15010,16316,15756},  matches = 2, matchType = matchtype.any, mods = {{MOD_ATT, 1, 4.7, 0}} },        --  Fourth Division Brune Set
             {id = 19, items = {16148,14590,15011,16317,15757},  matches = 2, matchType = matchtype.any, mods = {{MOD_COUNTER, 1, 1, 0}} },      --  Cobra Unit Harness Set
             {id = 20, items = {16149,14591,15012,16318,15758},  matches = 2, matchType = matchtype.any, mods = {{MOD_MACC, 1, 1, 0}} },        --  Cobra Unit Robe Set
             {id = 21, items = { 6141, 14581,15005,16312,15749}, matches = 2, matchType = matchtype.any, mods = {{MOD_ACC, 1, 1, 0}, {MOD_ATT, 1, 1, 0}} },       --  Iron Ram Chainmail Set. Double mod here! It is why it has 2 IDs.
             {id = 23, items = {16142,14582,15006,16313,15750} , matches = 2, matchType = matchtype.any, mods = {{MOD_HP, 10, 10, 0}} },        --  Fourth Division Cuirass Set
             {id = 24, items = {16143,14583,15007,16314,15751} , matches = 2, matchType = matchtype.any, mods = {{MOD_MP, 10, 10, 0}} },        --  Cobra Unit Coat Set
             {id = 25, items = {16062,14525,14933,15604,15688} , matches = 5, matchType = matchtype.any, mods = {{MOD_UDMGBREATH, -8, 0, 0}, {MOD_UDMGMAGIC, -8, 0, 0}} },       --  Amir Korazin Set - Double mod here! It is why it has 2 IDs.
             
             {id = 27, items = {11281,15015,16337,11364}, matches = 2, matchType = matchtype.any, mods = {{MOD_STORETP, 5, 5, 0}} },             --  Hachiryu Haramaki Set - Store tp
             {id = 28, items = {11064,11084,11104,11124,11144}, matches = 5, matchType = matchtype.any, mods = {{MOD_DA_DOUBLE_DAMAGE, 5, 0, 0}} }, --  Ravager's Armor +2 Set - Double attack double damage chance
                                                                                                   
             {id = 29, items = {11808,11824,11850,11857,11858}, matches = 2, matchType = matchtype.any, mods = {{MOD_DOUBLE_ATTACK, 5, 0, 0}} },   --  Fazheluo Mail Set. Set Bonus: "Double Attack"+5%. Active with any 2 pieces.
             
             {id = 30, items = {11809,11825,11851,11855,11859}, matches = 2, matchType = matchtype.any, mods = {{MOD_HASTE_GEAR, 80, 0, 0}} }, --  Cuauhtli Harness Set. Set Bonus: Haste+8%. Active with any 2 pieces.
             
             {id = 31, items = {11810,11826,11852,11856,11860}, matches = 2, matchType = matchtype.any, mods = {{MOD_MACC, 5, 0, 0}} },    --  Hyskos Robe Set. Set Bonus: Magic Accuracy+5. Active with any 2 pieces.
             {id = 32, items = {10876,10450,10500,11969,10600}, matches = 2, matchType = matchtype.any, mods = {{MOD_REFRESH, 1, 0.4, 0}} },     --  Ogier's Armor Set. Set Bonus: Adds "Refresh" Effect. Provides 1 mp/tick for 2-3 pieces worn, 2 mp/tick for 4-5 pieces worn.
             {id = 33, items = {10877,10451,10501,11970,10601}, matches = 2, matchType = matchtype.any, mods = {{MOD_CRITHITRATE, 1, 1, 0}} },   --  Athos's Armor Set. Set Bonus: Increases rate of critical hits. Gives +3% for the first 2 pieces and +1% for every additional piece.
             
             -- hipster set, stick it in HipsterSets below so we can handle it separately (still need to check if it's a set, though)
             {id = 34, items = {10878,10452,10502,11971,10602}, matches = 2, matchType = matchtype.any, mods = {{MOD_FASTCAST, 0, 0, 0}} },        --  Rubeus Armor Set. Set Bonus: Enhances "Fast Cast" Effect. 2 or 3 pieces equipped: Fast Cast +4, 4 or 5 pieces equipped: Fast Cast +10
             
             {id = 35, items = {11080,11100,11120,11140,11160}, matches = 5, matchType = matchtype.any, mods = {{MOD_QUICK_DRAW_TRIPLE_DAMAGE, extraDamageChance, 0, 0}} },        --  Navarch's Attire +2 Set. Set Bonus: Augments "Quick Draw". Quick Draw will occasionally deal triple damage.
             {id = 36, items = {11082,11102,11122,11142,11162}, matches = 2, matchType = matchtype.any, mods = {{MOD_SAMBA_DOUBLE_DAMAGE, 1, 1.8, 0}} },                         --  Charis Attire +2 Set. Set Bonus: Augments "Samba". Occasionally doubles damage with Samba up. Adds approximately 1-2% per piece past the first.
             {id = 37, items = {11076,11096,11116,11136,11156}, matches = 5, matchType = matchtype.any, mods = {{MOD_EXTRA_DUAL_WIELD_ATTACK, extraAttackChance, 0, 0}} },         --  Iga Garb +2 Set. Set Bonus: Augments "Dual Wield". Attacks made while dual wielding occasionally add an extra attack
             {id = 38, items = {11074,11094,11114,11134,11154}, matches = 2, matchType = matchtype.any, mods = {{MOD_RAPID_SHOT_DOUBLE_DAMAGE, extraDamageChance, 0, 0}} },        --  Sylvan Attire +2 Set. Set Bonus: Augments "Rapid Shot". Rapid Shots occasionally deal double damage.
             {id = 39, items = {11070,11090,11110,11130,11150}, matches = 5, matchType = matchtype.any, mods = {{MOD_ABSORB_DMG_CHANCE, 1, 1, 0}} },                          --  Creed Armor +2 Set. Set Bonus: Occasionally absorbs damage taken. Set proc believed to be somewhere around 5%, more testing needed. Verification Needed Absorb rate likely varies with # of set pieces.
             {id = 40, items = {11075,11095,11115,11135,11155}, matches = 5, matchType = matchtype.any, mods = {{MOD_ZANSHIN_DOUBLE_DAMAGE, extraDamageChance, 0, 0}} },          --  Unkai Domaru +2 Set. Set Bonus: Augments "Zanshin". Zanshin attacks will occasionally deal double damage.
             {id = 41, items = {11065,11085,11105,11125,11145}, matches = 5, matchType = matchtype.any, mods = {{MOD_EXTRA_KICK_ATTACK, extraAttackChance, 0, 0}} },             --  Tantra Attire +2 Set. Set Bonus: Augments "Kick Attacks". Occasionally allows a second Kick Attack during an attack round without the use of Footwork.
             {id = 42, items = {11069,11089,11109,11129,11149}, matches = 2, matchType = matchtype.any, mods = {{MOD_TA_TRIPLE_DAMAGE, extraDamageChance, 0, 0}} },              --  Raider's Attire +2 Set. Set Bonus: Augments "Triple Attack". Occasionally causes the second and third hits of a Triple Attack to deal triple damage.Verification Needed Requires a minimum of two pieces.
             {id = 43, items = {11066,11086,11106,11126,11146}, matches = 5, matchType = matchtype.any, mods = {{MOD_BAR_ELEMENT_NULL_CHANCE, nullDamageChance, 0, 0}} },        --  Orison Attire +2 Set. Set Bonus: Augments elemental resistance spells. Bar Elemental spells will occasionally nullify damage of the same element.
             {id = 44, items = {11083,11103,11123,11143,11163}, matches = 5, matchType = matchtype.any, mods = {{MOD_GRIMOIRE_INSTANT_CAST, instantCastChance, 0, 0}} },          --  Savant's Attire +2 Set. Set Bonus: Augments Grimoire. Spells that match your current Arts will occasionally cast instantly, without recast.
             
             {id = 45, items = {16005, 17756, 17962, 18596, 18760, 19112, 19215, 19271, 19156}, matches = 2, matchType = matchtype.earring_weapon, mods = {{MOD_HP, 30, 0, 0}, {MOD_VIT, 6, 0, 0}, {MOD_ACC, 6, 0, 0}, {MOD_RACC, 6, 0, 0}} }, --  Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
             {id = 45, items = {17756, 17962, 18596, 18760, 19112, 19215, 19271, 19156}, matches = 2, matchType = matchtype.weapon_weapon, mods = {{MOD_HP, 30, 0, 0}, {MOD_VIT, 6, 0, 0}, {MOD_ACC, 6, 0, 0}, {MOD_RACC, 6, 0, 0}} }, --  Paramount Earring Sets. Set Bonus: HP+30, VIT+6, Accuracy+6, Ranged Accuracy+6. Set Bonus is active with any 2 items(Earring+Weapon or Weapon+Weapon)
             
             {id = 49, items = {18761,18597,17757,19218,18128,18500,16004,18951}, matches = 2, matchType = matchtype.earring_weapon, mods = {{MOD_STR, 6, 0, 0}, {MOD_ATT, 4, 0, 0}, {MOD_RATT, 4, 0, 0}, {MOD_MATT, 2, 0, 0}} }, --  Supremacy Earring Sets. Set Bonus: STR+6, Attack+4, Ranged Attack+4, "Magic Atk. Bonus"+2. Active with any 2 items(Earring+Weapon)
             
             {id = 53, items = {16006,18450,18499,18861,18862,18952,19111,19217,19272}, matches = 2, matchType = matchtype.earring_weapon, mods = {{MOD_EVA, 10, 0, 0}, {MOD_HPHEAL, 10, 0, 0}, {MOD_ENMITY, -5, 0, 0}} }, --  Brilliant Earring Set. Set Bonus: Evasion, HP Recovered while healing, Reduces Emnity. Active with any 2 items(Earring+Weapon)
             {id = 56, items = {11798,11362}, matches = 2, matchType = matchtype.any, mods = {{MOD_RERAISE_III, 1, 0, 0}} },        -- Twilight Mail Set. Set Bonus: Auto-Reraise
             {id = 57, items = {18244,17595}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },        -- Begin Jailer weapons: Set is weapon + Virtue stone, bonus 50% extra melee swing.
             {id = 58, items = {18244,17710}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },
             {id = 59, items = {18244,17948}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },
             {id = 60, items = {18244,18100}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },
             {id = 61, items = {18244,18222}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },
             {id = 62, items = {18244,18360}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },
             {id = 63, items = {18244,18397}, matches = 2, matchType = matchtype.any, mods = {{MOD_AMMO_SWING, 50, 0, 0}} },        -- End Jailer weapons
        }
             -- increment id by (number of mods in previous gearset - 1)

--              {id, {item, ids, in, no, particular, order}, minimum matches required, match type, mods{id, value, modvalue for each additional match, additional whole set bonus}

local HipsterSets = {
    -- stick the ids of sets that need their own handling here e.g. Rubeus
    {id = 34, hipster = true}
}

-------------------------------------------
-- Checks for gear sets present on a player
-------------------------------------------
function checkForGearSet(player)
    -- print("---Removed existing gear set mods!---\n");
    player:clearGearSetMods();
    
    -- cause we dont want hundreds of function calls
    local equip = {};
    for slot = 0, MAX_SLOTID do
        equip[slot+1] = player:getEquipID(slot);
    end
    
    for index, gearset in pairs(GearSets) do
        local matches = 0;
        if (player:hasGearSetMod(gearset.id) == false) then
            local slot = 0;
            local gearMatch = {};
            
            for _, id in pairs(gearset.items) do
                for slot = 1, MAX_SLOTID do
                    local equipId = equip[slot];
                    
                    -- check the item matches
                    if (equipId == id) then
                        matches = matches + 1;
                        gearMatch[slot] = equipId;
                        break;
                    end
                end;
            end

            -- doesnt count as a match if the same item is in both slots
            if (gearMatch[SLOT_EAR1+1] == gearMatch[SLOT_EAR2+1] and gearMatch[SLOT_EAR1+1] ~= nil) then
                matches = matches - 1;
            end;
            if (gearMatch[SLOT_RING1+1] == gearMatch[SLOT_RING2+1] and gearMatch[SLOT_RING1+1] ~= nil) then
                matches = matches - 1;
            end;
            if (gearMatch[SLOT_MAIN+1] == gearMatch[SLOT_SUB+1] and gearMatch[SLOT_MAIN+1] ~= nil) then
                matches = matches - 1;
            end;

            if (matches >= gearset.matches) then
                if (FindMatchByType(gearset, gearMatch) == true) then
                    ApplyMod(player, gearset, matches)
                end
            end
        end
    end
end;

function FindMatchByType(gearset, gearMatch)
    if (gearset.matchType == matchtype.any) then
        return true;
    end

    for _, id in ipairs(gearMatch) do
        if (gearset.matchType == matchtype.earring_weapon and (gearMatch[SLOT_MAIN+1] ~= nil or gearMatch[SLOT_SUB+1] ~= nil) and (gearMatch[SLOT_EAR1+1] ~= nil or gearMatch[SLOT_EAR2+1] ~= nil)) then
            return true;
        elseif (gearset.matchType == matchtype.weapon_weapon and (gearMatch[SLOT_MAIN+1] ~= nil and gearMatch[SLOT_SUB+1] ~= nil)) then
            return true;
        end
    end
    
    return false;
end;

---------------------------------------
-- Applys a gear set mod
---------------------------------------
function ApplyMod(player, gearset, matches)

    for _, set in pairs(HipsterSets) do
        if (set.id == gearset.id) then
            HandleHipsterSet(player, gearset, matches);
            return;
        end
    end
    
    -- find any additional matches
    local addMatches = matches - gearset.matches;

    -- just in case some d00d decides to custom shit up and complain the script is b0rked
    if (addMatches < 0) then
        printf("shitbag check your code | gearset: %u", gearset.id);
        return;
    end;

    local i = 0;
    for _, mod in pairs(gearset.mods) do
        local modId = mod[1];
        local modValue = mod[2];
        
        -- value/multiplier for additional pieces
        local addMatchValue = mod[3];
        
        -- additional bonus for complete set
        local addSetBonus = 0;
        
        -- cause we need all pieces to form a complete set
        if (matches == #gearset.items) then
            addSetBonus = mod[4];
        end;
        
        -- add bonus mods per piece
        if (addMatches ~= 0 and addMatchValue ~= 0) then
            modValue = modValue + (addMatchValue * addMatches);
        end
        -- printf("gearset: %u, mod: %u, value %u", gearset.id, modId, modValue + addSetBonus);
        player:addGearSetMod(gearset.id + i, modId, modValue + addSetBonus);
        i = i + 1;
    end
    -- print("Gear set! Mod applied: ModNameId:" .. modNameId .. " ModId:" .. modId .. " Value:" .. modValue .. "\n");
end;

-- fkin hipsters
function HandleHipsterSet(player, gearset, matches)
    -- Rubeus Armor Set
    if (gearset.id == 34) then
        local modValue = 0;
        
        if (matches > 1 and matches < 4) then
            modValue = 4; -- 2 or 3 pieces
        elseif (matches > 3) then
            modValue = 10; -- 4 or 5 pieces
        end;
        -- printf("we have a special snowflake | gearset: %u | mod %u %u", gearset.id, MOD_FASTCAST, modValue);
        player:addGearSetMod(gearset.id, MOD_FASTCAST, modValue);
        return;
    end
end

--[[    Unimplemented sets below

=======
Stronghold NM(WOTG)
=======

-- Molione's Sickle Set
-------------
18947 -- Molione's Sickle
15818 -- Molione's Ring
-- Set Bonus: +5 Accuracy
-- Set Bonus: Enhances "Souleater" Effect

=======
Empyrean +2
=======

--Aoidos' Attire +2 Set
-------------
11073 -- Aoidos' Calot+2
11093 -- Aoidos' Hongreline +2
11113 -- Aoidos' Manchettes +2
11133 -- Aoidos' Rhingrave +2
11153 -- Aoidos' Cothurnes +2
-- Set Bonus: Augments Songs
-- Enhancing songs add an attribute bonus that corresponds to the element of the song (i.e. Thunder-based songs add +DEX). The attribute bonus begins at +1 for 2 pieces, increases by 1 for each additional piece, up to +5 for the whole set. For Dark-based songs, there is a bonus of +10 MP for 2 pieces, and increases by 10 for each additional piece.

--Ferine' Attire +2 Set
-------------
11072 -- Ferine Cabasset+2
11092 -- Ferine Gausape+2
11112 -- Ferine Manoplas+2
11132 -- Ferine Quijotes+2
11152 -- Ferine Ocreae+2
-- Set Bonus: Attack occ. varies with pet's HP
-- Occasionally increases damage in direct proportion to the percentage of pet's current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on.
-- 5% Proc Rate

--Goetia Attire +2 Set
-------------
11067 -- Goetia Petasos+2
11087 -- Goetia Coat+2
11107 -- Goetia Gloves+2
11127 -- Goetia Chausses+2
11147 -- Goetia Sabots+2
-- Set Bonus: Augments "Conserve MP"
-- Occasionally increases damage of elemental spells when Conserve MP is triggered. Increased amount is proportional to twice the ratio of MP conserved.

--Mavi Attire +2 Set
-------------
11079 -- Mavi Kavuk+2
11099 -- Mavi Mintan+2
11119 -- Mavi Bazubands+2
11139 -- Mavi Tayt+2
11159 -- Mavi Basmak+2
-- Set Bonus: Occ. augments blue magic spells.
-- no damn clue!


--Bale Armor +2 Set
-------------
11071 -- Bale Burgeonet+2
11091 -- Bale Cuirass+2
11111 -- Bale Gauntlets+2
11131 -- Bale Flanchard+2
11151 -- Bale Sollerets+2
-- Set Bonus: Attack occasionally varies with HP
-- Occasionally increases damage in direct proportion to the percentage of current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on.

--Lancer's Armor +2 Set
-------------
11077 -- Lancer's Mezail+2
11097 -- Lancer's Plackart+2
11117 -- Lancer's Vambrace+2
11137 -- Lancer's Cuissots+2
11157 -- Lancer's Schynbalds+2
-- Set Bonus: Attack occasionally varies with wyvern's HP.
-- Damage increases proportionate to Wyvern's HP, at 100%, damage is doubled. 2+ pieces required, more pieces increase proc rate. Full +2 set is about a 10% proc rate. (Confirmation needed)


--Cirque Attire +2 Set
-------------
11081 -- Cirque Capello+2
11101 -- Cirque Farsetto+2
11121 -- Cirque Gaunti+2
11141 -- Cirque Pantaloni+2
11161 -- Cirque Scarpe+2
-- Set Bonus: Attack occasionally varies with automaton's HP.
-- Occasionally increases damage in direct proportion to the percentage of Automaton's current HP. At 100% HP, damage is doubled when triggered, at 50% HP, damage increases by 50%, and so on.

--Estoqueur's Attire +2 Set
-------------
11068 -- Estoqueur's Chappel+2
11088 -- Estoqueur's Sayon+2
11108 -- Estoqueur's Gantherots+2
11128 -- Estoqueur's Fuseau+2
11148 -- Estoqueur's Houseaux+2
-- Set Bonus: Augments "Composure"
-- Enhances duration of Enhancing Magic cast on OTHERS while under the effect of Composure by 10% for the first 2 pieces, and 15% for any additional pieces thereafter, up to 35% increase for 4 pieces and 50% for all 5 pieces. The "Increases enhancing magic effect duration" of the Estoqueur's Cape, Estoqueur's Houseaux +1 and Estoqueur's Houseaux +2 is multiplicative to this total.

--Caller's Attire +2 Set
-------------
11078 -- Caller's Horn+2
11098 -- Caller's Doublet+2
11118 -- Caller's Bracers+2
11138 -- Caller's Spats+2
11158 -- Caller's Pigaches+2
-- Set Bonus: Augments "Blood Boon"
-- Occasionally increases damage of Blood Pacts when Blood Boon is triggered. Increased amount is proportional to the ratio of MP conserved.

]]--
