package.loaded["scripts/globals/settings"] = nil;


-- Provides helper methods for npcs
npcUtil = {};

-- Picks a new position for an NPC and excluding the current position.
-- INPUT: npc = npcID, position = 2D table with coords: index, {x, y, z}
-- RETURN: table index
function npcUtil.pickNewPosition(npc, positionTable)

    local npc = GetNPCByID(npc)
    local positionIndex = 1 -- Default to position one in the table if it can't be found.
    local tableSize = 0
    for i, v in ipairs(positionTable) do   -- Looking for the current position

        -- Finding by comparing the NPC's coords
        if (math.floor(v[1]) == math.floor(npc:getXPos()) and math.floor(v[2]) == math.floor(npc:getYPos()) and math.floor(v[3]) == math.floor(npc:getZPos())) then
            positionIndex = i; -- Found where the NPC is!
        end
        tableSize = tableSize + 1; -- Counting the array size
    end

    -- Pick a new pos that isn't the current
    local newPosition = positionIndex
    repeat
        newPosition = math.random(1, tableSize)
    until (newPosition ~= positionIndex)
    return newPosition
end

-- give gil to player with message and multiplied gil
-- npcUtil.giveGil(player, 200)
-- npcUtil.giveGil(player, 1000, {rate=false})
function npcUtil.giveGil(player, amount, options)

    local total = amount;

    -- don't give bonus gil if rate is false
    if (options == nil or options["rate"] == true) then
        total = total * GIL_RATE
    end

    player:addGil(total);
    player:messageSpecial(GIL_OBTAINED,total);
end

-- give key item to player with message
-- npcUtil.giveKeyItem(player, MARK_OF_ZAHAK)
function npcUtil.giveKeyItem(player, keyitem)
    player:addKeyItem(keyitem);
    player:messageSpecial(KEYITEM_OBTAINED,keyitem);
end

-- give items to player with message
-- will fail if not enough slots are available
-- npcUtil.giveItem(player, {{927, 5}, 927})
---
--- Usage:
--- if (npcUtil.giveItem(player, 927)) then
---    -- player got items with message!
--- else
---    -- player did not get items and got a could not obtain msg
--- end
function npcUtil.giveItem(player, items)
    local freeSlots = player:getFreeSlotsCount()

    if (type(items) == "number") then
        items = {items}
    end

    if (freeSlots < table.getn(items)) then

        local msg = nil;

        -- find right message
        if (ITEM_CANNOT_BE_OBTAINED_2 ~= nil) then
            msg = ITEM_CANNOT_BE_OBTAINED_2
        elseif (ITEM_CANNOT_BE_OBTAINED_3 ~= nil) then
            msg = ITEM_CANNOT_BE_OBTAINED_3
        elseif (ITEM_CANNOT_BE_OBTAINED_1 ~= nil) then
            msg = ITEM_CANNOT_BE_OBTAINED_1
        elseif (ITEM_CANNOT_BE_OBTAINED ~= nil) then
            msg = ITEM_CANNOT_BE_OBTAINED
        end

        player:messageSpecial(msg, items[1]);

        return false;
    end

    local itemId = 0;

    for k, v in pairs(items) do
        if (type(v) == "number") then
            itemId = v;
            player:addItem(v, 1);
        else
            -- add amount
            itemId = v[1];
            player:addItem(itemId, v[2]);
        end
    end

    player:messageSpecial(ITEM_OBTAINED, itemId);

    return true
end

-- Complete a quest
-- This can return false if player could not recieve items
-- Fame defaults to 30
-- all params in table are optional
--
-- npcUtil.completeQuest(player, SANDORIA, ROSEL_THE_ARMORER, {
--            title= ENTRANCE_DENIED,
--            gil= 200,
--            fame=120,
--            keyItem=100,
--             item={927, 927}
--            });
function npcUtil.completeQuest(player, area, quest, options)

    options = options or {}

    if (options["item"] ~= nil) then
        if (npcUtil.giveItem(player, options["item"]) == false) then
            return false
        end
    end

    if (options["title"] ~= nil) then
        player:addTitle(options["title"])
    end


    if (options["gil"] ~= nil) then
        npcUtil.giveGil(player, options["gil"])
    end

    if (options["keyItem"] ~= nil) then
        npcUtil.giveKeyItem(player, options["keyItem"])
    end

    -- default to 30
    if (options["fame"] == nil) then
        options["fame"] = 30;
    end

    player:addFame(area, options["fame"])

    player:completeQuest(area,quest)

    return true
end

-- returns true if the trade conditions are met
-- npcUtil.tradeHas(trade, 532)
-- npcUtil.tradeHas(trade, {532, 927})
-- npcUtil.tradeHas(trade, nil, 5)
function npcUtil.tradeHas(trade, items, gil)
    local itemCount = {};

    if (gil ~= nil and trade:getGil() ~= gil) then
        -- given wrong armound of gil
        return false;
    elseif (trade:getGil() ~= 0 and gil == nil) then
        -- given gil when I don't want it
            return false;
    end

    if (items ~= nil) then

        if (type(items) == "number") then
            items = {items}
        end

        -- given different amount of items
        if (trade:getItemCount() ~= table.getn(items)) then
            return false;
        end

        for k, v in pairs(items) do
            if (itemCount[k] == nil) then
                itemCount[k] = 1;
            else
                itemCount[k] = itemCount[k] + 1
            end

            if (trade:hasItemQty(k, itemCount[k]) == false) then
                -- don't have the right amount of item
                return false;
            end
        end
    end

    return true;
end

function npcUtil.genTmask(player,title)
    local val1 = 0

    for i = 1, #title do
        if (title[i] == 0 or player:hasTitle(title[i]) ~= true) then
            val1 = bit.bor(val1, bit.lshift(1, i))
        end
    end

    return val1
end