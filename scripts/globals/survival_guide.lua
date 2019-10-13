require("scripts/globals/settings")
require("scripts/globals/survival_guide_map")

dsp = dsp or {}
dsp.survivalGuide = dsp.survivalGuide or {}

-- Determines if the survival guide teleport cost is like if you had a Rhapsody in White key item. Does not affect UI! (Default: 0)
local SURVIVAL_GUIDE_TELEPORT_COST_GIL = 1000
local SURVIVAL_GUIDE_TELEPORT_COST_TABS = 50

-- This is used for the NationTeleport save/get
local SURVIVALGUIDE = 9
local cutsceneID = 8500
local tempMenuLayoutVar = "SgMenuLayout"

local optionMap =
{
    TELEPORT = 1,
    UNKNOWN = 2,
    SET_MENU_LAYOUT = 3,
    ADD_FAVORITE = 4,
    REMOVE_FAVORITE = 5,
    REPLACE_FAVORITE = 6,
    TELEPORT_MENU = 7
}

-- Determines if the survival guide teleport cost is like if you had a Rhapsody in White key item. Does not affect UI! (Default: 0)
local SURVIVAL_GUIDE_TELEPORT_COST_GIL = 1000
local SURVIVAL_GUIDE_TELEPORT_COST_TABS = 50

-- This is used for the NationTeleport save/get
local SURVIVALGUIDE = 9
local cutsceneID = 8500
local tempMenuLayoutVar = "SgMenuLayout"

local optionMap =
{
    TELEPORT = 1,
    UNKNOWN = 2,
    SET_MENU_LAYOUT = 3,
    ADD_FAVORITE = 4,
    REMOVE_FAVORITE = 5,
    REPLACE_FAVORITE = 6,
    TELEPORT_MENU = 7
}

-------------------------------------------------
-- local functions
-------------------------------------------------

-- 1 = Original zones
-- 2 = Zilart Zones
-- 4 = Chains of Promethia Zones
-- 8 = Treasures of Aht Urgahn
-- 16 = Wings of the Goddess
-- 2048 = Seekers of Auldoin
local function getEnabledExpansions()
    -- Original areas and zilart are always available.
    local returnValue = 3

    if ENABLE_COP == 1 then returnValue = returnValue + 4 end

    if ENABLE_TOAU == 1 then returnValue = returnValue + 8 end

    if ENABLE_WOTG == 1 then returnValue = returnValue + 16 end

    if ENABLE_SOA == 1 then returnValue = returnValue + 2048 end

    return returnValue
end

local function checkForRegisteredSurvivalGuide(player, guide, masks, currentZoneId)
    local group = guide.group
    local mask = nil
    local variableSuffix = ''
    local hasRegisteredGuide = false

    if guide.groupIndex == 32 then
        mask = masks[group + 4]
        variableSuffix = 'a'

        -- This turns negative in the database for int32 max
        hasRegisteredGuide = mask == (guide.groupMask * -1)
    else
        mask = masks[group]
        hasRegisteredGuide = (bit.band(mask, guide.groupMask) ~= 0)
    end

    if not hasRegisteredGuide then
        player:messageSpecial(zones[guide.zoneId].text.COMMON_SENSE_SURVIVAL)

        local updatedValue = mask + guide.groupMask

        if variableSuffix == 'a' then
            updatedValue = guide.groupMask
            masks[group + 4] = updatedValue
        else
            masks[group] = updatedValue
        end

        player:setVar("SgTeleportMask" .. group .. variableSuffix, updatedValue)

        return false
    end

    return true
end

local function teleportMenuUpdate(player, option, teleportType, optionMap, var)
    local choice = bit.band(option, 0xFF)

    if choice == optionMap.SET_MENU_LAYOUT then
        if bit.rshift(option, 16) == 1 then
            -- Select by content/expansion
            player:setVar(var, 1)
        else
            -- Select by region
            player:setVar(var, 0)
        end
    elseif choice > optionMap.SET_MENU_LAYOUT then
        local favorites = player:getNationTeleport(teleportType + 2)

        if choice ~= optionMap.TELEPORT_MENU then
            local index = bit.rshift(bit.lshift(option, 8), 24)

            if choice == optionMap.ADD_FAVORITE then
                table.insert(favorites, 1, index)
            elseif choice == optionMap.REMOVE_FAVORITE then
                for x = 1, 9 do
                    if favorites[x] == index then
                        table.remove(favorites, x)
                        favorites[9] = 0xFF
                        break
                    end
                end
            elseif choice == optionMap.REPLACE_FAVORITE then
                table.remove(favorites, bit.rshift(option, 24) + 1)
                table.insert(favorites, 1, index)
            end

            player:addNationTeleport(teleportType + 2, 0, favorites)
        end

        for x = 1, 3 do
            favorites[1] = favorites[1] + favorites[x + 1] * 256 ^ x
            favorites[5] = favorites[5] + favorites[x + 5] * 256 ^ x
        end

        player:updateEvent(favorites[1], favorites[5], favorites[9])
    end
end

-------------------------------------------------
-- public functions
-------------------------------------------------

dsp.survivalGuide.onTrigger = function(player)
    local currentZoneId = player:getZoneID()
    local tableIndex = zoneIdToMenuID[currentZoneId]
    local guide = survivalGuides[tableIndex]

    if guide then
        -- Contains the zone to include, this is a bit-wise value.
        local expansions = getEnabledExpansions()

        local masks =
        {
            [1] = player:getVar("SgTeleportMask1"),
            [2] = player:getVar("SgTeleportMask2"),
            [3] = player:getVar("SgTeleportMask3"),
            [4] = player:getVar("SgTeleportMask4"),
            [5] = player:getVar("SgTeleportMask1a"),
            [6] = player:getVar("SgTeleportMask2a"),
            [7] = player:getVar("SgTeleportMask3a")
        }

        -- If this survival guide hasn't been registered yet (saved to database) do that now.
        local foundRegisteredGuide = checkForRegisteredSurvivalGuide(player,
                                                                     guide,
                                                                     masks,
                                                                     currentZoneId)

        if foundRegisteredGuide then
            local param = bit.bor(tableIndex, bit.lshift(
                                      player:getCurrency("valor_point"), 16))

            -- param 1 = Favorites, this is broken yet, not sure how to fix this, don't really care right now either, the rest of it works (except for tabs).
            -- param 2 = current area and player amount of tabs - this is the zone index passed in, this means that the area won't show in the list of areas to teleport too.
            -- param 3 = gil
            -- param 4 = zones unlocked (group 1), set to -1 to enable all zones in the group.
            -- param 5 = Zones unlocked (group 2), set to -1 to enable all zones in the group.
            -- param 6 = Zones unlocked (group 3), set to -1 to enable all zones in the group.
            -- param 7 = zones unlocked (Zehrun mines and Eastern Adoulin), set to -1 to enable all zones in the group.
            -- param 8 = expansions available.
            -- NOTE: To allow teleportation to all zones, set all of the mask values to -1.
            player:startEvent(cutsceneID, 0, param, player:getGil(),
                              masks[1] + masks[5], masks[2] + masks[6],
                              masks[3] + masks[7], masks[4], expansions)
        end
    else
        player:PrintToPlayer('Survival guides are not enabled!')
    end
end

dsp.survivalGuide.onEventUpdate = function(player, csid, option)
    -- This will be implemented after new nation teleport is created for homepoints since it will have a template to be followed.
    -- teleportMenuUpdate(player, option, SURVIVALGUIDE, optionMap, tempMenuLayoutVar)
end

dsp.survivalGuide.onEventFinish = function(player, eventId, option)
    if cutsceneID == eventId and option >= 1 and not (option == 7) and
        not (option == 65539) then
        local selectedMenuId = bit.rshift(option, 16)

        if selectedMenuId <= 97 then
            local guide = survivalGuides[selectedMenuId]

            if guide then
                local teleportCostGil = SURVIVAL_GUIDE_TELEPORT_COST_GIL
                local teleportCostTabs = SURVIVAL_GUIDE_TELEPORT_COST_TABS

                -- If the player has the rhapsody in white, the cost is 20% of base.
                if (player:hasKeyItem(dsp.keyItem.RHAPSODY_IN_WHITE) == 1) then
                    teleportCostGil = teleportCostGil * .2
                    teleportCostTabs = teleportCostTabs * .2
                end

                if bit.rshift(bit.lshift(option, 16), 24) == 1 then
                    -- Paying with tabs
                    player:delCurrency('valor_point', teleportCostTabs)
                else
                    player:delGil(teleportCostGil)
                end

                player:setPos(guide.posX, guide.posY, guide.posZ, guide.posRot,
                              guide.zoneId)
            end
        end
    end
end
