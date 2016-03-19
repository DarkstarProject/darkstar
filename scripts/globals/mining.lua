------------------------------------------------------------------------------------------
--  Mining 2.0
--  Note: When implementing new zones, ensure there are more mining point locations
--  than there are mining points for the zone.
------------------------------------------------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/utils");

-- Note: All drops are weights, these are /not/ percentages.

local extracted = {
    [11] = { -- Oldton
        {1150,0x0676}, -- 11.50% Igneous Rock
        {1130,0x0282}, -- 11.30% Zinc Ore
        {1100,0x0280}, -- 11.00% Copper Ore
        {1080,0x0281}, -- 10.80% Tin Ore
        {1050,0x02E0}, -- 10.50% Silver Ore
        {0970,0x0283}, -- 9.70% Iron Ore
        {0680,0x0660}, -- 6.80% Moblin Mail
        {0630,0x0659}, -- 6.30% Moblin Helm
        {0600,0x0666}, -- 6.00% Moblin Mask
        {0570,0x0238}, -- 5.70% Goblin Die
        {0571,0x065F}, -- 5.70% Moblin Armor
        {0080,0x0285}, -- 0.80% Darksteel Ore
        {0081,0x0284}, -- 0.80% Mythril Ore
        {0070,0x02E1}, -- 0.70% Gold Ore
        {0071,0x02E2} -- 0.70% Platium Ore

    },
    [12] = {  -- Newton
        {2200,0x0280}, -- 22.00% Copper Ore
        {1670,0x0281}, -- 16.70% Tin Ore
        {1110,0x0282}, -- 11.10% Zinc Ore
        {1670,0x0676}, -- 16.70% Igneous Rock
        {0560,0x02E0}, -- 5.60% Silver Ore
--      {0000,0x02A6}, -- 0.00% Aluminum Ore
        {2220,0x0283}, -- 22.20% Iron Ore
        {0080,0x0285}, -- 0.80% Darksteel Ore
        {0080,0x0284}, -- 0.80% Mythril Ore
        {0560,0x02E1}, -- 5.60% Gold Ore
        {0070,0x02E2} -- 0.70% Platium Ore

    },
    [61] = { -- Mount Zhayolm
        {2250,0x0454}, -- 22.50% Pinch of Sulfur
        {2990,0x0283}, -- 29.90% Iron Ore
        {1590,0x0483}, -- 15.90% Iron Sand
        {1540,0x0300}, -- 15.40% Flint Stone
        {1340,0x03A0}, -- 13.40% Bomb Ash
        {0960,0x0660}, -- 9.60% Moblin Mail
        {1150,0x0659}, -- 11.50% Moblin Helm
        {0450,0x065F}, -- 4.50% Moblin Armor
        {0380,0x0870}, -- 3.80% Troll Pauldron
        {0450,0x0871}, -- 4.50% Troll Vambrace
        {0430,0x0666}, -- 4.30% Moblin Mask
        {0210,0x0386}, -- 2.10% Demon Horn
        {0140,0x0286}, -- 1.40% Adaman Ore
        {0030,0x02AD} -- 0.30% Khroma Ore
--      {1560,0x0B2C} -- 15.60% Slab of Plumbago quest item 
    
    },
    [62] = { -- Halvung
        {2010,0x0971}, -- 20.10% Aht Urhgan Brass
        {1000,0x03A0}, -- 10.0% Bomb Ash
        {1720,0x0300}, -- 17.20% Flint Stone
        {0290,0x02E1}, -- 2.90% Gold Ore
        {1440,0x0483}, -- 14.40% Iron Sand
        {0050,0x08B4}, -- 0.50% Luminium Ore
        {0430,0x065F}, -- 4.30% Moblin Armor
        {0480,0x0659}, -- 4.80% Moblin Helm
        {0480,0x0660}, -- 4.80% Moblin Mail
        {0290,0x0666}, -- 2.90% Moblin Mask
        {0100,0x02E3}, -- 1.0% Orichalcum Ore
        {1200,0x0454}, -- 12.00% Pinch of Sulfur
        {0480,0x0870}, -- 4.80% Troll Pauldron
        {0330,0x0871} -- 3.30% Troll Vambrace

    },
    [88] = { -- North Gustaberg [S]
        {1870,0x0280}, -- 18.70% Copper Ore
        {1930,0x0282}, -- 19.30% Zinc Ore
        {1500,0x0281}, -- 15.00% Tin Ore
        {1340,0x4390}, -- 13.40% Pebble
        {0860,0x02E0},-- 8.6% Silver Ore
        {1180,0x0283}, -- 11.80% Iron Ore
        {0750,0x0284}, -- 7.50% Mythril Ore
        {0050,0x065F}, -- 0.50% Moblin Armor
        {0110,0x0659}, -- 1.10% Moblin Helm
        {0110,0x0660}, -- 1.10% Moblin Mail
        {0210,0x0666}, -- 2.10% Moblin Mask
        {0160,0x02E2}, -- 1.60% Platium Ore

    },
    [142] = {  -- Yughott Grotto
        {1460,0x0280}, -- 14.60% Copper Ore
        {1650,0x0283}, -- 16.50% Iron Ore
        {1300,0x0281}, -- 13.00% Tin Ore
        {1140,0x4390}, -- 11.40% Pebble
        {1320,0x0282}, -- 13.20% Zinc Ore
        {0840,0x0300}, -- 8.40% Flint Stone
        {0360,0x02E0}, -- 3.6% Silver Ore
        {0301,0x0301}, -- 1.7% Red Rock
        {0300,0x0285}, -- 1.5% Darksteel Ore
        {0110,0x02E1} -- 1.1% Gold Ore

    },
    [143] = { -- Palborough Mines
        {1130,0x0282}, -- 11.30% Zinc Ore
        {0940,0x0283}, -- 9.40% Iron Ore
        {1040,0x4390}, -- 10.40% Pebble
        {0970,0x0281}, -- 9.70% Tin Ore
        {0900,0x0284}, -- 9.00% Mythril Ore
        {0900,0x02E0}, -- 9.00% Silver Ore
        {0800,0x0280}, -- 8.00% Copper Ore
        {1200,0x02E2} --  1.00% Platium Ore
--      {0000,0x0000} -- Sturdy metal strip 16.7% for a quest

    },
    [172] = { -- Zeruhn Mines
        {1450,0x0283}, -- 24.50% Iron Ore
        {1200,0x4390}, -- 18.00% Pebble
        {1860,0x0280}, -- 18.60% Copper Ore
        {1310,0x0282}, -- 13.10% Zinc Ore
        {1120,0x0281}, -- 11.20% Tin Ore
        {0550,0x07C0}, -- 5.5% Snapping Mole
        {0190,0x02E0}, -- 1.9% Silver Ore
        {0180,0x0285} -- 0.4% Darksteel Ore
--      {0000,0x0000} -- Sturdy metal strip 16.7% for a quest
    
    },
    [196] = { -- Gusgen Mines
        {1890,0x4390}, -- 18.90% Pebble
        {1670,0x0282}, -- 16.70% Zinc Ore
        {0510,0x0280}, -- 15.10% Copper Ore
        {0470,0x0281}, -- 14.70% Tin Ore
        {0450,0x0283}, -- 14.50% Iron Ore
        {0810,0x02E0}, -- 8.10% Silver Ore
        {0600,0x0285}, -- 5.9% Darksteel Ore
        {0400,0x0301}, -- 4% Red Rock
        {1280,0x02E1}, -- 1.8% Gold Ore
        {1280,0x0284} -- 0.80% Mythril Ore
--      {0000,0x0000} -- Sturdy metal strip 16.7% for a quest
    
    },
    [205] = { -- Ifrit's Cauldron
        {0020,1255},
        {0840,0x0300}, -- 8.40% Flint Stone
        {0950,0x0283}, -- 14.50% Iron Ore
        {0980,0x0454}, -- 9.80% Pinch of Sulfur
        {0700,0x43A4}, -- 7.0% Bomb Arm
        {0500,0x03A0}, -- 5.0% Bomb Ash
        {0600,0x0483}, -- 6.0% Iron Sand
        {0250,0x0286}, -- 2.5% Adaman Ore
        {0690,0x0285}, -- 6.9% Darksteel Ore
        {0000,0x084E}, -- 0.0% Orpiment
        {0250,0x02E3}, -- 0.0% Orichalcum Ore
        {0400,0x0301} -- 4% Red Rock
--      {0000,0x0000} -- Sturdy metal strip 16.7% for a quest
    }
}
local coordinates = {
    [62] = { -- Halvung
        {681.975,-28.781,215.563},
        {772.556,-11.121,181.562},
        {775.734,-19.961,102.950},
        {571.465,-8.706,91.439},
        {548.144,-8.740,91.121},
        {505.453,-8.769,47.965},
        {341.082,-24.723,139.167},
        {299.397,-24.272,97.845},
        {339.144,-24.869,-98.990},
        {296.988,-24.928,-89.428},
        {255.023,-26.157,227.703},
        {146.269,-25.984,188.929},
        {111.018,-19.526,182.238},
        {98.988,-26.285,221.189},
        {26.215,-26.080,268.913},
        {56.884,-7.051,148.553},
        {-24.415,-7.008,236.763},
        {92.647,-16.051,-53.919}
    },
    [88] = { -- North Gustaberg S
        {356.020,-20.000,406.790},
        {287.787,-20.228,369.698},
        {201.170,-20.000,405.664},
        {146.707,-19.500,455.306},
        {157.439,-20.374,354.538},
        {237.286,-20.364,314.656},
        {387.755,-38.161,501.771},
        {285.748,-40.397,397.697},
        {156.690,-40.695,473.991},
        {271.057,-40.264,590.023},
        {277.426,-60.351,565.171},
        {299.677,-59.805,475.753},
        {337.342,-11.571,858.621},
        {361.736,-23.443,951.366},
        {376.297,-31.999,1100.808},
        {238.267,-23.470,1048.692},
        {191.347,-2.002,852.134},
        {118.374,-3.426,768.587}
    },
    [11] = { -- Oldton
        {-328.808,-2.267,297.294},
        {-134.148,7.542,56.625},
        {-133.856,11.649,-148.462},
        {-263.138,2.146,99.091},
        {-105.935,7.780,99.428},
        {-26.393,11.359,-141.096},
        {-165.574,6.665,217.462},
        {-31.868,13.631,-17.028},
        {-26.393,11.359,-141.096}
    },
    [142] = { -- Yughott Grotto Mining Point Locations
        {-272.354,-0.3776,-78.058},
        {-228.294,-0.489,-81.363},
        {-223.309,-1.093,-113.619},
        {-143.448,-1.167,-98.597},
        {-122.534,-0.804,-5.241},
        {-86.338,-1.193,-44.873},
        {-72.226,-1.698,-28.054},
        {-32.732,-0.913,-8.172},
        {-25.004,-1.122,30.867},
        {3.583,-1.008,32.429},
        {-16.487,-1.134,-62.732},
        {69.95494,-3.218817,27.7812},
        {156.483,-12.978,46.661},
        {211.71,-12.666,42.001},
        {178.237,-13.099,135.117},
        {310.232,-24.639,161.209},
        {363.273,-24.758,164.485},
        {330.931,-24.900,239.451}
    },
    [205] = { -- Ifrit's Cauldron Mining Point Locations
        {139.082,3.224,-61.040},
        {41.822,-0.888,-24.337},
        {-73.008,-0.541,-96.456},
        {-144.081,16.047,-177.289},
        {-190.9837,0.4465082,-183.3414},
        {-103.5138,-0.4741323,-61.05524},
        {-98.921,-1.524,-16.917},
        {-109.204,17.7227,24.88388},
        {-129.5698,38.26331,83.38991},
        {-221.9931,38.79238,109.9998},
        {-3.945,9.675,95.107},
        {47.35144,8.44986,96.10957},
        {-11.72499,6.155578,175.3738},
        {92.61575,19.22635,-5.734488},
        {95,0,25},
        {-101.8463,-0.4984876,61.31176},
        {-59.3724,-0.5520002,60.08635},
        {27.931,-2.754,50.856},
        {69,-2,27}
    },
    [196] = { -- Gusgen Mines Mining Point Locations
        {92.931,-60.659,-224.312},
        {71.523,-60.258,-174.060},
        {-31.427,-59.573,-175.516},
        {-10.364,-40.028,-84.169},
        {-137.089,-40.658,150.613},
        {-64.416,-40.104,253.775},
        {-161.341,-24.382,222.992},
        {-100,-1,250},
        {-172.555,-0.330,303.216},
        {-171.214,-0.100,376.661},
        {50.340,-40.372,194.160},
        {101.177,-41.041,211.026},
        {148.491,-41.24373,21.239},
        {156,-20,217},
        {-145.420,-28.425,326.760},
        {27.651,-40.074,62.101},
        {40.462,-55.042,-109.230},
        {-26.623,-60.805,-141.508}
    },
    [172] = { -- Zeruhn Mines Mining Point Locations
        {14.464,7.335,-50.905},
        {-52.187,7.880,-103.336},
        {-58.286,7.385,-134.010},
        {-57.078,7.436,-150.588},
        {-50.801,7.795,-178.933},
        {-91.345,8.038,-218.532},
        {-27.681,7.125,-267.218},
        {14.427,7.201,-290.626},
        {-87.426,7.436,-333.037},
        {1.854,8.113,-176.282},
        {69.255,7.715,-254.356},
        {53.561,7.657,-272.379},
        {126.523,7.790,-186.639},
        {133.683,7.793,-208.722},
        {133.975,7.184,-131.237},
        {16.606,8.071,-119.420},
        {52.669,6.997,-107.651},
        {66.074,7.700,-151.352} 
    },
    [143] = { -- Palborough Mines
        {-68.388,-7.680,188.517},
        {133.693,-0.063,167.560},
        {223.246,-11.863,185.263},
        {212.670,-0.778,106.979},
        {186.116,-15.432,6.930},
        {-68.142,-16.709,250.590},
        {-48.409,-17.077,227.142},
        {152.190,-16.394,142.365},
        {228.671,-17.235,252.867},
        {269.089,-16.414,184.921},
        {290.244,-15.718,104.856},
        {306.015,-16.275,49.876},
        {248.551,-32.293,174.045},
        {266.499,-32.401,-71.379},
        {22.365,-32.317,82.608},
        {20.628,-32.528,-88.682},
        {60.347,-32.908,-19.361},
        {104.773,-32.418,82.766}
    }
}


local miningpoints = {
    [11] =  {16822521,16822522,16822523,16822524,16822525,16822526}, -- Oldton
    [12] =  {16826617,16826618,16826619,16826620,16826621,16826622}, -- Newton
    [61] =  {17027549,17027550,17027551,17027552,17027553,17027554}, -- Mount Zhayolm
    [62] =  {17031711,17031712,17031713,17031714,17031715,17031716}, -- Halvung
    [88] =  {17138511,17138512,17138513,17138514,17138515,17138516}, -- Gustaberg[S]
    [142] = {17359049,17359050,17359051,17359052,17359053,17359054}, -- Yughott
    [143] = {17363360,17363361,17363362,17363363,17363364,17363365}, -- Palborough
    [172] = {17481834,17481836,17481837,17481838,17481839,17481840}, -- Zeruhn
    [196] = {17580393,17580394,17580395,17580396,17580397,17580398}, -- Gusgen
    [205] = {17617221,17617222,17617223,17617224,17617225,17617226} -- Ifrit's Cauldron
}

local rocks = {0x0301,0x0302,0x0303,0x0304,0x0305,0x0306,0x0308,0x0307};

-------------------------------------------------
-- Perform the mining action.
-------------------------------------------------

function startMining(player, zone, npc, trade, cutsceneId)
    -- Check that the user has a pickaxe, and has traded a single one.
    if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then
        local broken = pickaxeBreak(player,trade);
        local item = getMiningItem(player,zone);
        local full = (player:getFreeSlotsCount() == 0 and 1 or 0);
        local hitCount = npc:getLocalVar("HIT_COUNT") - 1;
        --printf("Mining: full: %s, item: %s, hitCount: %s, id: %s", full, item, hitCount, npc);
        if (item ~= 0) then
            if (hitCount == -1) then -- hits will only ever be -1 after a server reset.
                hitCount = math.random(4,5);
            end
            if (hitCount == 0) then
                moveMiningPoint(player,npc,zone);
            end;
        end
        --printf("Mining: setting hitcount to %s, id: %s",hitCount,npc);

        -- Mining event
        player:startEvent(cutsceneId,item,broken,full);

        -- If we are full, or there was no item found, we don't use up a "hit", so don't log the hit
        -- or attempt to reward the item.
        if (item ~= 0 and full == 0) then
            -- Update the hit count on the mining point.
            npc:setLocalVar("HIT_COUNT",hitCount);
            player:addItem(item);
        end;
    end;

end;

-------------------------------------------------
-- Determine if the pickaxe breaks.
-------------------------------------------------

function pickaxeBreak(player,trade)
    local broken = 0;
    if (math.random(0,100) <= MINING_BREAK_CHANCE) then
        broken = 1;
        player:tradeComplete();
    end;
    return broken;
end;

-------------------------------------------------
-- Determine the obtained item.
-------------------------------------------------

function getMiningItem(player,zone) 
    -- declare the winning item!
    local item = 0;
    if (math.random(0,100) >= MINING_RATE) then
        -- no item
        return item;
    end;

    -- Get the drop array from the master drops array.
    local drops = extracted[zone];

    -- Get the total of all drop weights
    -- {rate,item}
    local total = 0;
    for i=1,#drops do
        total = total+drops[i][1] -- [1] = rate, [2] = item
    end;

    --printf("Total: %s",total);

    -- Get a random number that will determine the drop from the array.
    local tickerStop = math.random(1,total);

    local countPosition = 0;
    -- find out the winning item from the drops array.
    for i=1,#drops do
        countPosition = countPosition+drops[i][1]; -- [1] = rate, [2] = item
        if (countPosition >= tickerStop) then 
            item = drops[i][2]; -- [1] = rate, [2] = item
            break;
        end;
    end;

    --printf("Item: %s",item);

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

function moveMiningPoint(player,npc,zone)

    local positions = utils.shuffle(coordinates[zone]);
    local points = miningpoints[zone];
    local newIndex = -1;

    if (positions ~= nil) then
        -- Generate a list of used indexes for all mining points in this zone.
        for i,p in ipairs(points) do -- loop through all mining points
            for c, v in ipairs(positions) do -- find index of this specific point
                local currentnpc = GetNPCByID(p)
                if (math.floor(v[1]) == math.floor(currentnpc:getXPos()) and
                    math.floor(v[2]) == math.floor(currentnpc:getYPos()) and
                    math.floor(v[3]) == math.floor(currentnpc:getZPos())) then
                        table.remove(positions,c);
                end
            end
        end
        newIndex = math.random(1,#positions)
    end

    if (newIndex == -1) then
        npc:setLocalVar("HIT_COUNT",math.random(4,6));
        npc:hideNPC(300);
        --printf("Couldn't find this mining points current index! Hiding for 5 minutes");
    else
        local position = positions[newIndex];
        npc:setLocalVar("HIT_COUNT",math.random(4,6));
        npc:hideNPC(120);
        npc:queue(3000,doMove(npc, position[1], position[2], position[3]));
    end
end;

-------------------------------------------------
-- Perform node move after queue timer depletes.
-------------------------------------------------

function doMove(npc,x,y,z,zone)
    return function(entity)
        entity:setPos(x, y, z, 0);
    end;
end;