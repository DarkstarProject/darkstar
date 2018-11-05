-----------------------------------
--
--     Strange Apparatus
--
-----------------------------------
require("scripts/globals/npc_util")
------------------------------------

dsp = dsp or {}

local RED_CHIP          = 474
local BLUE_CHIP         = 475
local YELLOW_CHIP       = 476
local GREEN_CHIP        = 477
local CLEAR_CHIP        = 478
local PURPLE_CHIP       = 479
local WHITE_CHIP        = 480
local BLACK_CHIP        = 481
local INFINITY_CORE     = 1474
local FIRE_CLUSTER      = 4104
local ICE_CLUSTER       = 4105
local WIND_CLUSTER      = 4106
local EARTH_CLUSTER     = 4107
local LIGHTNING_CLUSTER = 4108
local WATER_CLUSTER     = 4109
local LIGHT_CLUSTER     = 4110
local DARK_CLUSTER      = 4111

------------------------------------
-- Strange Apparatus data
-- [zoneId] = {player variable suffix, unique identifier from the 0x60 packet, chip, cluster, mob id of elemental
------------------------------------

local strAppData =
{
    [191] = {'DW', 0, RED_CHIP,    FIRE_CLUSTER,      17559870}, -- Dangruf Wadi
    [193] = {'OC', 3, GREEN_CHIP,  WIND_CLUSTER,      17568139}, -- Ordelle's Caves
    [194] = {'HR', 5, PURPLE_CHIP, LIGHTNING_CLUSTER, 17572203}, -- Outer Horutoto Ruins
    [195] = {'EN', 4, CLEAR_CHIP,  ICE_CLUSTER,       17576271}, -- The Eldieme Necropolis
    [196] = {'GM', 1, YELLOW_CHIP, EARTH_CLUSTER,     17580340}, -- Gusgen Mines
    [197] = {'CN', 2, BLUE_CHIP,   WATER_CLUSTER,     17584427}, -- Crawler's Nest
    [198] = {'MS', 7, BLACK_CHIP,  DARK_CLUSTER,      17588704}, -- Maze of Shakhrami
    [200] = {'GC', 6, WHITE_CHIP,  LIGHT_CLUSTER,     17596729}, -- Garlaige Citadel
}

------------------------------------
-- Strange Apparatus rewards
-- [zoneId] = {itemid, drop rate, drop quantity, itemid, drop rate, drop quantity, ...}
-- Must be in ascending order by drop rate
------------------------------------

local strAppDrop =
{
    [191] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [193] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [194] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [195] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [196] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [197] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [198] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
    [200] = {17093, 0.0400, 1, 17461, 0.0800, 1, 18084, 0.1200, 1, 17158, 0.1600, 1, 16563, 0.2000, 1, 12742, 0.2400, 1, 16647, 0.2800, 1, 18206, 0.3200, 1, 16408, 0.3600, 1, 221, 0.4000, 1, 17333, 0.5200, 6, 1229, 0.7000, 2, 931, 1.0000, 8},
}

------------------------------------
-- Doctor status functions
------------------------------------

local function addDoctorStatus(player)
    local suffix = strAppData[player:getZoneID()][1]
    player:setVar("StrangeApparatusDoctorStatus" .. suffix, os.time() + 172800) -- 2 days
end

local function delDoctorStatus(player)
    local suffix = strAppData[player:getZoneID()][1]
    player:setVar("StrangeApparatusDoctorStatus" .. suffix, 0)
end

local function hasDoctorStatus(player)
    local suffix = strAppData[player:getZoneID()][1]
    local docStatusExpires = player:getVar("StrangeApparatusDoctorStatus" .. suffix)

    if docStatusExpires ~= 0 then
        if os.time() <= docStatusExpires then
            return true
        else
            player:setVar("StrangeApparatusDoctorStatus" .. suffix, 0)
        end
    end

    return false
end

------------------------------------
-- Password functions
------------------------------------

local function ltrVal(letter)
    for x = 1, 26 do
        if letter == string.sub("abcdefghijklmnopqrstuvwxyz", x, x) then
            return x - 1
        end
    end
end

local function generatePassword(player)
    local zone = player:getZoneID()
    local name = string.lower(player:getName())
    local uid  = strAppData[zone][2] -- unique identifier
    return string.format(
        "%02d%02d%02d%02d",
        ltrVal(string.sub(name, 1, 1)) + uid,
        ltrVal(string.sub(name, 2, 2)) + uid,
        ltrVal(string.sub(name, 3, 3)) + uid,
        string.sub(ltrVal(string.sub(name, 1, 1)) + ltrVal(string.sub(name, 2, 2)) + ltrVal(string.sub(name, 3, 3)) + uid * 4, -2, -1)
    )
end

------------------------------------
-- strangeApparatus object
------------------------------------

dsp.strangeApparatus =
{
    onTrade = function(player, trade, eventId)
        local zone = player:getZoneID()
        local ID = zones[zone]
        local chipNeeded = strAppData[zone][3]
        local foundChip = false
        
        for chipTraded = RED_CHIP, BLACK_CHIP do
            if npcUtil.tradeHasExactly(trade, {INFINITY_CORE, chipTraded}) then
                foundChip = true
                
                -- player traded a chip that matches this zone
                if chipTraded == chipNeeded then
                    player:confirmTrade()

                    -- determine drop
                    local rate = math.random()
                    local item = nil
                    local qty  = nil
                    
                    for drop = 1, #strAppDrop[zone], 3 do
                        if rate <= strAppDrop[zone][drop + 1] then
                            item = strAppDrop[zone][drop]
                            qty  = strAppDrop[zone][drop + 2]
                            break
                        end
                    end

                    if not hasDoctorStatus(player) then
                        if math.random() <= 0.5 then
                            item = strAppData[zone][4] -- give clusters instead of reward
                            qty  = 2
                        end
                    end

                    player:setLocalVar("strAppDrop", item)
                    player:setLocalVar("strAppDropQty", qty)
    
                    -- start event
                    local doctorStatus = hasDoctorStatus(player) and 1 or 0
                    player:startEvent(eventId, item, qty, INFINITY_CORE, 0, 0, 0, doctorStatus, 0)

                -- player traded a chip that does not match this zone. spawn elemental that matches apparatus.
                else
                    player:confirmTrade()
                    player:addItem(INFINITY_CORE, 1)
                    player:messageSpecial(ID.text.SYS_OVERLOAD)
                    player:messageSpecial(ID.text.YOU_LOST_THE, chipTraded)
                    delDoctorStatus(player)
                    SpawnMob(strAppData[zone][5]):updateEnmity(player)
                end

                break
            end
        end
        
        -- player traded something other than a chip. message and delete doctor status.
        if not foundChip then
            delDoctorStatus(player)
            player:messageSpecial(ID.text.DEVICE_NOT_WORKING)
        end
    end,

    ------------------------------------
    
    onTrigger = function(player, eventId)
        local doctorStatus = 0
        if hasDoctorStatus(player) then
            doctorStatus = 1
        else
            player:setLocalVar("strAppPass", 1)
        end

        player:startEvent(eventId, doctorStatus, 0, INFINITY_CORE, 0, 0, 0, 0, player:getZoneID())
    end,

    ------------------------------------

    onEventUpdate = function(player, option)
        if not hasDoctorStatus(player) then
            local doctorStatus = 1
            if option == generatePassword(player) then -- good password
                doctorStatus = 0
                addDoctorStatus(player)
            end
            player:updateEvent(doctorStatus, 0, INFINITY_CORE, 0, 0, 0, 0, 0)
        end
    end,

    ------------------------------------

    onEventFinish = function(player)
        local item = player:getLocalVar("strAppDrop")
        local qty = player:getLocalVar("strAppDropQty")

        if item ~= 0 then
            if qty == 0 then
                qty = 1
            end
            
            if npcUtil.giveItem(player, {{item, qty}}) then
                player:setLocalVar("strAppDrop", 0)
                player:setLocalVar("strAppDropQty", 0)
            end
        end
    end,
}
