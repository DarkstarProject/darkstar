----------------------------------------------
-- Global functionality for Ephemeral Moogles
----------------------------------------------
require("scripts/globals/npc_util")
----------------------------------------------

dsp = dsp or {}

dsp.ephemeral = {}

local crystalData =
{
    { crystal = 4096, cluster = 4104, tradeparam = 1, eventparam = 1, offset = 0, name = "fire_crystals" }, -- Fire Crystal
    { crystal = 4097, cluster = 4105, tradeparam = 2, eventparam = 1, offset = 16, name = "ice_crystals" }, -- Ice Crystal
    { crystal = 4098, cluster = 4106, tradeparam = 3, eventparam = 2, offset = 0, name = "wind_crystals" }, -- Wind Crystal
    { crystal = 4099, cluster = 4107, tradeparam = 4, eventparam = 2, offset = 16, name = "earth_crystals" }, -- Earth Crystal
    { crystal = 4100, cluster = 4108, tradeparam = 5, eventparam = 3, offset = 0, name = "lightning_crystals" }, -- Lightning Crystal
    { crystal = 4101, cluster = 4109, tradeparam = 6, eventparam = 3, offset = 16, name = "water_crystals" }, -- Water Crystal
    { crystal = 4102, cluster = 4110, tradeparam = 7, eventparam = 4, offset = 0, name = "light_crystals" }, -- Light Crystal
    { crystal = 4103, cluster = 4111, tradeparam = 8, eventparam = 4, offset = 16, name = "dark_crystals" }, -- Dark Crystal
}

-- NOTE: Moogle IDs need to match npc_list ref table
local moogles =
{
    [17719927] = { triggerEvent = 3549, tradeEvent = 3550 }, -- South Sandy - Leatherworking
    [17723846] = { triggerEvent = 913, tradeEvent = 915 },   -- North Sandy - Woodworking
    [17723847] = { triggerEvent = 914, tradeEvent = 916 },   -- North Sandy - Smithing
    [17740167] = { triggerEvent = 617, tradeEvent = 618 },   -- Bastok Markets - Goldsmith
    [17736015] = { triggerEvent = 617, tradeEvent = 618 },   -- Bastok Mines - Alchemy
    [17752531] = { triggerEvent = 1098, tradeEvent = 1099 }, -- Windurst Waters - Cooking
    [17764826] = { triggerEvent = 895, tradeEvent = 897 },   -- Windurst Woods - Boneworking
    [17764827] = { triggerEvent = 896, tradeEvent = 898 },   -- Windurst Woods - Clothcraft
}

function getCrystalTotals(player)
    local params = { 0, 0, 0, 0 }
    for _, v in pairs(crystalData) do
        params[v.eventparam] = bit.bor(params[v.eventparam], bit.lshift(player:getCurrency(v.name), v.offset))
    end
    return params
end

dsp.ephemeral.onTrade = function(player, npc, trade)
    local params = { 0, 0, 0, 0, 0, 0, 0, 0 }
    local success = false
    for _, v in pairs(crystalData) do
        if npcUtil.tradeHas(trade, v.crystal) or npcUtil.tradeHas(trade, v.cluster) then
            -- Count normal crystals and confirm
            local qty = trade:getItemQty(v.crystal)
            if qty > 0 then trade:confirmItem(v.crystal, qty) end

            -- Count clusters and confirm
            local hqQty = trade:getItemQty(v.cluster)
            if hqQty > 0 then trade:confirmItem(v.cluster, hqQty) end

            -- Calculate the params
            params[v.tradeparam] = bit.bor(hqQty, bit.lshift(qty, 16))

            -- Calculate total and add to player
            local total = qty + hqQty * 12
            player:addCurrency(v.name, total)

            -- Found something valid in the trade
            success = true
        end
    end

    if success then
        local moogleID = npc:getID()
        player:startEvent(moogles[moogleID].tradeEvent, unpack(params))
    end
end

dsp.ephemeral.onTrigger = function(player, npc)
    local moogleID = npc:getID()
    player:startEvent(moogles[moogleID].triggerEvent, unpack(getCrystalTotals(player)))
end

dsp.ephemeral.onEventUpdate = function(player)
    player:updateEvent(unpack(getCrystalTotals(player)))
end

dsp.ephemeral.onEventFinish = function(player, csid, option)
    -- Early out if the player cancelled the menu
    if option == 0x40000000 then
        return
    end

    -- Loop through and figure out if this was a trade or a trigger
    for _, v in pairs(moogles) do
        if csid == v.triggerEvent then -- Give player the number of requested crystals
            -- Grab the crystal type and quantities
            local index = bit.band(bit.rshift(option, 16), 0xFF)
            local quantity = bit.band(option, 0xFFFF)
            local crystals = quantity % 12
            local clusters = math.floor(quantity / 12)

             -- Player selected "as many as can fit"
            if (option > 0x80000000) then
                -- Recalculate the quantity according to open inventory slots
                local freeSlots = player:getFreeSlotsCount()
                if freeSlots > 0 then -- If we don't have any free slots, don't bother. Just fail later.
                    local clusterStacks = math.ceil(clusters / 12)

                    -- If we don't have room for everything, drop the extra crystals first
                    if (clusterStacks + math.ceil(crystals / 12)) > freeSlots then
                        crystals = 0
                    end

                    -- Pick the the smaller of the cluster stacks and free slots
                    clusterStacks = math.min(clusterStacks, freeSlots)

                    -- Original number of clusters could have an incomplete stack
                    clusters = math.min(clusters, clusterStacks * 12)
                end
            end

            local totalToRemove = 0

            -- Clusters first
            if npcUtil.giveItem(player, { { crystalData[index].cluster, clusters } }) then
                totalToRemove = clusters * 12
            end

            -- Then Crystals
            if crystals > 0 then
                if npcUtil.giveItem(player, { { crystalData[index].crystal, crystals } }) then
                    totalToRemove = totalToRemove + crystals
                end
            end

            -- Crystals were added. Remove them from char_points
            if totalToRemove > 0 then
                player:delCurrency(crystalData[index].name, totalToRemove)
            end

            break
        elseif csid == v.tradeEvent then
            -- Add crystals to the database
            player:confirmTrade()
            break
        end
    end
end