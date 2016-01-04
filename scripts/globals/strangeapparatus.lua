-- Items

INFINITY_CORE = 1474;

local RED_CHIP    = 474;
local BLUE_CHIP   = 475;
local YELLOW_CHIP = 476;
local GREEN_CHIP  = 477;
local CLEAR_CHIP  = 478;
local PURPLE_CHIP = 479;
local WHITE_CHIP  = 480;
local BLACK_CHIP  = 481;

local FIRE_CLUSTER      = 4104;
local ICE_CLUSTER       = 4105;
local WIND_CLUSTER      = 4106;
local EARTH_CLUSTER     = 4107;
local LIGHTNING_CLUSTER = 4108;
local WATER_CLUSTER     = 4109;
local LIGHT_CLUSTER     = 4110;
local DARK_CLUSTER      = 4111;


local strAppData = {};

-- for variable naming, value used to calculate password, unique identifier from the 0x60 packet, chip, cluster, mob id of elemental, mob x, mob y, mob z, mob rotation

strAppData[191] = {'DW', 0, RED_CHIP,    FIRE_CLUSTER,      17559870}; -- Dangruf Wadi
strAppData[193] = {'OC', 3, GREEN_CHIP,  WIND_CLUSTER,      17568139}; -- Ordelle's Caves
strAppData[194] = {'HR', 5, PURPLE_CHIP, LIGHTNING_CLUSTER, 17572203}; -- Outer Horutoto Ruins
strAppData[195] = {'EN', 4, CLEAR_CHIP,  ICE_CLUSTER,       17576271}; -- The Eldieme Necropolis
strAppData[196] = {'GM', 1, YELLOW_CHIP, EARTH_CLUSTER,     17580340}; -- Gusgen Mines
strAppData[197] = {'CN', 2, BLUE_CHIP,   WATER_CLUSTER,     17584427}; -- Crawler's Nest
strAppData[198] = {'MS', 7, BLACK_CHIP,  DARK_CLUSTER,      17588704}; -- Maze of Shakhrami
strAppData[200] = {'GC', 6, WHITE_CHIP,  LIGHT_CLUSTER,     17596729}; -- Garlaige Citadel

local strAppDrop = {};

-- Must be in ascending order by drop rate
-- Zone, {itemid, drop rate, drop quantity, itemid, drop rate, drop quantity, ...}

strAppDrop[191] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[196] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[197] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[193] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[195] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[194] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[200] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};
strAppDrop[198] = {0x42C5, 0.0400, 1, 0x4435, 0.0800, 1, 0x46A4, 0.1200, 1, 0x4306, 0.1600, 1, 0x40B3, 0.2000, 1, 0x31C6, 0.2400, 1, 0x4107, 0.2800, 1, 0x471E, 0.3200, 1, 0x4018, 0.3600, 1, 0x00DD, 0.4000, 1, 0x43B5, 0.5200, 6, 0x04CD, 0.7000, 2, 0x03A3, 1.0000, 8};

-- Returns strange apparatus password for player

function strAppPass(player) 

    local zone = player:getZoneID();
    local name = string.lower(player:getName());

    return string.format("%02d%02d%02d%02d", letterValue(string.sub(name, 1, 1)) + strAppData[zone][2],letterValue(string.sub(name, 2, 2)) + strAppData[zone][2],letterValue(string.sub(name, 3, 3)) + strAppData[zone][2],string.sub(letterValue(string.sub(name, 1, 1)) + letterValue(string.sub(name, 2, 2)) + letterValue(string.sub(name, 3, 3)) + strAppData[zone][2]*4, -2, -1));
end;

-- Function used by strAppPass()

function letterValue( letter)
    for x = 1, 26 do
        if ( letter == string.sub("abcdefghijklmnopqrstuvwxyz", x, x)) then
            return x - 1;
        end
    end
end;

-- Grants doctor status to player for 48 hours

function giveStrAppDocStatus(player)

    player:setVar("StrangeApparatusDoctorStatus" .. strAppData[player:getZoneID()][1], os.time() + 172800);

    return;
end;

-- Removes doctor status from player

function delStrAppDocStatus(player)

    player:setVar("StrangeApparatusDoctorStatus" .. strAppData[player:getZoneID()][1], 0);

    return;
end;

-- Determines if player has doctor status

function hasStrAppDocStatus(player)

    local docStatusExpires = player:getVar("StrangeApparatusDoctorStatus" .. strAppData[player:getZoneID()][1]);

    if (docStatusExpires ~= 0) then
        if (os.time() <= docStatusExpires) then
            return true;
        else
            player:setVar("StrangeApparatusDoctorStatus" .. strAppData[player:getZoneID()][1], 0);
        end
    end

    return false;
end;

-- Handles onTrade(), returns nil if trade is not valid

function tradeToStrApp(player, trade)

    if (trade:hasItemQty(INFINITY_CORE,1) and trade:getItemCount() == 2) then -- Traded infinity core and at least one other item

        local zone = player:getZoneID();

        local getChip = nil;
        for chip = RED_CHIP, BLACK_CHIP do

            if (trade:hasItemQty( chip, 1)) then

                if ( chip ~= strAppData[zone][3]) then
                    player:tradeComplete();
                    player:addItem(INFINITY_CORE, 1); --player loses the chip, but not the core

                    return chip;
                else
                    getChip = chip;
                end
            end
        end

        if (getChip ~= nil) then

            player:tradeComplete();    
            getStrAppDrop(player,zone);

            return 1;
        end
    end

    return nil;
end;

-- Used to determine item and quantity created by strange apparatus

function getStrAppDrop(player,zone)

    local zone = player:getZoneID();
    local rate = math.random();

    local item = nil;
    local qty  = nil;
    
    for drop = 1, table.getn(strAppDrop[zone]), 3 do
        if (rate <= strAppDrop[zone][drop + 1]) then
            item = strAppDrop[zone][drop];
            qty  = strAppDrop[zone][drop + 2];
            break;            
        end
    end

    if (hasStrAppDocStatus(player) == false) then
    
        rate = math.random();
        
        if (rate <= 0.5) then -- Crystal Cluster
            item = strAppData[zone][4];
            qty  = 2;
        end
    end

    player:setLocalVar("strAppDrop", item);
    player:setLocalVar("strAppDropQty", qty);
    
    return;
end;

-- Used to spawn elemental nm

function spawnElementalNM(player)

    local zone = player:getZoneID();
    local mob = GetMobByID(strAppData[zone][5]);
    
    SpawnMob(strAppData[zone][5],300):updateEnmity(player);
end;