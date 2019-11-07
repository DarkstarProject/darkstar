-----------------------------------------------------------
-- Global Casket utility script
-----------------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

-----------------------------------------------
-- Notes:
-----------------------------------------------
-- chest MiD's
-- 960  -- Basic Chest
-- 965  -- Blue Casket
-- 966  -- Brown Casket
-- 967  -- Bronze
-- 968  -- Red
-- 969  -- Gold
-- 1524 -- Odd Chest
-- 1932 -- Black with Red chest
-- 2425 -- Black with Red chest 2
-----------------------------------------------

dsp = dsp or {}
dsp.caskets = dsp.caskets or {}

local casketInfo =
{
    spawnStatus =
    {
        DESPAWNED      = 0,
        SPAWNED_CLOSED = 1,
        SPAWNED_OPEN   = 2,
    },
    messageOffset =
    {
        NO_COMBINATION           = 6,  -- You were unable to enter a combination.
        HUNCH_GREATER_LESS       = 7,  -- You have a hunch that the lock's combination is ≺0 = GREATER, 1 = LESS≻[greater/less] than ≺INPUT NUMBER≻.
        UNABLE_TO_OPEN_LOCK      = 8,  -- Player failed to open the lock.
        CORRECT_NUMBER_WAS       = 9,  -- It appears that the correct combination was ≺RANDOM LOCK NUMBER≻.
        OPENED_LOCK              = 10, -- Player succeeded in opening the lock!
        HUNCH_SECOND_EVEN_ODD    = 11, -- You have a hunch that the second digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        HUNCH_FIRST_EVEN_ODD     = 12, -- You have a hunch that the first digit is ≺0 = EVEN, 1 = ODD≻[even/odd].
        COMBINATION_GREATER_LESS = 13, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻ and less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_LESS_THAN    = 14, -- You have a hunch that the combination is less than ≺RANDOM LOCK NUMBER≻.
        COMBINATION_GREATER_THAN = 15, -- You have a hunch that the combination is greater than ≺RANDOM LOCK NUMBER≻.
        ONE_OF_TWO_DIGITS_IS     = 16, -- You have a hunch that one of the two digits is ≺PICKED ONE OF THE TWO NUMBERS OF LOCK≻.
        SECOND_DIGIT_IS          = 17, -- You have a hunch that the second digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        FIRST_DIGIT_IS           = 18, -- You have a hunch that the first digit is ≺NUMBER BEFORE REAL NUMBER≻, ≺REAL NUMBER≻, or ≺NUMBER AFTER REAL NUMBER≻.
        UNABLE_TO_GET_HINT       = 19, -- You were unable to glean anything from your examination of the lock.
        MONSTER_CONCEALED_CHEST  = 21, -- The monster was concealing a treasure chest!
    },
    casketZones =
    {
        100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111,
        112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123,
        124, 125, 126, 127, 128, 130, 153, 157, 158, 159, 160, 166,
        167, 169, 172, 173, 174, 176, 177, 178, 184, 190, 191, 192,
        193, 194, 195, 196, 197, 198, 204, 205, 207, 212, 213
    },
    cs =
    {
        [0]  = 1000, [1]  = 1003, [2]  = 1006, [3]  = 1009, [4]  = 1012, [5]  = 1015,
        [6]  = 1018, [7]  = 1021, [8]  = 1024, [9]  = 1027, [10] = 1030, [11] = 1033,
        [12] = 1036, [13] = 1039, [14] = 1042, [15] = 1045, [16] = 1048
    },
    dropTypes =
    {
        [1]  = "tempItems",
        [2]  = "items",
        [3]  = "evolith" -- NOTE: not implemented! item id: 2783
    },
    evolithAugs =
    {
        -- TODO: find all augments for evoliths.
    },
}

local casketItems =
{
    [dsp.zone.WEST_RONFAURE] =
    {
        regionalItems = {15834}, -- Blind Ring
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1060, 4112}, -- Potion
            { 790, 4113}, -- Potion +1
            { 425, 4114}, -- Potion +2
            {1040, 4128}, -- Ether
            { 760, 4129}, -- Ether +1
            { 420, 4130}, -- Ether +2
            { 600, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 750, 4151}, -- Echo Drops
            { 350, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
        ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 495, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 190, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            { 280, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 250, 12961}, -- Brass Leggings
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand
        }
    },
    [dsp.zone.EAST_RONFAURE] =
    {
        regionalItems = {19157}, -- Surviver
        temps =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
         ----------------------------------
            {1060, 4112}, -- Potion
            { 790, 4113}, -- Potion +1
            { 425, 4114}, -- Potion +2
            {1040, 4128}, -- Ether
            { 760, 4129}, -- Ether +1
            { 420, 4130}, -- Ether +2
            { 600, 4145}, -- Elixer
            { 820, 4148}, -- Antidote
            { 730, 4150}, -- Eye Drops
            { 750, 4151}, -- Echo Drops
            { 350, 4155}, -- Remedy
            {1020, 4164}, -- Prism Powder
            { 940, 4165}, -- Silent Oil
            { 420, 4202}, -- Daedalus Wing
            { 660, 4300}, -- Apple Au Lait
            { 250, 4423}, -- Apple Juice
        },
        items =
        {
        ----------------------------------
        --| Weight | Item ID |   Name  |--
         ----------------------------------
            {1700,   505}, -- Sheepskin
            {4500,   640}, -- Copper Ore
            {2500,   641}, -- Tin Ore
            {3450,   642}, -- Zinc Ore
            {2000,   688}, -- Arrowwood Log
            {1020,   698}, -- Ash Log
            {4200,   656}, -- Beastcoin
            {5000,   768}, -- Flint Stone
            {1250,   818}, -- Cotton Thread
            {1300,   833}, -- Moko Grass
            { 800,   840}, -- Chocobo Feather
            {3600,   846}, -- Insect Wing
            {3000,   912}, -- Beehive Chip
            { 700,   943}, -- Poison Dust
            {2400,  1214}, -- Handful of Stone Arrowheads x33
            {4900,  4112}, -- Potion
            {3590,  4148}, -- Antidote
            {1150,  4150}, -- Eye Drops
            {1360,  4151}, -- Echo Drops
            {2900,  4370}, -- Honey
            { 600, 12290}, -- Maple Shield
            { 495, 12440}, -- Leather Bandana
            { 450, 12449}, -- Brass Cap
            { 190, 12456}, -- Hachimaki
            { 530, 12608}, -- Tunic
            { 460, 12696}, -- Leather Gloves
            { 340, 12705}, -- Brass Mittens
            { 168, 12712}, -- Tekko
            { 310, 12736}, -- Mitts
            { 475, 12824}, -- Leather Trousers
            { 280, 12833}, -- Brass Subligar
            { 235, 12840}, -- Sitabaki
            { 422, 12864}, -- Slacks
            { 250, 12961}, -- Brass Leggings
            { 287, 12992}, -- Solea
            { 500, 13081}, -- Leather Gorget
            { 300, 16407}, -- Brass Baghnakhs
            { 120, 16530}, -- Xiphos
            { 320, 17050}, -- Willow Wand
        }
    },
}



---------------------------------------------------------------------------------------------
-- Casket spawn checks
---------------------------------------------------------------------------------------------
dsp.caskets.SpawnCasket = function (player, mob, x, y, z, r)
    local chestId    = GetCasketID(mob)
    local npc        = GetNPCByID(chestId)
    local chestOwner = player:getLeaderID()

    if chestId == 0 then
        return
    end

    if DropChance(player) == true then
        SetCasketData(player, x, y, z, r, npc, chestOwner)
    end
end

function DropChance(player)
    -----------------------------------------------------------------------------------------
    -- NOTES: 10% base drop rate.
    -- Super Kupowers(Myriad Mystery Boxes) adds 10% drop rate.
    -- GoV Prowess Increased Treasure Casket Discovery adds 2% per level (max 5 levels)
    -- for a total of 10% increase.
    -- Total max amount is 30% drop rate.
    -----------------------------------------------------------------------------------------
    local kupowersMMB         = 0 -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    local kupowersMMBPower    = 0
    local prowessCaskets      = 0
    local prowessCasketsPower = 0
    local baseChance          = 0.1 * CASKET_DROP_RATE
    local dropChance          = 0

    --kupowersMMB = dsp.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES

    --if player:hasStatusEffect(kupowersMMB) then
    --    kupowersMMBPower = 0.1
    --end

    prowessCaskets  = dsp.effect.PROWESS_CASKET_RATE

    if player:hasStatusEffect(prowessCaskets) then
        prowessCasketsPower = player:getStatusEffect(prowessCaskets):getPower()
    end

    dropChance = baseChance + kupowersMMBPower + prowessCasketsPower
    dropChance = utils.clamp(dropChance, 0, 1)

    local rand = math.random()

    if rand < dropChance then
        return true
    end

    return false
end

function GetCasketID(mob)
    local zoneId      = mob:getZoneID()
    local baseChestId = zones[zoneId].npc.CASKET_BASE
    local chestId     = 0
    local spawnStatus = nil

    for i = baseChestId, baseChestId + 15 do
        if TimeElapsedCheck(GetNPCByID(i)) then
            if GetNPCByID(i):getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.DESPAWNED or
                GetNPCByID(i):getLocalVar("SPAWNSTATUS") == nil then
                chestId = i
                break
            end
        end
        i = i + 1
    end

    if GetNPCByID(chestId) == nil then
        return 0
    end

    return chestId
end

function TimeElapsedCheck(npc)
    local lastSpawned = 0
    local spawnTime   = os.time() + 360000 -- defualt time in case no var set.
    local timeTable   = {00, 00, 00}       -- HOURS,MINUTES,SECONDS.

    spawnTime   = npc:getLocalVar("SPAWNTIME")
    lastSpawned = os.time() - spawnTime
    timeTable   = ConvertTime(lastSpawned)

    if tonumber(timeTable[1]) >= 01 or tonumber(timeTable[1]) < 01 and tonumber(timeTable[2]) >= 05 then
        return true
    end

    return false
end
----------------------------------------------------------------------
-- Main public casket functions
----------------------------------------------------------------------
dsp.caskets.onTrigger = function(player, npc)
    ------------------------------------------------------------------
    -- Basic chest var's
    ------------------------------------------------------------------
    local chestId           = npc:getID()                             -- ID of the chest
    local itemType          = npc:getLocalVar("LOOT_TYPE")            -- Type: 1 Temps, 2 Items.
    local locked            = npc:getLocalVar("LOCKED")               -- enter two-digit combination (10~99).
    local chestOwner        = npc:getLocalVar("PARTYID")              -- the id of the party that has rights to the chest.
    local leaderId          = player:getLeaderID()
    --local aumentflag      = 0x0202                                  -- Used for Evoliths (not implemented yet).
    local zoneId            = npc:getZoneID()
    local eventBase         = zones[zoneId].npc.CASKET_BASE           -- base id of the current chest.
    local lockedEvent       = casketInfo.cs[chestId - eventBase] + 2  -- Chest locked cs's.
    local unlockedEvent     = casketInfo.cs[chestId - eventBase]      -- Chest unlocked cs's.

    ------------------------------------------------------------------
    -- Locked chest var's
    ------------------------------------------------------------------
    local partySize         = 0
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts

    if leaderId ~= chestOwner then
        return
    end

    GetDrops(npc, itemType, player:getZoneID())

    --------------------------------------------------
    -- Chest Locked
    -------------------------------------------------
    if locked ~= 0 then
        player:startEvent(lockedEvent, remainingAttempts, 0, 0, 0, 0, 0, 0, 0) -- Start the minigame if locked.
    else
    --------------------------------------------------
    -- Chest Unlocked
    -------------------------------------------------
        if npc:getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.SPAWNED_CLOSED then      -- is the chest shut?, then open it.
            npc:AnimationSub(1)
            npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_OPEN)
        end

        if itemType == 1 then                -- temp items
            player:startEvent(unlockedEvent + 1,
                GetTempDrop(npc, 1),
                GetTempDrop(npc, 2),
                GetTempDrop(npc, 3),
                0, 0, 0, 0, 0)
        elseif itemType == 2 then            -- items
            player:startEvent(unlockedEvent,
                GetChestItem(npc, 1),
                GetChestItem(npc, 2),
                GetChestItem(npc, 3),
                GetChestItem(npc, 4),
                0, 0, 0, 0)
        end
    end
end

dsp.caskets.onTrade = function(player, npc, trade)
    local zoneId            = player:getZoneID()
    local ID                = zones[zoneId]
    local baseMessage       = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    local locked            = npc:getLocalVar("LOCKED")
    local eventBase         = zones[zoneId].npc.CASKET_BASE               -- base id of the current chest.
    local lockedEvent       = casketInfo.cs[npc:getID() - eventBase] + 2  -- Chest locked cs's.
    local correctNumber     = npc:getLocalVar("CORRECT_NUM")
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local remainingAttempts = attemptsAllowed - failedAtempts
    local chestOwner        = npc:getLocalVar("PARTYID")                  -- the id of the player,party or alliance that has rights to the chest.
    local leaderId          = player:getLeaderID()

    if leaderId ~= chestOwner then
        return
    end

    if locked == 1 then
        if npcUtil.tradeHas(trade,1022,1) then
            GetDrops(npc, itemType, player:getZoneID())

            local splitNumbers = {}

            for digit in string.gmatch(tostring(correctNumber), "%d") do
               table.insert(splitNumbers, digit)
            end

            local randText = 0

            math.randomseed(os.time())

            randText = math.random(1,7)

            player:confirmTrade()

            if randText == 1 then
                if isEven(splitNumbers[1]) == true then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 0, 0, 0, 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 1, 0, 0, 0)
                end
            elseif randText == 2 then
                if isEven(splitNumbers[2]) == true then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 0, 0, 0, 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 1, 0, 0, 0)
                end
            elseif randText == 3 then
                if tonumber(splitNumbers[1]) <= 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1],
                        splitNumbers[1] +1,
                        splitNumbers[1] +2, 0)
                elseif tonumber(splitNumbers[2]) == 9 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[2] -2,
                        splitNumbers[2] -1,
                        splitNumbers[2], 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                        splitNumbers[1] -1,
                        splitNumbers[1],
                        splitNumbers[1] +1, 0)
                end
            elseif randText == 4 then
                if tonumber(splitNumbers[2]) <= 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2],
                        splitNumbers[2] +1,
                        splitNumbers[2] +2, 0)
                elseif tonumber(splitNumbers[2]) == 9 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -2,
                        splitNumbers[2] -1,
                        splitNumbers[2], 0)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                        splitNumbers[2] -1,
                        splitNumbers[2],
                        splitNumbers[2] +1, 0)
                end
            elseif randText == 5 then
                player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[1], 0, 0, 0)
            elseif randText == 6 then
                player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                    splitNumbers[2], 0, 0, 0)
            elseif randText == 7 then
                local highNum = 0
                local lowNum  = 0
                local rand = math.random(1,9)

                if tonumber(splitNumbers[1]) == 1 then
                    lowNum  = 10
                    highNum = 20 + rand
                elseif tonumber(splitNumbers[1]) > 1 and tonumber(splitNumbers[1]) < 9 then
                    lowNum  = tonumber(splitNumbers[1]) * 10 - 10 + rand
                    highNum = tonumber(splitNumbers[1]) * 10 + 10 + rand
                elseif tonumber(splitNumbers[1]) == 9 then
                    lowNum  = 80 + rand
                    highNum = 99
                end
                player:messageSpecial(baseMessage + casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
            else
                player:messageSpecial(baseMessage + casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
            end
        end
    end
end

dsp.caskets.onEventUpdate = function(player, csid, option, npc)
    -- nothing to see here keep scrolling.
end

dsp.caskets.onEventFinish = function(player, csid, option, npc)
    local zoneId = player:getZoneID()
    local ID = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    ------------------------------------------------------------------
    -- Basic chest var's
    ------------------------------------------------------------------
    local npc               = player:getEventTarget()
    local chestId           = npc:getID();
    local spawnStatus       = npc:getLocalVar("SPAWNSTATUS")
    local locked            = npc:getLocalVar("LOCKED")
    local lootType          = npc:getLocalVar("LOOT_TYPE")
    local eventBase         = zones[zoneId].npc.CASKET_BASE
    local lockedEvent       = casketInfo.cs[chestId - eventBase] + 2
    local unlockedEvent     = casketInfo.cs[chestId - eventBase]
    local lockedChoice      = bit.lshift(1, option -1)
    local inputNumber       = bit.rshift(option, 16)

    ----------------------------------------------------------------------
    -- Chest Locked var's
    ----------------------------------------------------------------------
    local correctNumber     = npc:getLocalVar("CORRECT_NUM")
    local currentAtempts    = npc:getLocalVar("CURRENT_ATEMPTS")
    local attemptsAllowed   = npc:getLocalVar("ATTEMPTS", attempts)
    local failedAtempts     = npc:getLocalVar("FAILED_ATEMPTS")
    local requiredGuesses   = npc:getLocalVar("REQUIREDGUESSES")
    local correctGuesses    = npc:getLocalVar("CORRECT_GUESSES")
    local remainingAttempts = attemptsAllowed - failedAtempts

    -- printf("option = %u ", option)
    ------------------------------------
    -- Minigame
    ------------------------------------

    local splitNumbers = {}

    for digit in string.gmatch(tostring(correctNumber), "%d") do
        table.insert(splitNumbers, digit)
    end

    if locked == 1 then
        if option > 0 and spawnStatus ~= casketInfo.spawnStatus.SPAWNED_CLOSED then -- prevent minigame from working if chest is opened.
            return
        end
        --------------------------------------------
        -- Hints
        --------------------------------------------
        if lockedChoice == 2 then
            if option == 258 then
                local randText = 0
                randText = math.random(1,7)

                if randText == 1 then
                    if isEven(splitNumbers[1]) == true then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 0, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_FIRST_EVEN_ODD, 1, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    end
                elseif randText == 2 then
                    if isEven(splitNumbers[2]) == true then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 0, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_SECOND_EVEN_ODD, 1, 0, 0, 0)
                        npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                        CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                    end
                elseif randText == 3 then
                    if tonumber(splitNumbers[1]) <= 6 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[1],
                            splitNumbers[1] +1,
                            splitNumbers[1] +2, 0)
                    elseif tonumber(splitNumbers[2]) == 9 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[2] -2,
                            splitNumbers[2] -1,
                            splitNumbers[2], 0)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.FIRST_DIGIT_IS,
                            splitNumbers[1] -1,
                            splitNumbers[1],
                            splitNumbers[1] +1, 0)
                    end
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 4 then
                    if tonumber(splitNumbers[2]) <= 6 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2],
                            splitNumbers[2] +1,
                            splitNumbers[2] +2, 0)
                    elseif tonumber(splitNumbers[2]) == 9 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2] -2,
                            splitNumbers[2] -1,
                            splitNumbers[2], 0)
                    else
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.SECOND_DIGIT_IS,
                            splitNumbers[2] -1,
                            splitNumbers[2],
                            splitNumbers[2] +1, 0)
                    end
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 5 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                        splitNumbers[1], 0, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 6 then
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.ONE_OF_TWO_DIGITS_IS,
                        splitNumbers[2], 0, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                elseif randText == 7 then
                    local highNum = 0
                    local lowNum  = 0
                    local rand = math.random(1,9)

                    if tonumber(splitNumbers[1]) == 1 then
                        lowNum  = 10
                        highNum = 20 + rand
                    elseif tonumber(splitNumbers[1]) > 1 and tonumber(splitNumbers[1]) < 9 then
                        lowNum  = tonumber(splitNumbers[1]) * 10 - 10 + rand
                        highNum = tonumber(splitNumbers[1]) * 10 + 10 + rand
                    elseif tonumber(splitNumbers[1]) == 9 then
                        lowNum  = 80 + rand
                        highNum = 99
                    end

                    player:messageSpecial(baseMessage + casketInfo.messageOffset.COMBINATION_GREATER_LESS, lowNum, highNum, 0, 0)
                    npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                    CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                else
                    player:messageSpecial(baseMessage + casketInfo.messageOffset.UNABLE_TO_GET_HINT, 0, 0, 0, 0)
                end
            end
        --------------------------------------------
        -- Inputs
        --------------------------------------------
        elseif lockedChoice == 1 then
            if inputNumber > 10 and inputNumber < 100 then
                local splitNumbers = {}

                for digit in string.gmatch(tostring(correctNumber), "%d") do
                    table.insert(splitNumbers,digit)
                end

                if inputNumber == correctNumber then
                    if locked == 0 then
                        player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                    else
                        MessageChest(player,"OPENED_LOCK",0 ,0, 0, 0, npc)
                        npc:setLocalVar("LOCKED", 0)

                        if npc:getLocalVar("SPAWNSTATUS") == casketInfo.spawnStatus.SPAWNED_CLOSED then  -- is the chest shut?, then open it.
                           npc:AnimationSub(1)
                           npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_OPEN)
                        end
                    end
                else
                    if inputNumber < correctNumber then
                        if locked == 0 then
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                        else
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 0, 0, 0, 0)
                            npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                            CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                        end
                    elseif inputNumber > correctNumber then
                        if locked == 0 then
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.NO_COMBINATION, 0, 0, 0, 0)
                        else
                            player:messageSpecial(baseMessage + casketInfo.messageOffset.HUNCH_GREATER_LESS, inputNumber, 1, 0, 0, 0)
                            npc:setLocalVar("FAILED_ATEMPTS", failedAtempts +1)
                            CheckRemainingAttempts(player, npc, remainingAttempts, correctNumber)
                        end
                    end
                end
            end
        end
    elseif locked == 0 then
        if lootType == 1 then
            if option == 65537 then
                GiveTempItem(player, npc, 1)
            elseif option == 65538 then
                GiveTempItem(player, npc, 2)
            elseif option == 65539 then
                GiveTempItem(player, npc, 3)
            end
        elseif lootType == 2 then
            if option == 65537 then
                GiveItem(player, npc, 1)
            elseif option == 65538 then
                GiveItem(player, npc, 2)
            elseif option == 65539 then
                GiveItem(player, npc, 3)
            elseif option == 65540 then
                GiveItem(player, npc, 4)
            end
        end
    end
end

----------------------------------------------------------------------
-- Casket data functions
----------------------------------------------------------------------
function SetCasketData(player, x, y, z, r, npc, partyID)
    ---------------------------------------------------------------------------------------------------
    -- NOTE: Super Kupowers Myriad Mystery Boxes add an additional 20% chance the chest will be locked.
    ---------------------------------------------------------------------------------------------------
    local kupowersMMB      = 0 -- Super Kupowers Myriad Mystery Boxes not implimented yet.
    local kupowersMMBPower = 0
    local typeChance       = math.random()
    local partyId          = partyID
    local chestId          = npc:getID()
    local chestStyle       = 965
    local correctNum       = math.random(11, 99)
    local attempts         = math.random(4, 6)

    --kupowersMMB = dsp.effect.KUPOWERS_MYRIAD_MYSTERY_BOXES

    --if player:hasStatusEffect(kupowersMMB) then
    --    kupowersMMBPower = 0.2
    --end

    if typeChance < 0.2 + kupowersMMBPower then
        chestStyle = 966 -- Brown locked
    else
        chestStyle = 965 -- Blue
    end

    if npc ~= nil then
        npc:resetLocalVars()
        npc:setAnimation(0)
        npc:AnimationSub(4)
        -------------------------------------
        -- Chest data
        -------------------------------------
        npc:setLocalVar("PARTYID", partyId)
        npc:setLocalVar("ITEMS_SET", 0)

        if chestStyle == 966 then
            npc:setLocalVar("ATTEMPTS", attempts)
            npc:setLocalVar("CORRECT_NUM", correctNum)
            npc:setLocalVar("FAILED_ATEMPTS", 0)
            npc:setLocalVar("LOCKED", 1)
            npc:setLocalVar("LOOT_TYPE", 2)
        else
            npc:setLocalVar("LOCKED", 0)
            npc:setLocalVar("LOOT_TYPE", 1)
        end

        npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.SPAWNED_CLOSED)
        npc:setLocalVar("SPAWNTIME", os.time())
        npc:setPos(x, y, z, r)
        npc:setStatus(dsp.status.NORMAL)
        npc:entityAnimationPacket("deru")
        SendChestDropMessage(player)
        npc:setModelId(chestStyle)
        -------------------------------------------------------
        -- Despawn chest after 3 Mins
        -------------------------------------------------------
        npc:timer(180000, function(npc)
            RemoveChest(player, npc)
        end)
    end
end

function GetDrops(npc, dropType, zoneId)
    local chestType = casketInfo.dropTypes[dropType]

    if npc:getLocalVar("ITEMS_SET") == 1 then
        return
    end

    ----------------------------------------------
    -- Temp drops
    ----------------------------------------------
    if chestType == "tempItems" then
        local temps        = {0, 0, 0}
        local tempCount    = 1
        local randomTable  = {1,3,1,2,1,1,1,1,3,1,2,1}

        tempCount = randomTable[math.random(1, #randomTable)]

        for i = 1, tempCount do
            local tempDrops = casketItems[zoneId].temps
            local sum = 0

            for k, v in pairs(tempDrops) do
                sum = sum + v[1]
            end

            local rand = math.random() * sum -- note: NOT math.random(sum). That will truncate the fractional part of sum
            local temp = 0

            for k, v in pairs(tempDrops) do
                rand = rand - v[1]
                if rand <= 0 then
                   temp = v[2]
                   break
                end
            end
            if temp == 0 or temp == nil then
                temps[i] = 4112 -- default to potion
            else
                temps[i] = temp
            end
        end
        SetTempItems(npc, temps[1], temps[2], temps[3])
    ----------------------------------------------
    -- Item drops
    ----------------------------------------------
    elseif chestType == "items" then
        local items        = {0, 0, 0, 0}
        local itemCount    = 1
        local randomTable  = {1,4,1,3,1,1,2,1,3,1,2,1}

        itemCount = randomTable[math.random(1, #randomTable)]

        for i = 1, itemCount do
            local drops = casketItems[zoneId].items
            local sum = 0

            for k, v in pairs(drops) do
                sum = sum + v[1]
            end

            local rand = math.random() * sum -- note: NOT math.random(sum). That will truncate the fractional part of sum
            local item = 0

            for k, v in pairs(drops) do
                rand = rand - v[1]
                if rand <= 0 then
                   item = v[2]
                   break
                end
            end
            if item == 0 or item == nil then
                items[i] = 4112 -- default to potion
            else
                if math.random() < 0.05 then
                    items[i] = casketItems[zoneId].regionalItems[math.random(1, #casketItems[zoneId].regionalItems)]
                else
                    items[i] = item
                end
            end
        end

        SetItems(npc, items[1], items[2], items[3], items[4])
    ----------------------------------------------
    -- Evolith drops
    ----------------------------------------------
    elseif chestType == "evolith" then
        local evolith = 2783
        -- NOTE: Not implimented yet and will be incorperated into items once implimented.
        -- this is mainly here as a means of testing before implimentation.
    end
end

function SendChestDropMessage(player)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local dropMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM + casketInfo.messageOffset.MONSTER_CONCEALED_CHEST
    local party       = {}

    party = player:getAlliance()

    for _,member in ipairs(party) do
        if member:getZoneID() == player:getZoneID() then
            member:messageSpecial(dropMessage , 0)
        end
    end
end

----------------------------------------------------------------------------------
-- Temp item functions
----------------------------------------------------------------------------------
function GetTempDrop(npc, tempNum)
    local query = string.format("TEMP" ..tempNum.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

function SetTempItems(npc, temp1, temp2, temp3)
    npc:setLocalVar("TEMP1", temp1)
    npc:setLocalVar("TEMP2", temp2)
    npc:setLocalVar("TEMP3", temp3)
    npc:setLocalVar("ITEMS_SET", 1)
end

function GiveTempItem(player, npc, tempNum)
    local tempQuery   = string.format("TEMP" ..tempNum.. "")
    local tempID      = npc:getLocalVar(tempQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("SPAWNSTATUS")

    if spawnStatus == casketInfo.spawnStatus.DESPAWNED then
        player:PrintToPlayer("The chest had already disappeared!", 13)
        return
    end

    if tempID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:hasItem(tempID, 3) then
            return player:messageSpecial(ID.text.ALREADY_POSSESS_TEMP)
        else
            if player:addTempItem(tempID) then
                MessageChest(player, "PLAYER_OBTAINS_TEMP_ITEM", tempID, 0, 0, 0)
                npc:setLocalVar(tempQuery, 0)
                CheckTempChestIsEmpty(player, npc)
            end
        end
    end
end

function CheckTempChestIsEmpty(player, npc)
    local temp1 = npc:getLocalVar("TEMP1")
    local temp2 = npc:getLocalVar("TEMP2")
    local temp3 = npc:getLocalVar("TEMP3")

    if temp1 == 0 and temp2 == 0 and temp3 == 0 then
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------------------
-- Basic item functions
----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
-- Desc: Returns an items id based on the the local variable i.e. npc:getLocalVariable("ITEM1").
------------------------------------------------------------------------------------------------
function GetChestItem(npc, slot)
    local query = string.format("ITEM" ..slot.. "")
    local var   = npc:getLocalVar(query)

    if var == nil then
        return 0
    else
        return var
    end
end

------------------------------------------------------------------------------------------------
-- Desc: Sets the items id in a local variable for the casket.
------------------------------------------------------------------------------------------------
function SetItems(npc, item1, item2, item3, item4)
    npc:setLocalVar("ITEM1", item1)
    npc:setLocalVar("ITEM2", item2)
    npc:setLocalVar("ITEM3", item3)
    npc:setLocalVar("ITEM4", item4)
    npc:setLocalVar("ITEMS_SET", 1)
end

------------------------------------------------------------------------------------------------
-- Desc: Gives the player the item from a casket based on the selection of the csid
------------------------------------------------------------------------------------------------
function GiveItem(player, npc, itemNum)
    local itemQuery   = string.format("ITEM" ..itemNum.. "")
    local itemID      = npc:getLocalVar(itemQuery)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local spawnStatus = npc:getLocalVar("SPAWNSTATUS")

    if spawnStatus == casketInfo.spawnStatus.DESPAWNED then
        player:PrintToPlayer("The chest had already disappeared!", 13)
        return
    end

    if itemID == 0 then
        player:messageSpecial(ID.text.UNABLE_TO_OBTAIN_ITEM)
        return
    else
        if player:getFreeSlotsCount() == 0 then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemID)
            return
        elseif player:getFreeSlotsCount() > 0 then
            if itemID ~= 0 then
                if MultipleItemCheck(itemID) == true then
                    if player:addItem(itemID, 33) then
                        MessageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                        CheckItemChestIsEmpty(player, npc)
                    end
                else
                    if player:addItem(itemID) then
                        MessageChest(player, "PLAYER_OBTAINS_ITEM", itemID, 0, 0, 0)
                        npc:setLocalVar(itemQuery, 0)
                         CheckItemChestIsEmpty(player, npc)
                    end
                end
            end
        end
    end
end

function MultipleItemCheck(itemId)
    local multiples = {1214, 1215, 1211, 1212, 1213, 1217, 1222, 1962}

    for i = 1, #multiples do
        if (itemId == multiples[i]) then
            return true
        end
    end
    return false
end

------------------------------------------------------------------------------------------------
-- Desc: Checks to see if all the items have been removed from the casket then removes it.
------------------------------------------------------------------------------------------------
function CheckItemChestIsEmpty(player, npc)
    local item1 = npc:getLocalVar("ITEM1")
    local item2 = npc:getLocalVar("ITEM2")
    local item3 = npc:getLocalVar("ITEM3")
    local item4 = npc:getLocalVar("ITEM4")

    if item1 == 0 and item2 == 0 and item3 == 0 and item4 == 0 then
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------
-- ******Additional Functions******
----------------------------------------------------------------------

----------------------------------------------------------------------
-- Desc: Messages sent to all players in a party in the zone
----------------------------------------------------------------------
function MessageChest(player, messageId, param1, param2, param3, param4, npc)
    local zoneId  = player:getZoneID()
    local ID      = zones[zoneId]
    local msgBase = 0

    if messageId == "UNABLE_TO_OPEN_LOCK" then
        msgBase = ID.text.UNABLE_TO_OPEN_LOCK

    elseif messageId == "OPENED_LOCK" then
        msgBase = ID.text.OPENED_LOCK

    elseif messageId == "PLAYER_OBTAINS_ITEM" then
        msgBase = ID.text.PLAYER_OBTAINS_ITEM

    elseif messageId == "PLAYER_OBTAINS_TEMP_ITEM" then
        msgBase = ID.text.PLAYER_OBTAINS_TEMP_ITEM
    end

    for _, member in pairs(player:getAlliance()) do
        if member:getZoneID() == player:getZoneID() then
            member:messageName(msgBase, player, param1, param2, param3, param4, nil)
        end
    end
end

----------------------------------------------------------------------------------
-- Desc: Despawn a chest and reset its local var's
----------------------------------------------------------------------------------
function RemoveChest(player, npc)
    local chestId  = npc:getID()

    npc:AnimationSub(0)
    npc:entityAnimationPacket("kesu")
    npc:setStatus(dsp.status.DISAPPEAR)
    npc:setLocalVar("SPAWNSTATUS", casketInfo.spawnStatus.DESPAWNED)
end

----------------------------------------------------------------------------------
-- Desc: Checks attempts and despawns the chest if all attempts have been used up.
----------------------------------------------------------------------------------
function CheckRemainingAttempts(player, npc, remaining, correctNumber)
    local zoneId      = player:getZoneID()
    local ID          = zones[zoneId]
    local baseMessage = ID.text.PLAYER_OBTAINS_TEMP_ITEM

    if remaining == 1 then
        player:messageSpecial(baseMessage + casketInfo.messageOffset.CORRECT_NUMBER_WAS, correctNumber, 0, 0, 0, 0)
        MessageChest(player, "UNABLE_TO_OPEN_LOCK", 0, 0, 0, 0, npc)
        RemoveChest(player, npc)
    end
end

----------------------------------------------------------------------------------
-- Desc: Checks number to see if they are even or not for the locked minigame.
----------------------------------------------------------------------------------
function isEven(number)
    if number % 2 == 0 then
        return true
    else
        return false
    end
end

----------------------------------------------------------------------------------
-- Desc: Helper function for making it easier to read time between spawns.
----------------------------------------------------------------------------------
function ConvertTime(rawTime)
   local rawSeconds = tonumber(rawTime)
   local timeTable = {0,0,0}

    timeTable[1] = string.format("%02.f", math.floor(rawSeconds/3600));
    timeTable[2] = string.format("%02.f", math.floor(rawSeconds/60 - (timeTable[1]*60)));
    timeTable[3] = string.format("%02.f", math.floor(rawSeconds - timeTable[1]*3600 - timeTable[2] *60));

    return timeTable
end