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
    if player:isInMogHouse() then
        local numBronze = trade:getItemQty(2184)
        if numBronze > 0 then
            if addMogLockerExpiryTime(player, numBronze) then
                -- remove bronze
                player:tradeComplete()
                -- send event
                player:messageSpecial(MOG_LOCKER_OFFSET + 2, getMogLockerExpiryTimestamp(player))
            end
        end
        return true
    end
    return false
end

function moogleTrigger(player,npc)
    if player:isInMogHouse() then
        local lockerTs = getMogLockerExpiryTimestamp(player)
        if lockerTs ~= nil then
            if lockerTs == -1 then -- expired
                player:messageSpecial(MOG_LOCKER_OFFSET + 1, 2184) -- 2184 is imperial bronze piece item id
            else
                player:messageSpecial(MOG_LOCKER_OFFSET, lockerTs)
            end
        end

        if player:getVar("MoghouseExplication") == 1 then
            player:startEvent(30000)
        else
            player:sendMenu(1)
        end
        return true
    end
    return false
end

function moogleEventUpdate(player,csid,option)
    if player:isInMogHouse() then
        return true
    end
    return false
end

function moogleEventFinish(player,csid,option)
    if player:isInMogHouse() then
        if csid == 30000 then
            player:setVar("MoghouseExplication", 0)
        end
        return true
    end
    return false
end

-- Unlocks a mog locker for a player. Returns the 'expired' timestamp (-1)
function unlockMogLocker(player)
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1)
    local currentSize = player:getContainerSize(LOC_MOGLOCKER)
    if currentSize == 0 then -- we do this check in case some servers auto-set 80 slots for mog locker items
        player:changeContainerSize(LOC_MOGLOCKER, 30)
    end
    return -1
end

-- Sets the mog locker access type (all area or alzahbi only). Returns the new access type.
function setMogLockerAccessType(player, accessType)
    player:setVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE, accessType)
    return accessType
end

-- Gets the mog locker access type (all area or alzahbi only). Returns the new access type.
function getMogLockerAccessType(player)
    return player:getVar(MOGLOCKER_PLAYERVAR_ACCESS_TYPE)
end

-- Adds time to your mog locker, given the number of bronze coins.
-- The amount of time per bronze is affected by the access type
-- The expiry time itself is the number of seconds past 2001/12/31 15:00
-- Returns true if time was added successfully, false otherwise.
function addMogLockerExpiryTime(player, numBronze)
    local accessType = getMogLockerAccessType(player)
    local numDaysPerBronze = 5
    if accessType == MOGLOCKER_ACCESS_TYPE_ALZAHBI then
        numDaysPerBronze = 7
    end

    local currentTs = getMogLockerExpiryTimestamp(player)
    if currentTs == nil then
        -- print("Unable to add time: player hasn't unlocked mog locker.");
        return false
    end

    if currentTs == -1 then
        currentTs = os.time() - MOGLOCKER_START_TS
    end

    local timeIncrease = 60 * 60 * 24 * numDaysPerBronze * numBronze
    local newTs = currentTs + timeIncrease

    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, newTs)
    -- send an invent size packet to enable the items if they weren't
    player:changeContainerSize(LOC_MOGLOCKER, 0)
    return true
end

-- Gets the expiry time for your locker. A return value of -1 is expired. A return value of nil means mog locker hasn't been unlocked.
function getMogLockerExpiryTimestamp(player)
    local expiryTime = player:getVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP)

    if (expiryTime == 0) then
        return nil
    end

    local now = os.time() - MOGLOCKER_START_TS
    if now > expiryTime then
        player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1)
        return -1
    end

    return expiryTime
end
