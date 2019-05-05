--
-- Mog House related functions
--

require("scripts/globals/npc_util")
require("scripts/globals/quests");
require("scripts/globals/status")
require("scripts/globals/titles")
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
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET + 2, getMogLockerExpiryTimestamp(player))
            end
        end

        local giveMoogleABreak = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK)
        local theMooglePicnic = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC)
        local moogleInTheWild = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.MOOGLES_IN_THE_WILD)
        if giveMoogleABreak == QUEST_ACCEPTED and npcUtil.tradeHas(trade, {17161, 13457}) then
            player:startEvent(30007)
        elseif theMooglePicnic == QUEST_ACCEPTED and npcUtil.tradeHas(trade, {17402, 615}) then
            player:startEvent(30011)
        elseif moogleInTheWild == QUEST_ACCEPTED and npcUtil.tradeHas(trade, {13593, 12474}) then
            player:startEvent(30015)
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
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET + 1, 2184) -- 2184 is imperial bronze piece item id
            else
                player:messageSpecial(zones[player:getZoneID()].text.MOG_LOCKER_OFFSET, lockerTs)
            end
        end

        local homeNationFameLevel = player:getFameLevel(player:getNation())
        local giveMoogleABreak = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK)
        local theMooglePicnic = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC)
        local moogleInTheWild = player:getQuestStatus(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.MOOGLES_IN_THE_WILD)

        if player:getVar("MoghouseExplication") == 1 then
            player:startEvent(30000)

        elseif player:getLocalVar("QuestSeen") == 0 and giveMoogleABreak == QUEST_AVAILABLE and homeNationFameLevel >= 3 and
               player:getVar("[MS1]BedPlaced") == 1 then
            player:startEvent(30005,0,0,0,5,0,17161,13457)
        elseif player:getLocalVar("QuestSeen") == 0 and giveMoogleABreak == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 1 then
            player:startEvent(30006,0,0,0,0,0,17161,13457)
        elseif player:getLocalVar("QuestSeen") == 0 and giveMoogleABreak == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 2 then
            player:startEvent(30008)

        elseif player:getLocalVar("QuestSeen") == 0 and theMooglePicnic == QUEST_AVAILABLE and homeNationFameLevel >= 5 and
                giveMoogleABreak == QUEST_COMPLETED and player:getVar("[MS2]BedPlaced") == 1 then
            player:startEvent(30009,0,0,0,4,0,17402,615)
        elseif player:getLocalVar("QuestSeen") == 0 and theMooglePicnic == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 1 then
            player:startEvent(30010,0,0,0,0,0,17402,615)
        elseif player:getLocalVar("QuestSeen") == 0 and theMooglePicnic == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 2 then
            player:startEvent(30012)

        elseif player:getLocalVar("QuestSeen") == 0 and moogleInTheWild == QUEST_AVAILABLE and homeNationFameLevel >= 7 and
                theMooglePicnic == QUEST_COMPLETED and player:getVar("[MS3]BedPlaced") == 1 then
            player:startEvent(30013,0,0,0,6,0,13593,12474)
        elseif player:getLocalVar("QuestSeen") == 0 and moogleInTheWild == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 1 then
            player:startEvent(30014,0,0,0,0,0,13593,12474)
        elseif player:getLocalVar("QuestSeen") == 0 and moogleInTheWild == QUEST_ACCEPTED and player:getVar("MogSafeProgress") == 2 then
            player:startEvent(30016)

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

        elseif csid == 30005 and option == 1 then
            player:addQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK)
            player:setLocalVar("QuestSeen", 1)
            player:setVar("[MS1]BedPlaced", 0)
            player:setVar("MogSafeProgress", 1)
        elseif csid == 30005 and option == 2 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30006 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30007 then
            player:tradeComplete()
            player:setVar("MogSafeProgress", 2)
        elseif csid == 30008 then
            player:completeQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.GIVE_A_MOOGLE_A_BREAK)
            player:changeContainerSize(dsp.inv.MOGSAFE, 10)
            player:addTitle(dsp.title.MOGS_KIND_MASTER)
            player:setVar("MogSafeProgress", 0)

        elseif csid == 30009 and option == 1 then
            player:addQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC)
            player:setLocalVar("QuestSeen", 1)
            player:setVar("[MS2]BedPlaced", 0)
            player:setVar("MogSafeProgress", 1)
        elseif csid == 30009 and option == 2 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30010 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30011 then
            player:tradeComplete()
            player:setVar("MogSafeProgress", 2)
        elseif csid == 30012 then
            player:completeQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.THE_MOOGLE_PICNIC)
            player:changeContainerSize(dsp.inv.MOGSAFE, 10)
            player:addTitle(dsp.title.MOGS_EXCEPTIONALLY_KIND_MASTER)
            player:setVar("MogSafeProgress", 0)

        elseif csid == 30013 and option == 1 then
            player:addQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.MOOGLES_IN_THE_WILD)
            player:setLocalVar("QuestSeen", 1)
            player:setVar("[MS3]BedPlaced", 0)
            player:setVar("MogSafeProgress", 1)
        elseif csid == 30013 and option == 2 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30014 then
            player:setLocalVar("QuestSeen", 1)
        elseif csid == 30015 then
            player:tradeComplete()
            player:setVar("MogSafeProgress", 2)
        elseif csid == 30016 then
            player:completeQuest(OTHER_AREAS_LOG, dsp.quest.id.otherAreas.MOOGLES_IN_THE_WILD)
            player:changeContainerSize(dsp.inv.MOGSAFE, 10)
            player:addTitle(dsp.title.MOGS_LOVING_MASTER)
            player:setVar("MogSafeProgress", 0)
        end

        return true
    end
    return false
end

-- Unlocks a mog locker for a player. Returns the 'expired' timestamp (-1)
function unlockMogLocker(player)
    player:setVar(MOGLOCKER_PLAYERVAR_EXPIRY_TIMESTAMP, -1)
    local currentSize = player:getContainerSize(dsp.inv.MOGLOCKER)
    if currentSize == 0 then -- we do this check in case some servers auto-set 80 slots for mog locker items
        player:changeContainerSize(dsp.inv.MOGLOCKER, 30)
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
    player:changeContainerSize(dsp.inv.MOGLOCKER, 0)
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
