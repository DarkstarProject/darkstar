------------------------------------------------------------------------------------------
--  Mining 2.0
--  Note: When implementing new zones, ensure there are more mining point locations
--  than there are mining points for the zone.
------------------------------------------------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/utils");

-- Note: All drops are weights, these are /not/ percentages.

local extracted =
{
    --[[
    How to:

    [zoneID] = -- zone name
    {
        {itemRate, itemID} -- item name
    }

    ]]

    [11] = -- Oldton
    {
        {1150, 1654}, -- 11.50% Igneous Rock
        {1130, 642},  -- 11.30% Zinc Ore
        {1100, 640},  -- 11.00% Copper Ore
        {1080, 641},  -- 10.80% Tin Ore
        {1050, 736},  -- 10.50% Silver Ore
        {970, 643},  -- 9.70% Iron Ore
        {680, 1632}, -- 6.80% Moblin Mail
        {630, 1625}, -- 6.30% Moblin Helm
        {600, 1638}, -- 6.00% Moblin Mask
        {570, 568},  -- 5.70% Goblin Die
        {570, 1631}, -- 5.70% Moblin Armor
        {80, 645},  -- 0.80% Darksteel Ore
        {80, 644},  -- 0.80% Mythril Ore
        {70, 737},  -- 0.70% Gold Ore
        {70, 738}   -- 0.70% Platium Ore
    },
    [12] = -- Newton
    {
        {1660, 640},  -- 16.60% Copper Ore
        {1170, 641},  -- 11.70% Tin Ore
        {1450, 642},  -- 14.50% Zinc Ore
        {1790, 1654}, -- 17.90% Igneous Rock
        {1450, 736},  -- 14.50% Silver Ore
        {140, 678},  -- 1.40% Aluminum Ore
        {1720, 643},  -- 17.20% Iron Ore
        {70, 645},  -- 0.70% Darksteel Ore
        {210, 644},  -- 2.10% Mythril Ore
        {140, 737},  -- 1.40% Gold Ore
        {340, 738},   -- 3.40% Platium Ore
        {70, 769} -- 0.70% Colored Rock
    },
    [61] = -- Mount Zhayolm
    {
        {2250, 1108}, -- 22.50% Pinch of Sulfur
        {2990, 643},  -- 29.90% Iron Ore
        {1590, 1155}, -- 15.90% Iron Sand
        {1540, 768},  -- 15.40% Flint Stone
        {1340, 928},  -- 13.40% Bomb Ash
        {960, 1632}, -- 9.60% Moblin Mail
        {1150, 1625}, -- 11.50% Moblin Helm
        {450, 1631}, -- 4.50% Moblin Armor
        {380, 2160}, -- 3.80% Troll Pauldron
        {450, 2161}, -- 4.50% Troll Vambrace
        {430, 1638}, -- 4.30% Moblin Mask
        {210, 902},  -- 2.10% Demon Horn
        {140, 646},  -- 1.40% Adaman Ore
        {30, 685}   -- 0.30% Khroma Ore
--      {1560, 2860} -- 15.60% Slab of Plumbago quest item
    },
    [62] = -- Halvung
    {
        {2010, 2417}, -- 20.10% Aht Urhgan Brass
        {1000, 928},  -- 10.00% Bomb Ash
        {1720, 768},  -- 17.20% Flint Stone
        {290, 737},  -- 2.90% Gold Ore
        {1440, 1155}, -- 14.40% Iron Sand
        {50, 2228}, -- 0.50% Luminium Ore
        {430, 1631}, -- 4.30% Moblin Armor
        {430, 1625}, -- 4.30% Moblin Helm
        {480, 1632}, -- 4.80% Moblin Mail
        {290, 1638}, -- 2.90% Moblin Mask
        {100, 739},  -- 1.00% Orichalcum Ore
        {1200, 1108}, -- 12.00% Pinch of Sulfur
        {480, 2160}, -- 4.80% Troll Pauldron
        {330, 2161}  -- 3.30% Troll Vambrace
    },
    [88] = -- North Gustaberg [S]
    {
        {1870, 640},   -- 18.70% Copper Ore
        {1930, 642},   -- 19.30% Zinc Ore
        {1500, 641},   -- 15.00% Tin Ore
        {1340, 17296}, -- 13.40% Pebble
        {860, 736},   -- 8.60% Silver Ore
        {1180, 643},   -- 11.80% Iron Ore
        {750, 644},   -- 7.50% Mythril Ore
        {50, 1631},  -- 0.50% Moblin Armor
        {110, 1625},  -- 1.10% Moblin Helm
        {110, 1632},  -- 1.10% Moblin Mail
        {210, 1638},  -- 2.10% Moblin Mask
        {160, 738},   -- 1.60% Platium Ore
    },
    [142] = -- Yughott Grotto
    {
        {1460, 640},   -- 14.60% Copper Ore
        {1650, 643},   -- 16.50% Iron Ore
        {1300, 641},   -- 13.00% Tin Ore
        {1140, 17296}, -- 11.40% Pebble
        {1320, 642},   -- 13.20% Zinc Ore
        {840, 768},   -- 8.40% Flint Stone
        {360, 736},   -- 3.60% Silver Ore
        {170, 769},   -- 1.70% Colored Rock
        {150, 645},   -- 1.50% Darksteel Ore
        {110, 737}    -- 1.10% Gold Ore
    },
    [143] = -- Palborough Mines
    {
        {1130, 642},   -- 11.30% Zinc Ore
        {940, 643},   -- 9.40% Iron Ore
        {1040, 17296}, -- 10.40% Pebble
        {970, 641},   -- 9.70% Tin Ore
        {900, 644},   -- 9.00% Mythril Ore
        {900, 736},   -- 9.00% Silver Ore
        {800, 640},   -- 8.00% Copper Ore
        {100, 738}    --  1.00% Platium Ore
--      {1670, 0} -- 16.70% metal strip quest key item
    },
    [172] = -- Zeruhn Mines
    {
        {2450, 643},   -- 24.50% Iron Ore
        {1800, 17296}, -- 18.00% Pebble
        {1850, 640},   -- 18.50% Copper Ore
        {1330, 642},   -- 13.30% Zinc Ore
        {1120, 641},   -- 11.20% Tin Ore
        {550, 1984},  -- 5.50% Snapping Mole
        {180, 736},   -- 1.80% Silver Ore
        {40, 645}    -- 0.40% Darksteel Ore
--      {1670, 0} -- 16.70% metal strip quest key item
    },
    [196] = -- Gusgen Mines
    {
        {1890, 17296}, -- 18.90% Pebble
        {1670, 642},   -- 16.70% Zinc Ore
        {1510, 640},   -- 15.10% Copper Ore
        {1470, 641},   -- 14.70% Tin Ore
        {1450, 643},   -- 14.50% Iron Ore
        {810, 736},   -- 8.10% Silver Ore
        {590, 645},   -- 5.90% Darksteel Ore
        {400, 769},   -- 4.00% Colored Rock
        {80, 737},   -- 0.80% Gold Ore
--      {1670, 0} -- 16.70% metal strip quest key item
    },
    [205] = -- Ifrit's Cauldron
    {
        {3260, 768},   -- 32.60% Flint Stone
        {1520, 643},   -- 15.20% Iron Ore
        {430, 1108},  -- 4.30% Pinch of Sulfur
        {650, 17316}, -- 6.50% Bomb Arm
        {870, 928},   -- 8.70% Bomb Ash
        {1300, 1155},  -- 13.00% Iron Sand
        {250, 646},   -- 2.50% Adaman Ore
        {600, 645},   -- 6.00% Darksteel Ore
        {100, 2126},  -- 1.00% Orpiment
        {100, 739},   -- 1.00% Orichalcum Ore
        {400, 769}    -- 4.00% Colored Rock
--      {1670, 0} -- 16.70% metal strip quest key item
    }
}

local coordinates =
{
    [62] = -- Halvung
    {
        {66.042, -12.557, 268.774},
        {69.479, -10.050, 192.499},
        {100.407, -0.797, 340.620},
        {121.501, -10.189, 147.314},
        {138.668, 10.290, 10.545},
        {149.589, -1.720, 309.317},
        {172.185, -0.147, 326.037},
        {204.065, -5.658, 186.315},
        {205.485, 14.006, 251.853},
        {226.012, -6.200, 215.825},
        {226.221, -6.477, 149.596},
        {270.880, 2.490, 226.690}
    },
    [88] = -- North Gustaberg S
    {
        {356.020, -20.000, 406.790},
        {287.787, -20.228, 369.698},
        {201.170, -20.000, 405.664},
        {146.707, -19.500, 455.306},
        {157.439, -20.374, 354.538},
        {237.286, -20.364, 314.656},
        {387.755, -38.161, 501.771},
        {285.748, -40.397, 397.697},
        {156.690, -40.695, 473.991},
        {271.057, -40.264, 590.023},
        {277.426, -60.351, 565.171},
        {299.677, -59.805, 475.753},
        {337.342, -11.571, 858.621},
        {361.736, -23.443, 951.366},
        {376.297, -31.999, 1100.808},
        {238.267, -23.470, 1048.692},
        {191.347, -2.002, 852.134},
        {118.374, -3.426, 768.587}
    },
    [11] = -- Oldton
    {
        {-328.808, -2.267, 297.294},
        {-134.148, 7.542, 56.625},
        {-133.856, 11.649, -148.462},
        {-263.138, 2.146, 99.091},
        {-105.935, 7.780, 99.428},
        {-26.393, 11.359, -141.096},
        {-165.574, 6.665, 217.462},
        {-31.868, 13.631, -17.028},
        {-26.393, 11.359, -141.096}
    },
    [142] = -- Yughott Grotto Mining Point Locations
    {
        {-272.354, -0.3776, -78.058},
        {-228.294, -0.489, -81.363},
        {-223.309, -1.093, -113.619},
        {-143.448, -1.167, -98.597},
        {-122.534, -0.804, -5.241},
        {-86.338, -1.193, -44.873},
        {-72.226, -1.698, -28.054},
        {-32.732, -0.913, -8.172},
        {-25.004, -1.122, 30.867},
        {3.583, -1.008, 32.429},
        {-16.487, -1.134, -62.732},
        {69.95494, -3.218817, 27.7812},
        {156.483, -12.978, 46.661},
        {211.71, -12.666, 42.001},
        {178.237, -13.099, 135.117},
        {310.232, -24.639, 161.209},
        {363.273, -24.758, 164.485},
        {330.931, -24.900, 239.451}
    },
    [205] = -- Ifrit's Cauldron Mining Point Locations
    {
        {139.082, 3.224, -61.040},
        {41.822, -0.888, -24.337},
        {-73.008, -0.541, -96.456},
        {-144.081, 16.047, -177.289},
        {-190.9837, 0.4465082, -183.3414},
        {-103.5138, -0.4741323, -61.05524},
        {-98.921, -1.524, -16.917},
        {-109.204, 17.7227, 24.88388},
        {-129.5698, 38.26331, 83.38991},
        {-221.9931, 38.79238, 109.9998},
        {-3.945, 9.675, 95.107},
        {47.35144, 8.44986, 96.10957},
        {-11.72499, 6.155578, 175.3738},
        {92.61575, 19.22635, -5.734488},
        {95, 0, 25},
        {-101.8463, -0.4984876, 61.31176},
        {-59.3724, -0.5520002, 60.08635},
        {27.931, -2.754, 50.856},
        {69, -2, 27}
    },
    [196] = -- Gusgen Mines Mining Point Locations
    {
        {92.931, -60.659, -224.312},
        {71.523, -60.258, -174.060},
        {-31.427, -59.573, -175.516},
        {-10.364, -40.028, -84.169},
        {-137.089, -40.658, 150.613},
        {-64.416, -40.104, 253.775},
        {-161.341, -24.382, 222.992},
        {-100, -1, 250},
        {-172.555, -0.330, 303.216},
        {-171.214, -0.100, 376.661},
        {50.340, -40.372, 194.160},
        {101.177, -41.041, 211.026},
        {148.491, -41.24373, 21.239},
        {156, -20, 217},
        {-145.420, -28.425, 326.760},
        {27.651, -40.074, 62.101},
        {40.462, -55.042, -109.230},
        {-26.623, -60.805, -141.508}
    },
    [172] = -- Zeruhn Mines Mining Point Locations
    {
        {14.464, 7.335, -50.905},
        {-52.187, 7.880, -103.336},
        {-58.286, 7.385, -134.010},
        {-57.078, 7.436, -150.588},
        {-50.801, 7.795, -178.933},
        {-91.345, 8.038, -218.532},
        {-27.681, 7.125, -267.218},
        {14.427, 7.201, -290.626},
        {-87.426, 7.436, -333.037},
        {1.854, 8.113, -176.282},
        {69.255, 7.715, -254.356},
        {53.561, 7.657, -272.379},
        {126.523, 7.790, -186.639},
        {133.683, 7.793, -208.722},
        {133.975, 7.184, -131.237},
        {16.606, 8.071, -119.420},
        {52.669, 6.997, -107.651},
        {66.074, 7.700, -151.352}
    },
    [143] = -- Palborough Mines
    {
        {-68.388, -7.680, 188.517},
        {133.693, -0.063, 167.560},
        {223.246, -11.863, 185.263},
        {212.670, -0.778, 106.979},
        {186.116, -15.432, 6.930},
        {-68.142, -16.709, 250.590},
        {-48.409, -17.077, 227.142},
        {152.190, -16.394, 142.365},
        {228.671, -17.235, 252.867},
        {269.089, -16.414, 184.921},
        {290.244, -15.718, 104.856},
        {306.015, -16.275, 49.876},
        {248.551, -32.293, 174.045},
        {266.499, -32.401, -71.379},
        {22.365, -32.317, 82.608},
        {20.628, -32.528, -88.682},
        {60.347, -32.908, -19.361},
        {104.773, -32.418, 82.766}
    },
    [12] = -- Newton Movalpolos
    {
        {69.433, 19.221, 185.247},
        {-40.404, 15.131, 223.666},
        {-40.404, 15.131, 223.666},
        {-103.572, 15.108, 91.212},
        {26.597, 15.204, 21.926},
        {26.597, 15.204, 21.926}
    }
}

local miningpoints =
{
    [11] =  {16822525, 16822526, 16822527, 16822528, 16822529, 16822530}, -- Oldton
    [12] =  {16826621, 16826622, 16826623, 16826624, 16826625, 16826626}, -- Newton
    [61] =  {17027559, 17027560, 17027561, 17027562, 17027563, 17027564}, -- Mount Zhayolm
    [62] =  {17031715, 17031716, 17031717, 17031718, 17031719, 17031720}, -- Halvung
    [88] =  {17138511, 17138512, 17138513, 17138514, 17138515, 17138516}, -- Gustaberg[S]
    [142] = {17359053, 17359054, 17359055, 17359056, 17359057, 17359058}, -- Yughott
    [143] = {17363365, 17363366, 17363367, 17363368, 17363369, 17363370}, -- Palborough
    [172] = {17481838, 17481839, 17481840, 17481841, 17481842, 17481843}, -- Zeruhn
    [196] = {17580397, 17580398, 17580399, 17580400, 17580401, 17580402}, -- Gusgen
    [205] = {17617225, 17617226, 17617227, 17617228, 17617229, 17617230} -- Ifrit's Cauldron
}

local rocks = {769, 770, 771, 772, 773, 774, 776, 775};

-------------------------------------------------
-- Perform the mining action.
-------------------------------------------------

function startMining(player, zone, npc, trade, cutsceneId)
    -- Check that the user has a pickaxe, and has traded a single one.
    if (trade:hasItemQty(605, 1) and trade:getItemCount() == 1) then
        local broken = pickaxeBreak(player, trade);
        local item = getMiningItem(player, zone);
        local full = (player:getFreeSlotsCount() == 0 and 1 or 0);
        local hitCount = npc:getLocalVar("HIT_COUNT") - 1;
        --printf("Mining: full: %s, item: %s, hitCount: %s, id: %s", full, item, hitCount, npc);
        if (item ~= 0) then
            if (hitCount == -1) then -- hits will only ever be -1 after a server reset.
                hitCount = math.random(4, 5);
            end
            if (hitCount == 0) then
                moveMiningPoint(player, npc, zone);
            end;
        end
        --printf("Mining: setting hitcount to %s, id: %s", hitCount, npc);

        -- Mining event
        player:startEvent(cutsceneId, item, broken, full);

        -- If we are full, or there was no item found, we don't use up a "hit", so don't log the hit
        -- or attempt to reward the item.
        if (item ~= 0 and full == 0) then
            -- Update the hit count on the mining point.
            npc:setLocalVar("HIT_COUNT", hitCount);
            player:addItem(item);
        end;
    end;
end;

-------------------------------------------------
-- Determine if the pickaxe breaks.
-------------------------------------------------

function pickaxeBreak(player, trade)
    local broke = 0;
    local pickbreak = math.random();

    pickbreak = pickbreak + (player:getMod(dsp.mod.MINING_RESULT) / 1000);

    if (pickbreak < MINING_BREAK_CHANCE) then
        broke = 1;
        player:tradeComplete();
    end

    return broke;
end;

-------------------------------------------------
-- Determine the obtained item.
-------------------------------------------------

function getMiningItem(player, zone)
    -- declare the winning item!
    local item = 0;
    if (math.random(0, 100) >= MINING_RATE) then
        -- no item
        return item;
    end;

    -- Get the drop array from the master drops array.
    local drops = extracted[zone];

    -- Get the total of all drop weights
    -- {rate, item}
    local total = 0;
    for i=1, #drops do
        total = total+drops[i][1] -- [1] = rate, [2] = item
    end;

    --printf("Total: %s", total);

    -- Get a random number that will determine the drop from the array.
    local tickerStop = math.random(1, total);

    local countPosition = 0;
    -- find out the winning item from the drops array.
    for i=1, #drops do
        countPosition = countPosition+drops[i][1]; -- [1] = rate, [2] = item
        if (countPosition >= tickerStop) then
            item = drops[i][2]; -- [1] = rate, [2] = item
            break;
        end;
    end;

    --printf("Item: %s", item);

    -- if the item was a coloured rock, turn it into the appropriate element
    local day = VanadielDayElement();
    if (item == 769) then
        item = rocks[day+1];
    end;

    return item;
end;

-------------------------------------------------
-- Moves mining point.
-------------------------------------------------

function moveMiningPoint(player, npc, zone)

    local positions = utils.shuffle(coordinates[zone]);
    local points = miningpoints[zone];
    local newIndex = -1;

    if (positions ~= nil) then
        -- Generate a list of used indexes for all mining points in this zone.
        for i, p in ipairs(points) do -- loop through all mining points
            for c, v in ipairs(positions) do -- find index of this specific point
                local currentnpc = GetNPCByID(p)
                if (math.floor(v[1]) == math.floor(currentnpc:getXPos()) and
                    math.floor(v[2]) == math.floor(currentnpc:getYPos()) and
                    math.floor(v[3]) == math.floor(currentnpc:getZPos())) then
                        table.remove(positions, c);
                end
            end
        end
        newIndex = math.random(1, #positions)
    end

    if (newIndex == -1) then
        npc:setLocalVar("HIT_COUNT", math.random(4, 6));
        npc:hideNPC(300);
        --printf("Couldn't find this mining points current index! Hiding for 5 minutes");
    else
        local position = positions[newIndex];
        npc:setLocalVar("HIT_COUNT", math.random(4, 6));
        npc:hideNPC(120);
        npc:queue(3000, doMove(npc, position[1], position[2], position[3]));
    end
end;

-------------------------------------------------
-- Perform node move after queue timer depletes.
-------------------------------------------------

function doMove(npc, x, y, z, zone)
    return function(entity)
        entity:setPos(x, y, z, 0);
    end;
end;
