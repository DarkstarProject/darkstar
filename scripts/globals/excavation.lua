-------------------------------------------------
--    Excavation functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Excavation
-------------------------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/zone")
-------------------------------------------------

dsp = dsp or {}
dsp.excavation = dsp.excavation or {}

-------------------------------------------------
-- excavation drops by zone
-- [zoneId] = {itemid, drop rate, itemid, drop rate, ...}
-------------------------------------------------

local dropsByZone =
{
    [dsp.zone.ATTOHWA_CHASM]      = {880,0.2220,898,0.4440,891,0.5660,17396,0.6880,897,0.7600,896,0.8320,2503,0.8740,1236,0.9160,1473,0.9580,769,1.0000},
    [dsp.zone.TAHRONGI_CANYON]    = {880,0.2820,898,0.4840,891,0.6160,893,0.7660,17396,0.8870,897,0.9270,896,0.9550,885,0.9830,1888,1.0000},
    [dsp.zone.KORROLOKA_TUNNEL]   = {936,0.1820,888,0.3170,881,0.3570,864,0.5390,17395,0.7210,17397,0.8560,887,0.8680,573,0.8800,885,0.9200,575,0.9600,1985,1.0000},
    [dsp.zone.MAZE_OF_SHAKHRAMI]  = {880,0.3060,891,0.4870,17396,0.6680,893,0.7870,897,0.8430,896,0.8990,703,0.9220,769,0.9440,1888,1.0000},
}

-------------------------------------------------
-- Table of colored rocks. Do not reorder this table.
-------------------------------------------------

local rocks = {769,770,771,772,773,774,776,775}

-----------------------------------
-- Determine if Pickaxe breaks
-----------------------------------

local function doesToolBreak(player)
    local broke = false

    if math.random() < EXCAVATION_BREAK_CHANCE then
        broke = true
        player:tradeComplete()
    end

    return broke
end

-----------------------------------
-- Determine excavation reward
-- return itemId (0 for nothing)
-----------------------------------

local function getExcavationItem(zoneId)
    if math.random() <= (1 - EXCAVATION_RATE) then
        return 0
    else
        local drops = dropsByZone[zoneId]
        local rate = math.random()
        local item = 0

        -- pick item from weighted list
        for i = 1, #drops, 2 do
            if rate <= drops[i + 1] then
                item = drops[i]
                break
            end
        end

        -- if colored rock, set color by day
        if item == 769 then
            item = rocks[VanadielDayElement() + 1]
        end

        return item
    end
end

-----------------------------------
-- hide point and pick a new one
-----------------------------------

dsp.excavation.movePoint = function(currentPoint, zoneId)
    local points = zones[zoneId].npc.EXCAVATION

    if points then
        local newPointId = points[math.random(#points)]
        local newPoint = GetNPCByID(newPointId)

        if newPoint then
            currentPoint:setStatus(dsp.status.DISAPPEAR)
            newPoint:setStatus(dsp.status.NORMAL)
        end
    end
end

-----------------------------------
-- player trade to excavation point
-----------------------------------

dsp.excavation.onTrade = function(player, npc, trade, csid)
    local zoneId = player:getZoneID()

    -- trade includes pickaxe
    if npcUtil.tradeHas(trade, 605) then

        -- start excavation event
        local item = getExcavationItem(zoneId)
        local broke = doesToolBreak(player) and 1 or 0
        local full = (player:getFreeSlotsCount() == 0) and 1 or 0
        player:startEvent(csid, item, broke, full)

        -- on success, give item
        if item ~= 0 and full == 0 then
            player:addItem(item)

            -- decrement remaining uses of excavation point, and move when it reaches zero
            local uses = (npc:getLocalVar("uses") - 1) % 3
            npc:setLocalVar("uses", uses)
            if uses == 0 then
                dsp.excavation.movePoint(npc, zoneId)
            end
        end
        
    -- trade does not include pickaxe
    else
        player:messageSpecial(zones[zoneId].text.MINING_IS_POSSIBLE_HERE, 605)
    end
end