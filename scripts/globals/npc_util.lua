--[[
    Helper functions for common NPC tasks.
    
    npcUtil.pickNewPosition(npc, positionTable, allowCurrentPosition)
    npcUtil.giveItem(player, items)
    npcUtil.giveKeyItem(player, keyitems)
    npcUtil.completeQuest(player, area, quest, params)
    npcUtil.tradeHas(trade, items)
    npcUtil.genTmask(player,title)
    npcUtil.UpdateNPCSpawnPoint(id, minTime, maxTime, posTable, serverVar)
    npcUtil.fishingAnimation(npc, phaseDuration, func)
--]]
package.loaded["scripts/globals/settings"] = nil;
require("scripts/globals/settings");

npcUtil = {};

-- Picks a new position for an NPC and excluding the current position.
-- INPUT: npc = npcID, position = 2D table with coords: index, {x, y, z}
-- RETURN: table index
function npcUtil.pickNewPosition(npc, positionTable, allowCurrentPosition)
    local npc = GetNPCByID(npc);
    local positionIndex = 1; -- Default to position one in the table if it can't be found.
    local tableSize = 0;
    local newPosition = 0;
    allowCurrentPosition = allowCurrentPosition or false;

    for i, v in ipairs(positionTable) do   -- Looking for the current position

        if not allowCurrentPosition then
            -- Finding by comparing the NPC's coords
            if (math.floor(v[1]) == math.floor(npc:getXPos()) and math.floor(v[2]) == math.floor(npc:getYPos()) and math.floor(v[3]) == math.floor(npc:getZPos())) then
                positionIndex = i; -- Found where the NPC is!
            end
        end

        tableSize = tableSize + 1; -- Counting the array size
    end

    if not allowCurrentPosition then
        -- Pick a new pos that isn't the current
        repeat
            newPosition = math.random(1, tableSize);
        until (newPosition ~= positionIndex)
    else
        newPosition = math.random(1, tableSize);
    end

    return {["x"] = positionTable[newPosition][1], ["y"] = positionTable[newPosition][2], ["z"] = positionTable[newPosition][3]};
end;

--[[ *******************************************************************************
    Give item(s) to player.
    If player has inventory space, give items, display message, and return true.
    If not, do not give items, display a message to indicate this, and return false.
    
    Examples of valid items parameter:
        640                 -- copper ore x1
        { 640, 641 }        -- copper ore x1, tin ore x1
        { {640,2} }         -- copper ore x2
        { {640,2}, 641 }    -- copper ore x2, tin ore x1
******************************************************************************* --]]
function npcUtil.giveItem(player, items)
    -- require zone TextIDs
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

    -- create table of items, with key/val of itemId/itemQty
    local givenItems = {};
    local itemId;
    local itemQty;
    if (type(items) == "number") then
        table.insert(givenItems, {items,1});
    elseif (type(items) == "table") then
        for _, v in pairs(items) do
            if (type(v) == "number") then
                table.insert(givenItems, {v,1});
            elseif (type(v) == "table" and #v == 2 and type(v[1]) == "number" and type(v[2]) == "number") then
                table.insert(givenItems, {v[1],v[2]});
            else
                print(string.format("ERROR: invalid items parameter given to npcUtil.giveItem in zone %s.", player:getZoneName()));
                return false;
            end
        end
    end

    -- does player have enough inventory space?
    if (player:getFreeSlotsCount() < #givenItems) then
        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, givenItems[1][1]);
        return false;
    end

    -- give items to player
    for _, v in pairs(givenItems) do
        player:addItem(v[1], v[2]);
        player:messageSpecial(ITEM_OBTAINED, v[1]);
    end
    return true;
end

--[[ *******************************************************************************
    Give key item(s) to player.
    Message is displayed showing key items obtained.
    
    Examples of valid keyitems parameter:
        ZERUHN_REPORT
        {PALBOROUGH_MINES_LOGS}
        {BLUE_ACIDITY_TESTER, RED_ACIDITY_TESTER}
******************************************************************************* --]]
function npcUtil.giveKeyItem(player, keyitems)
    -- require zone TextIDs
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs);
    
    -- create table of keyitems
    local givenKeyItems = {};
    if (type(keyitems) == "number") then
        givenKeyItems = {keyitems};
    elseif (type(keyitems) == "table") then
        givenKeyItems = keyitems;
    else
        print(string.format("ERROR: invalid keyitems parameter given to npcUtil.giveKeyItem in zone %s.", player:getZoneName()));
        return false;
    end
    
    -- give key items to player, with message
    for _, v in pairs(givenKeyItems) do
        player:addKeyItem(v);
        player:messageSpecial(KEYITEM_OBTAINED,v);
    end
    return true;
end

--[[ *******************************************************************************
    Complete a quest.
    If quest rewards items, and the player cannot carry them, return false.
    Otherwise, return true.
    
    Example of usage with params (all params are optional):
        npcUtil.completeQuest(player, SANDORIA, ROSEL_THE_ARMORER, {
            item = { {640,2}, 641 },    -- see npcUtil.giveItem for formats
            keyItem = ZERUHN_REPORT,    -- see npcUtil.giveKeyItem for formats
            fame = 120,                 -- fame defaults to 30 if not set
            bayld = 500,
            gil = 200,
            xp = 1000,
            title = ENTRANCE_DENIED,
        });
******************************************************************************* --]]
function npcUtil.completeQuest(player, area, quest, params)
    params = params or {};

    -- load text ids
    local TextIDs = "scripts/zones/" .. player:getZoneName() .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs); 

    -- item(s) plus message. return false if player lacks inventory space.
    if (params["item"] ~= nil) then
        if (not npcUtil.giveItem(player, params["item"])) then
            return false;
        end
    end

    -- key item(s), fame, gil, bayld, xp, and title
    if (params["keyItem"] ~= nil) then
        npcUtil.giveKeyItem(player, params["keyItem"]);
    end

    if (params["fame"] == nil) then
        params["fame"] = 30;
    end
    if (area["fame_area"] ~= nil and type(params["fame"]) == "number") then
        player:addFame(area, params["fame"]);
    end

    if (params["gil"] ~= nil and type(params["gil"]) == "number") then
        player:addGil(params["gil"] * GIL_RATE);
        player:messageSpecial(GIL_OBTAINED, params["gil"] * GIL_RATE);
    end

    if (params["bayld"] ~= nil and type(params["bayld"]) == "number") then
        player:addCurrency('bayld', params["bayld"] * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, params["bayld"] * BAYLD_RATE);
    end

    if (params["xp"] ~= nil and type(params["xp"]) == "number") then
        player:addExp(params["xp"] * EXP_RATE);
    end

    if (params["title"] ~= nil) then
        player:addTitle(params["title"]);
    end

    -- successfully complete the quest
    player:completeQuest(area,quest);
    return true
end

--[[ *******************************************************************************
    check whether trade has all required items
        if yes, confirm all the items and return true
        if no, return false
        
    valid examples of items:
        640                     -- copper ore x1
        { 640, 641 }            -- copper ore x1, tin ore x1
        { 640, 640 }            -- copper ore x2
        { {640,2} }             -- copper ore x2
        { {640,2}, 641 }        -- copper ore x2, tin ore x1
        { 640, {"gil", 200} }   -- copper ore x1, gil x200
******************************************************************************* --]]
function npcUtil.tradeHas(trade, items, exact)
    if (type(exact) ~= "boolean") then exact = false; end

    -- create table of traded items, with key/val of itemId/itemQty
    local tradedItems = {};
    local itemId;
    local itemQty;
    for i = 0, trade:getSlotCount()-1 do
        itemId = trade:getItemId(i);
        itemQty = trade:getItemQty(itemId);
        tradedItems[itemId] = itemQty;
    end
    
    -- create table of needed items, with key/val of itemId/itemQty
    local neededItems = {};
    if (type(items) == "number") then
        neededItems[items] = 1;
    elseif (type(items) == "table") then
        local itemId;
        local itemQty;
        for _, v in pairs(items) do
            if (type(v) == "number") then
                itemId = v;
                itemQty = 1;
            elseif (type(v) == "table" and #v == 2 and type(v[1]) == "number" and type(v[2]) == "number") then
                itemId = v[1];
                itemQty = v[2];
            elseif (type(v) == "table" and #v == 2 and type(v[1]) == "string" and type(v[2]) == "number" and string.lower(v[1]) == "gil") then
                itemId = 65535;
                itemQty = v[2];
            else
                print("ERROR: invalid value contained within items parameter given to npcUtil.tradeHas.");
                itemId = nil;
            end
            if (itemId ~= nil) then
                neededItems[itemId] = (neededItems[itemId] == nil) and itemQty or neededItems[itemId] + itemQty;
            end
        end
    else
        print("ERROR: invalid items parameter given to npcUtil.tradeHas.");
        return false;
    end

    -- determine whether all needed items have been traded. return false if not.
    for k, v in pairs(neededItems) do
        local tradedQty = (tradedItems[k] == nil) and 0 or tradedItems[k];
        if (v > tradedQty) then
            return false;
        else
            tradedItems[k] = tradedQty - v;
        end
    end
    
    -- if an exact trade was requested, check if any excess items were traded. if so, return false.
    if (exact) then
        for k, v in pairs(tradedItems) do
            if (v > 0) then
                return false;
            end
        end
    end
    
    -- confirm items
    for k, v in pairs(neededItems) do
        trade:confirmItem(k,v)
    end
    return true;
end

--[[ *******************************************************************************
    check whether trade has exactly required items
        if yes, confirm all the items and return true
        if no, return false
        
    valid examples of items:
        640                     -- copper ore x1
        { 640, 641 }            -- copper ore x1, tin ore x1
        { 640, 640 }            -- copper ore x2
        { {640,2} }             -- copper ore x2
        { {640,2}, 641 }        -- copper ore x2, tin ore x1
        { 640, {"gil", 200} }   -- copper ore x1, gil x200
******************************************************************************* --]]
function npcUtil.tradeHasExactly(trade, items)
    return npcUtil.tradeHas(trade, items, true);
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

-----------------------------------
-- UpdateNPCSpawnPoint
----------------------------------

function npcUtil.UpdateNPCSpawnPoint(id, minTime, maxTime, posTable, serverVar)
    local npc = GetNPCByID(id);
    local respawnTime = math.random(minTime, maxTime);
    local newPosition = npcUtil.pickNewPosition(npc:getID(), posTable, true);
    serverVar = serverVar or nil; -- serverVar is optional

    if serverVar then
        if (GetServerVariable(serverVar) <= os.time(t)) then
            npc:hideNPC(1); -- hide so the NPC is not "moving" through the zone
            npc:setPos(newPosition.x, newPosition.y, newPosition.z);
        end
    end

    npc:timer(respawnTime * 1000, function(npc)
        npcUtil.UpdateNPCSpawnPoint(id, minTime, maxTime, posTable, serverVar);
    end)
end;

function npcUtil.fishingAnimation(npc, phaseDuration, func)
    func = func or function(npc)
        -- return true to not loop again
        return false
    end

    if func(npc) then
        return
    end
    npc:timer(phaseDuration * 1000, function(npc)
        local anims =
        {
            [ANIMATION_FISHING_NPC] = { duration = 5, nextAnim = { ANIMATION_FISHING_START } },
            [ANIMATION_FISHING_START] = { duration = 10, nextAnim = { ANIMATION_FISHING_FISH } },
            [ANIMATION_FISHING_FISH] = { duration = 10,
                                            nextAnim =
                                            {
                                                ANIMATION_FISHING_CAUGHT,
                                                ANIMATION_FISHING_ROD_BREAK,
                                                ANIMATION_FISHING_LINE_BREAK,
                                            }
                                       },
            [ANIMATION_FISHING_ROD_BREAK] = { duration = 3, nextAnim = { ANIMATION_FISHING_NPC } },
            [ANIMATION_FISHING_LINE_BREAK] = { duration = 3, nextAnim = { ANIMATION_FISHING_NPC } },
            [ANIMATION_FISHING_CAUGHT] = { duration = 5, nextAnim = { ANIMATION_FISHING_NPC } },
            [ANIMATION_FISHING_STOP] = { duration = 3, nextAnim = { ANIMATION_FISHING_NPC } },
        }

        local anim = anims[npc:getAnimation()]
        local nextAnimationId = ANIMATION_FISHING_NPC
        local nextAnimationDuration = 10
        local nextAnim = nil
        if anim then
            nextAnim = anim.nextAnim[math.random(1, #anim.nextAnim)]
        end

        if nextAnim then
            nextAnimationId = nextAnim
            if anims[nextAnimationId] then
                nextAnimationDuration = anims[nextAnimationId].duration
            end
        end
        npc:setAnimation(nextAnimationId)
        npcUtil.fishingAnimation(npc, nextAnimationDuration, func)
    end)
end