-----------------------------------
--  Area: Windurst Waters
--   NPC: Olaky-Yayulaky
--  Type: Item Depository
--  !zone 238
--  !pos -61.247 -4.500 72.551
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");

StorageTable = {
-- Furnishings I
    [1000] = {item = 86, maskbit = 0},  -- San dOrian Tree
    [1001] = {item = 115, maskbit = 1},  -- Bastokian Tree
    [1002] = {item = 116, maskbit = 2},  -- Windurstian Tree
    [1003] = {item = 87, maskbit = 3},  -- Kadomatsu
    [1004] = {item = 117, maskbit = 4},  -- Wing Egg
    [1005] = {item = 118, maskbit = 5},  -- Lamp Egg
    [1006] = {item = 119, maskbit = 6},  -- Flower Egg
    [1007] = {item = 193, maskbit = 7},  -- Adventuring Certificate
    [1008] = {item = 88, maskbit = 8},  -- Timepiece
    [1009] = {item = 154, maskbit = 9},  -- Miniature Airship
    [1010] = {item = 204, maskbit = 10},  -- Pumpkin Lantern
    [1011] = {item = 203, maskbit = 11},  -- Bomb Lantern
    [1012] = {item = 205, maskbit = 12},  -- Mandragora Lantern
    [1013] = {item = 140, maskbit = 13},  -- Dream Platter
    [1014] = {item = 141, maskbit = 14},  -- Dream Coffer
    [1015] = {item = 155, maskbit = 15},  -- Dream Stocking
    [1064] = {item = 192, maskbit = 16},  -- Horay Spire
    [1065] = {item = 179, maskbit = 17},  -- Jeweled Egg
    [1066] = {item = 323, maskbit = 18},  -- Red Bamboo Grass
    [1067] = {item = 324, maskbit = 19},  -- Blue Bamboo Grass
    [1068] = {item = 325, maskbit = 20},  -- Green Bamboo Grass
    [1069] = {item = 176, maskbit = 21},  -- Snowman Knight
    [1070] = {item = 177, maskbit = 22},  -- Snowman Miner
    [1071] = {item = 178, maskbit = 23},  -- Snowman Mage
    [1072] = {item = 180, maskbit = 24},  -- Bonbori
    [1073] = {item = 215, maskbit = 25},  -- Festival Dolls
    [1074] = {item = 196, maskbit = 26},  -- Melodious Egg
    [1075] = {item = 197, maskbit = 27},  -- Clockwork Egg
    [1076] = {item = 199, maskbit = 28},  -- Hatchling Egg
    [1077] = {item = 320, maskbit = 29},  -- Harpsichord
    [1078] = {item = 415, maskbit = 30},  -- Aldebaran Horn
-- Weapons
    [2016] = {item = 17074, maskbit = 0},  -- Chocobo Wand
    [2017] = {item = 17565, maskbit = 1},  -- Trick Staff
    [2018] = {item = 17566, maskbit = 2},  -- Treat Staff
    [2019] = {item = 17588, maskbit = 3},  -- Treat Staff II
    [2020] = {item = 17830, maskbit = 4},  -- Wooden Katana
    [2021] = {item = 17831, maskbit = 5},  -- Hardwood Katana
    [2022] = {item = 18102, maskbit = 6},  -- Pitchfork
    [2023] = {item = 18103, maskbit = 7},  -- Pitchfork +1
    [2024] = {item = 18400, maskbit = 8},  -- Charm Wand +1
    [2025] = {item = 18436, maskbit = 9},  -- Lotus Katana
    [2026] = {item = 18401, maskbit = 10},  -- Moogle Rod
    [2027] = {item = 18846, maskbit = 11},  -- Battledore
    [2028] = {item = 18845, maskbit = 12},  -- Miracle Wand +1
    [2029] = {item = 18441, maskbit = 13},  -- Shinai
    [2030] = {item = 17748, maskbit = 14},  -- Ibushi Shinai
    [2031] = {item = 17749, maskbit = 15},  -- Ibushi Shinai +1
    [2092] = {item = 16182, maskbit = 16},  -- Town Moogle Shield
    [2093] = {item = 16183, maskbit = 17},  -- Nomad Moogle Shield
    [2094] = {item = 18863, maskbit = 18},  -- Dream Bell
    [2095] = {item = 18864, maskbit = 19},  -- Dream Bell +1
-- Armor - Head
    [3032] = {item = 13916, maskbit = 0},  -- Pumpkin Head
    [3033] = {item = 13917, maskbit = 1},  -- Horror Head
    [3034] = {item = 15176, maskbit = 2},  -- Pumpkin Head II
    [3035] = {item = 15177, maskbit = 3},  -- Horror Head II
    [3036] = {item = 15178, maskbit = 4},  -- Dream Hat
    [3037] = {item = 15179, maskbit = 5},  -- Dream Hat +1
    [3038] = {item = 15198, maskbit = 6},  -- Sprout Beret
    [3039] = {item = 15199, maskbit = 7},  -- Guide Beret
    [3040] = {item = 15204, maskbit = 8},  -- Mandragora Beret
    [3041] = {item = 16075, maskbit = 9},  -- Witch Hat
    [3042] = {item = 16076, maskbit = 10},  -- Coven Hat
    [3043] = {item = 16109, maskbit = 11},  -- Egg Helm
    [3044] = {item = 16118, maskbit = 12},  -- Moogle Cap
    [3045] = {item = 16119, maskbit = 13},  -- Nomad Cap
    [3046] = {item = 16120, maskbit = 14},  -- Redeyes
    [3047] = {item = 16144, maskbit = 15},  -- Sol Cap
    [3080] = {item = 16145, maskbit = 16},  -- Lunar Cap
    [3081] = {item = 11491, maskbit = 17},  -- Snow Bunny Hat +1
    [3082] = {item = 11500, maskbit = 18},  -- Chocobo Beret
--  Armor - Body, Legs, Feet
    [4048] = {item = 13819, maskbit = 0},  -- Onoko Yukata
    [4049] = {item = 13821, maskbit = 1},  -- Lord's Yukata
    [4050] = {item = 14452, maskbit = 2},  -- Elvaan Gilet
    [4051] = {item = 14459, maskbit = 3},  -- Elvaan Gilet +1
    [4052] = {item = 15410, maskbit = 4},  -- Elvaan Trunks
    [4053] = {item = 15417, maskbit = 5},  -- Elvaan Trunks +1
    [4054] = {item = 14519, maskbit = 6},  -- Dream Robe
    [4055] = {item = 14520, maskbit = 7},  -- Dream Robe +1
    [4056] = {item = 14532, maskbit = 8},  -- Otoko Yukata
    [4057] = {item = 14534, maskbit = 9},  -- Otokogimi Yukata
    [4058] = {item = 15752, maskbit = 10},  -- Dream Boots
    [4059] = {item = 15753, maskbit = 11},  -- Dream Boots +1
    [4060] = {item = 11267, maskbit = 12},  -- Magna Gilet
    [4061] = {item = 11275, maskbit = 13},  -- Magna Gilet +1
    [4062] = {item = 16323, maskbit = 14},  -- Magna Trunks
    [4063] = {item = 16331, maskbit = 15},  -- Magna Trunks +1
    [4084] = {item = 11300, maskbit = 16},  -- Erie Cloak
    [4085] = {item = 11301, maskbit = 17},  -- Erie Cloak +1
    [4086] = {item = 11290, maskbit = 18},  -- Tidal Talisman
    [4087] = {item = 11316, maskbit = 19},  -- Otokogusa Yukata
    [4088] = {item = 11318, maskbit = 20},  -- Otokoeshi Yukata
    [4126] = {item = 11355, maskbit = 21},  -- Dinner Jacket
    [4127] = {item = 16378, maskbit = 22},  -- Dinner Hose
-- Furnishing II
    [6096] = {item = 264, maskbit = 0},  -- Stuffed Chocobo
    [6097] = {item = 455, maskbit = 1},  -- Egg Buffet
    [6098] = {item = 265, maskbit = 2},  -- Adamantoise Statue
    [6099] = {item = 266, maskbit = 3},  -- Behemoth Statue
    [6100] = {item = 267, maskbit = 4},  -- Fafnir Statue
    [6101] = {item = 456, maskbit = 5},  -- Pepo Lantern
    [6102] = {item = 457, maskbit = 6},  -- Cushaw Lantern
    [6103] = {item = 458, maskbit = 7},  -- Calabazilla Lantern
    [6104] = {item = 138, maskbit = 8},  -- Jeunoan Tree
    [6105] = {item = 269, maskbit = 9},  -- Shadow Lord Statue
    [6106] = {item = 3641, maskbit = 10},  -- Kabuto-Kazari
    [6107] = {item = 3642, maskbit = 11},  -- Katana-Kazari
    [6108] = {item = 270, maskbit = 12},  -- Odin Statue
    [6109] = {item = 271, maskbit = 13},  -- Alexander Statue
    [6110] = {item = 3643, maskbit = 14},  -- Carillons Vermeil
    [6111] = {item = 3644, maskbit = 15},  -- Aeolsglockes
    [6112] = {item = 3645, maskbit = 16},  -- Leafbell
    [6113] = {item = 181, maskbit = 17},  -- San dOrian Flag
    [6114] = {item = 182, maskbit = 18},  -- Bastokan Flag
    [6115] = {item = 183, maskbit = 19},  -- Windurstian Flag
    [6116] = {item = 3622, maskbit = 20},  -- Jack O Pricket
    [6117] = {item = 3623, maskbit = 21},  -- Djinn Pricket
    [6118] = {item = 3624, maskbit = 22},  -- Korrigan Pricket
    [6119] = {item = 3646, maskbit = 23},  -- Mandagora Pricket
}

function onTrade(player,npc,trade)
    local furnishingsI = player:getVar("[Storage]Furnishings I");
    local weapons = player:getVar("[Storage]Weapons");
    local armorHead = player:getVar("[Storage]Armor-Head");
    local armorBody = player:getVar("[Storage]Armor-Body");
    local furnishingsII = player:getVar("[Storage]Furnishings II");

    for i,v in pairs(StorageTable) do
        if (trade:hasItemQty(v.item,1) and trade:getItemCount() == 1) then
            if (i >= 6000 and i < 7000 and player:getMaskBit(furnishingsII,v.maskbit) == false) then
                player:startEvent(909, v.item);
                player:setMaskBit(furnishingsII,"[Storage]Furnishings II",v.maskbit,true);
            elseif (i >= 4000 and i < 5000 and player:getMaskBit(armorBody,v.maskbit) == false) then
                player:startEvent(909, v.item);
                player:setMaskBit(armorBody,"[Storage]Armor-Body",v.maskbit,true);
            elseif (i >= 3000 and i < 4000 and player:getMaskBit(armorHead,v.maskbit) == false) then
                player:startEvent(909, v.item);
                player:setMaskBit(armorHead,"[Storage]Armor-Head",v.maskbit,true);
            elseif (i >= 2000 and i < 3000 and player:getMaskBit(weapons,v.maskbit) == false) then
                player:startEvent(909, v.item);
                player:setMaskBit(weapons,"[Storage]Weapons",v.maskbit,true);
            elseif (i >= 1000 and i < 2000 and player:getMaskBit(furnishingsI,v.maskbit) == false) then
                player:startEvent(909, v.item);
                player:setMaskBit(furnishingsI,"[Storage]Furnishings I",v.maskbit,true);
            end
        end
    end
end;

function onTrigger(player,npc)
    local furnishingsI = player:getVar("[Storage]Furnishings I");
    local weapons = player:getVar("[Storage]Weapons");
    local armorHead = player:getVar("[Storage]Armor-Head");
    local armorBody = player:getVar("[Storage]Armor-Body");
    local furnishingsII = player:getVar("[Storage]Furnishings II");

    player:startEvent(910,furnishingsI,weapons,armorHead,armorBody,0,furnishingsII);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    local furnishingsI = player:getVar("[Storage]Furnishings I");
    local weapons = player:getVar("[Storage]Weapons");
    local armorHead = player:getVar("[Storage]Armor-Head");
    local armorBody = player:getVar("[Storage]Armor-Body");
    local furnishingsII = player:getVar("[Storage]Furnishings II");

    if (csid == 909) then
        player:tradeComplete();
    elseif (csid == 910) then
        for i,v in pairs(StorageTable) do
            if (option == i - 1000) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,v.item);
                else
                    player:addItem(v.item,1);
                    player:messageSpecial(ITEM_OBTAINED,v.item);
                    player:setMaskBit(furnishingsI,"[Storage]Furnishings I",v.maskbit,false);
                    player:delGil(250);
                end
            elseif (option == i - 2000) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,v.item);
                else
                    player:addItem(v.item,1);
                    player:messageSpecial(ITEM_OBTAINED,v.item);
                    player:setMaskBit(weapons,"[Storage]Weapons",v.maskbit,false);
                    player:delGil(250);
                end
            elseif (option == i - 3000) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,v.item);
                else
                    player:addItem(v.item,1);
                    player:messageSpecial(ITEM_OBTAINED,v.item);
                    player:setMaskBit(armorHead,"[Storage]Armor-Head",v.maskbit,false);
                    player:delGil(250);
                end
            elseif (option == i - 4000) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,v.item);
                else
                    player:addItem(v.item,1);
                    player:messageSpecial(ITEM_OBTAINED,v.item);
                    player:setMaskBit(armorBody,"[Storage]Armor-Body",v.maskbit,false);
                    player:delGil(250);
                end
            elseif (option == i - 6000) then
                if (player:getFreeSlotsCount() == 0) then
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,v.item);
                else
                    player:addItem(v.item,1);
                    player:messageSpecial(ITEM_OBTAINED,v.item);
                    player:setMaskBit(furnishingsII,"[Storage]Furnishings II",v.maskbit,false);
                    player:delGil(250);
                end
            end
        end
    end
end;