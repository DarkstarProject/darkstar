------------------------------------
-- Beastmen Treasure side quests
-- https://ffxiclopedia.fandom.com/wiki/Beastmen_Treasure
------------------------------------
require('scripts/globals/keyitems')
require('scripts/globals/quests')
require('scripts/globals/status')
require('scripts/globals/weather')
------------------------------------
dsp = dsp or {}
dsp.beastmentreasure = dsp.beastmentreasure or {}

local zoneData = {
    -- Yuhtunga Jungle (Elshimo Lowlands)
    [123] =
    {
        statusvar = 'BMT_Lowlands_Status',
        qmvar = 'BMT_Lowlands_DigQM',
        mapid = dsp.ki.MAP_OF_THE_ELSHIMO_REGIONS,
        peddlestox =
        {
            id = 17281639,
            day = dsp.day.WINDSDAY
        },
        fetchitems =
        {
            1480, -- Mermaid Head
            1481, -- Mermaid Body
            1482, -- Mermaid Hands
            1483  -- Mermaid Tail
        },
        digsites =
        {
            [3]  = {id = 17281642, x = 83.726,   y = 448.329,  chest = 0},
            [4]  = {id = 17281643, x = -114.254, y = -125.471, chest = 1},
            [5]  = {id = 17281644, x = -300.823, y = 9.208,    chest = 2},
            [6]  = {id = 17281645, x = -539.311, y = 203.151,  chest = 3},
            [7]  = {id = 17281646, x = -577.734, y = -82.563,  chest = 4},
            [8]  = {id = 17281647, x = -361.835, y = -399.517, chest = 5},
            [9]  = {id = 17281648, x = -294.827, y = -453.237, chest = 6},
            [10] = {id = 17281649, x = 369.795,  y = 201.805,  chest = 7}
        },
        loot =
        {
            unique = {[14626] = 5}, -- Mermaid's Ring
            racial = {[887] = 3}    -- Coral Fragment
        }
    },
    -- Yhoator Jungle (Elshimo Uplands)
    [124] =
    {
        statusvar = 'BMT_Uplands_Status',
        qmvar = 'BMT_Uplands_DigQM',
        mapid = dsp.ki.MAP_OF_THE_ELSHIMO_REGIONS,
        peddlestox =
        {
            id = 17285685,
            day = dsp.day.LIGHTNINGDAY
        },
        fetchitems =
        {
            1484, -- Rancor Mantle
            1485, -- Rancor Globe
            1486, -- Rancor Tank
            1487  -- Rancor Handle
        },
        digsites =
        {
            [5]  = {id = 17285688, x = 80.52,    y = 200.147,  chest = 1},
            [6]  = {id = 17285689, x = 198.65,   y = 58.046,   chest = 2},
            [7]  = {id = 17285690, x = 205.932,  y = -174.886, chest = 3},
            [8]  = {id = 17285691, x = 525.239,  y = -394.046, chest = 4},
            [9]  = {id = 17285692, x = 240.341,  y = -402.532, chest = 5},
            [10] = {id = 17285693, x = 16.069,   y = -393.843, chest = 6},
            [11] = {id = 17285694, x = -255.358, y = -405.178, chest = 7},
            [4]  = {id = 17285695, x = -149.929, y = 56.761,   chest = 0}
        },
        loot =
        {
            unique = {[13400] = 5}, -- Bitter Earring
            racial = {[4158] = 3}   -- Venom Potion
        }
    },
    -- Western Altepa Desert (Kuzotz)
    [125] =
    {
        statusvar = 'BMT_Kuzotz_Status',
        qmvar = 'BMT_Kuzotz_DigQM',
        mapid = dsp.ki.MAP_OF_THE_KUZOTZ_REGION,
        peddlestox =
        {
            id = 17289769,
            day = dsp.day.EARTHSDAY
        },
        fetchitems =
        {
            1476, -- Xhifhut Strings
            1477, -- Xhifhut Body
            1478, -- Xhifhut Bow
            1479  -- Xhifhut Head
        },
        digsites =
        {
            [3]  = {id = 17289772, x = -197.901, y = 357.648,  chest = 0},
            [4]  = {id = 17289773, x = -113.454, y = -58.319,  chest = 1},
            [5]  = {id = 17289774, x = 3.302,    y = -250.435, chest = 2},
            [6]  = {id = 17289775, x = -476.967, y = 17.835,   chest = 3},
            [7]  = {id = 17289776, x = -454.701, y = -286.864, chest = 4},
            [8]  = {id = 17289777, x = -223.055, y = -672.207, chest = 5},
            [9]  = {id = 17289778, x = -631.524, y = -336.254, chest = 6},
            [10] = {id = 17289779, x = -670.697, y = -677.751, chest = 7}
        },
        loot =
        {
            unique = {[13655] = 5}, -- Sand Mantle
            racial = {[645] = 3}    -- Darksteel Ore
        }
    }
}

local sharedLoot = {
    -- All items are assigned a "weight" here
    rocksgems =
    {
        [769] = 1, -- Red rock
        [770] = 1, -- Blue rock
        [771] = 1, -- Yellow rock
        [772] = 1, -- Green rock
        [773] = 1, -- Translucent rock
        [774] = 1, -- Purple rock
        [775] = 1, -- Black rock
        [776] = 1, -- White rock
        -- Tier 1 gems
        [795] = 2, -- Lapis Lazuli (blue)
        [796] = 2, -- Light Opal   (white)
        [799] = 2, -- Onyx         (black)
        [800] = 2, -- Amethyst     (purple)
        [806] = 2, -- Tourmaline   (green)
        [807] = 2, -- Sardonyx     (red)
        [809] = 2, -- Clear Topaz  (translucent)
        [814] = 2, -- Amber        (yellow)
    },
    seeds =
    {
        [572] = 1, -- Herb seeds
        [573] = 1, -- Vegetable seeds
        [574] = 1, -- Fruit seeds
        [575] = 1, -- Grain seeds
    },
    coins =
    {
        [748] = 1, -- Gold beastcoin
        [749] = 1, -- Mythril beastcoin
        [750] = 1, -- Silver beastcoin
    },
    seals =
    {
        [1126] = 2 -- Beastmen's Seal
    }
}

local function convertToWeighted(loot)
    -- Takes a loot table formatted like the members of `sharedloot` and returns a weighted version that can be indexed
    local weightedLoot = {}

    for item, weight in pairs(loot) do
        for i = 1, weight do
            table.insert(weightedLoot, item)
        end
    end

    return weightedLoot
end

local function addLoot(t1, t2)
    -- Used for non-destructively combining a table containing a single weighted item (`t2`)
    -- and an existing loot table containing one or more weighted items (`t1`).
    newTable = {}
    newItem = table.maxn(t2)

    -- Copy the contents of the first table so that we don't modify the global version
    for item, weight in pairs(t1) do
        newTable[item] = weight
    end
    -- Add in our new item
    newTable[newItem] = t2[newItem]

    return newTable
end

-- Generate weighted loot tables now (on server init) so it doesn't have to be done at runtime
local w_rocksgems   = convertToWeighted(sharedLoot.rocksgems)
local w_seedsracial =
{
    [123] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[123].loot.racial)),
    [124] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[124].loot.racial)),
    [125] = convertToWeighted(addLoot(sharedLoot.seeds, zoneData[125].loot.racial))
}
local w_coins       = convertToWeighted(sharedLoot.coins)
local w_sealsunique =
{
    [123] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[123].loot.unique)),
    [124] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[124].loot.unique)),
    [125] = convertToWeighted(addLoot(sharedLoot.seals, zoneData[125].loot.unique)),
}

local function weightedRandomSelect(w_loot)
    -- Takes a weighted loot table and returns a single random result
    return w_loot[math.random(#w_loot)]
end

local function getRandomQm(digsites)
    --[[ We specify digsite indices in zoneData that correspond to their qm number.
    For example, zoneData[123].digsites[10] refers to qm10 in zone 123 (Yuhtunga Jungle).
    This has a few advantages, but it also makes the table nonconsecutive, which means Lua
    can't find its length without iteration. ]]--
    local qms = {}
    for qm in pairs(digsites) do
        table.insert(qms, qm)
    end
    return qms[math.random(#qms)]
end

local function getAssignedDigSite(player, zd)
    return zd.digsites[player:getVar(zd.qmvar)]
end

local function startMapMarkerEvent(eventid,player,zd)
    --[[ Map marker event notes:
        Event 101 creates the "Treasure" map marker using coordinate args
        Event 103 shows the "Treasure" map marker using coordinate args
        Event 105, played on excavation, deletes the "Treasure" map marker

        Parameters for events 101/103 are as follows:
            1: zone id
            2: unknown, seems static
            3: (x position of qm) * 1000
            4: (y position of qm) * 1000
            5: unknown, dynamic
            6: unknown, dynamic
            7: unknown, seems static
            8: unknown*, seems static (possibly z position of qm + 95)

        Example: `player:startEvent(101, 123, 0, 369795, 201805, 0, 0, 0, 4095)`
            ...plays event 101 in Yuhtunga Jungle (zone 123), which creates a map marker
            corresponding to the QM at position (369.795, 4.0, 201.805)
            Full args from a retail capture for this point were:
                101, 123, 32, 369795, 201805, 425920, 760, 529191, 4095
                103, 123, 32, 369795, 201805, 308060, 1694, 529191, 4095 ]]--
    local zoneid = player:getZoneID()
    local digsite = getAssignedDigSite(player, zd)

    player:startEvent(eventid, zoneid, 0, digsite.x * 1000, digsite.y * 1000)
end

dsp.beastmentreasure.handleNpcOnTrigger = function(player)
    local zd = zoneData[player:getZoneID()]
    local status = player:getVar(zd.statusvar)
    local hasMap = player:hasKeyItem(zd.mapid)

    if not hasMap then
        player:startEvent(102) -- Peddlestox lectures you for not having a map
    elseif status == QUEST_AVAILABLE then
        player:startEvent(100) -- Peddlestox says go fetch
    elseif status == QUEST_ACCEPTED then
        player:startEvent(104) -- "What do I look like, a charity?"
    elseif status == QUEST_COMPLETED then
        -- Note: Quest will be "completed" after trading the correct items,
        -- but will be set to available again after excavating the reward.
        startMapMarkerEvent(103,player,zd) -- Peddlestox reminds you where your digsite is
    end
end

dsp.beastmentreasure.handleNpcOnTrade = function(player,trade)
    local zd = zoneData[player:getZoneID()]
    local status = player:getVar(zd.statusvar)

    if status == QUEST_ACCEPTED and npcUtil.tradeHasExactly(trade, zd.fetchitems) then
        -- Select a random dig site from the zone and store the qm# as a player var
        player:setVar(zd.qmvar, getRandomQm(zd.digsites))

        startMapMarkerEvent(101,player,zd) -- Peddlestox shows you where to dig
    end
end

dsp.beastmentreasure.handleNpcOnEventFinish = function(player,csid)
    local zd = zoneData[player:getZoneID()]

    if csid == 100 then
        player:addVar(zd.statusvar, QUEST_ACCEPTED)
    elseif csid == 101 then
        player:confirmTrade()
        player:setVar(zd.statusvar, QUEST_COMPLETED)
    end
end

dsp.beastmentreasure.updatePeddlestox = function(zoneid)
    --[[ Allows Peddlestox to appear on the appropriate day and disappear when the day is over.
    This function is called by each of the three zones where Peddlestox can appear: once on init,
    and once at the start of each new game day. Since Peddlestox is disabled in the db by default, we
    only need to enable her on the appropriate day and disable her on the following day. ]]--
    local zd = zoneData[zoneid]
    local peddlestox = GetNPCByID(zd.peddlestox.id)
    local activeday = zd.peddlestox.day
    local today = VanadielDayElement()

    if today == activeday then
        peddlestox:setStatus(dsp.status.NORMAL)
    elseif peddlestox:getStatus() == dsp.status.NORMAL then
        --[[
        TODO: Peddlestox should play a teleport animation and then fade out. On retail this is an 0x03A
            packet with animation id 122. Currently 0x3A is not implemented in DSP. Retail capture of
            the correct animation packet is as follows:
             |  0  1  2  3   4  5  6  7   8  9  A  B   C  D  E  F    | 0123456789ABCDEF
        -----+----------------------------------------------------  -+------------------
           0 | 3A 0A B5 00  67 B2 07 01  67 B2 07 01  67 02 67 02    | :...g...g...g.g.
          10 | 7A 00 00 BF                                           | z...
            An incomplete but similar 0x38 animation can be achieved with `entityAnimationPacket("shwh")`
        ]]--
        peddlestox:setStatus(dsp.status.DISAPPEAR)
    end
end

dsp.beastmentreasure.handleQmOnTrigger = function(player,npc,buriedtext,nothingtext)
    local zd = zoneData[player:getZoneID()]
    local digsite = getAssignedDigSite(player, zd)
    local qmid = npc:getID()

    if digsite == nil or digsite.id ~= qmid then
        player:messageSpecial(nothingtext)
    elseif digsite.id == qmid then
        -- "It looks like something is buried here. If you had a <pickaxe> you could dig it up."
        player:messageSpecial(buriedtext, 605)
    end
end

dsp.beastmentreasure.handleQmOnTrade = function(player,npc,trade)
    local zoneid = player:getZoneID()
    local zd = zoneData[zoneid]
    local digsite = getAssignedDigSite(player, zd)

    if npcUtil.tradeHasExactly(trade, 605)
        and player:getVar(zd.statusvar) == QUEST_COMPLETED
        and npc:getID() == digsite.id then
            --[[ Event 105 needs args to spawn and animate a treasure chest
                 Example args from retail capture: 105 123 450762 1745 201805 7 723 490292 4095
                 An arg in the 5th parameter will spawn and animate a chest somewhere in the zone
                    based on some internal list in the game files. For example, an arg of 7, as
                    in the retail capture above, will spawn and animate a chest at Yuhtunga Jungle
                    qm10. Chests will spawn at a static location regardless of whether or not
                    coordinates are passed in, and will always be rotated to face the player.
            ]]--
            player:startEvent(105, zoneid, 0, 0, 0, digsite.chest)
    end
end

dsp.beastmentreasure.handleQmOnEventFinish = function(player,csid)
    local zoneid = player:getZoneID()
    local zd = zoneData[zoneid]

    if csid == 105 then
        -- Successfully excavating a dig site rewards 4000 gil plus the following items:
        -- First reward is 1 item from the rocks and gems pool
        local item1 = weightedRandomSelect(w_rocksgems)
        -- Second reward is 1 item from a pool containing seeds and the zone's "racial" junk
        local item2 = weightedRandomSelect(w_seedsracial[zoneid])
        -- Third reward is a silver, gold, or mythril beastcoin
        local item3 = weightedRandomSelect(w_coins)
        -- Final reward is a seal or the region's exclusive item
        local item4 = weightedRandomSelect(w_sealsunique[zoneid])
        -- Distribute rewards
        player:confirmTrade()
        player:addGil(4000)
        player:addTreasure(item1)
        player:addTreasure(item2)
        player:addTreasure(item3)
        player:addTreasure(item4)
        -- Reset player vars
        player:setVar(zd.statusvar, QUEST_AVAILABLE)
        player:setVar(zd.qmvar, 0)
    end
end

dsp.bmt = dsp.beastmentreasure
