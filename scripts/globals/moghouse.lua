-- 
-- Mog House related functions
--

require("scripts/globals/status")
------------------------------------
-- Mog Locker constants
------------------------------------
MOGLOCKER_START_TS = 1009810800 -- unix timestamp for 2001/12/31 15:00
MOGLOCKER_ALZAHBI_VALID_DAYS = 7
MOGLOCKER_ALLAREAS_VALID_DAYS = 5
MOGLOCKER_ACCESS_TYPE_ALZAHBI = 0
MOGLOCKER_ACCESS_TYPE_ALLAREAS = 1
MOGLOCKER_PLAYERVAR_ACCESS_TYPE = "mog-locker-access-type"
MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP = "mog-locker-expiry-timestamp"


function moogleTrade(player,npc,trade)
    if (player:isInMogHouse()) then
        local numBronze = trade:getItemQty(2184);
        if (numBronze > 0) then
            if (addMogLockerExpiryTime(player, numBronze)) then
                -- remove bronze
                player:tradeComplete();
                -- send event
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 2,getMogLockerExpiryTimestamp(player));
                return true;
            end
        end
    end
    return false;
end

function moogleTrigger(player,npc)
    if (player:isInMogHouse()) then
        local lockerTs = getMogLockerExpiryTimestamp(player);
        if (lockerTs ~= nil) then
            if (lockerTs == -1) then -- expired
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()) + 1,2184); -- 2184 is imperial bronze piece item id
            else
                player:messageSpecial(getMogLockerTextOffset(player:getPreviousZone()),lockerTs);
            end
        end

        local loadintro = player:getVar("MoghouseExplication");
        if (loadintro == 1) then
            player:startEvent(0x7530);
        else
            player:sendMenu(1);
        end
        return true;
    end
    return false;
end; 

-- get the offset of:
-- Your Mog Locker lease is valid until XXXXX, kupo.?Prompt?
-- for a given zone.
function getMogLockerTextOffset(zone)
    if (zone == 50) then -- Whitegate
        return 1160;
    elseif (zone == 48) then -- Al Zahbi
        return 7318;
    elseif (zone == 245) then -- Lower Jeuno
        return 6706;
    elseif (zone == 244) then -- Upper Jeuno
        return 6689;
    elseif (zone == 246) then -- Port Jeuno
        return 6674;
    elseif (zone == 243) then -- Ru'Lude Gardens
        return 6635;
    elseif (zone == 230) then -- Southern San d'Oria
        return 6572;
    elseif (zone == 231) then -- Northern San d'Oria
        return 6730;
    end
    return 6600;
end

-- Unlocks a mog locker for a player. Returns the 'expired' timestamp (-1)
function unlockMogLocker(player)
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1);
    currentSize = player:getContainerSize(LOC_MOGLOCKER);
    if (currentSize == 0) then -- we do this check in case some servers auto-set 80 slots for mog locker items
        player:changeContainerSize(LOC_MOGLOCKER, 30);
    end
    return -1;
end

-- Sets the mog locker access type (all area or alzahbi only). Returns the new access type.
function setMogLockerAccessType(player, accessType)
    player:setVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE, accessType);
    return accessType;
end


-- Adds time to your mog locker, given the number of bronze coins.
-- The amount of time per bronze is affected by the access type
-- The expiry time itself is the number of seconds past 2001/12/31 15:00
-- Returns true if time was added successfully, false otherwise.
function addMogLockerExpiryTime(player, numBronze)
    local accessType = getMogLockerAccessType(player);
    local numDaysPerBronze = 5;
    if (accessType == MOGLOCKER_ACCESS_TYPE_ALZAHBI) then
        numDaysPerBronze = 7;
    end
    
    local currentTs = getMogLockerExpiryTimestamp(player)
    if (currentTs == nil) then
        -- print("Unable to add time: player hasn't unlocked mog locker.");
        return false;
    end
    
    if (currentTs == -1) then 
        currentTs = os.time() - MOGLOCKER_START_TS;
    end
        
    local timeIncrease = (60*60*24*numDaysPerBronze*numBronze);
    local newTs = currentTs + timeIncrease;
    
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, newTs);
    -- send an invent size packet to enable the items if they weren't
    player:changeContainerSize(LOC_MOGLOCKER,0);
    return true;
end

-- Gets the expiry time for your locker. A return value of -1 is expired. A return value of nil means mog locker hasn't been unlocked.
function getMogLockerExpiryTimestamp(player)
    local expiryTime = player:getVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP);
    
    if (expiryTime == 0) then
        return nil;
    end
    
    local now = os.time() - MOGLOCKER_START_TS;
    if (now > expiryTime) then
        player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1);
        return -1;
    end
    
    -- TODO: Check if the timestamp > now then expire it.
    
    return expiryTime;
end

function getMogLockerAccessType(player)
    return player:getVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE);
end