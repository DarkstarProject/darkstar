require("scripts/globals/settings")
require("scripts/globals/survival_guide_map")

dsp = dsp or {}
dsp.survivalGuide = dsp.survivalGuide or {}

-- Determines if the survival guide teleport cost is like if you had a Rhapsody in White key item. Does not affect UI! (Default: 0)
local SURVIVAL_GUIDE_TELEPORT_COST_GIL = 1000
local SURVIVAL_GUIDE_TELEPORT_COST_TABS = 50

-- This is used for the NationTeleport save/get
local travelType = dsp.teleport.type.SURVIVAL
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

local function checkForRegisteredSurvivalGuide(player, guide)
    local group = guide.group
    local mask = nil
    local variableSuffix = ''
    local hasRegisteredGuide = player:hasTeleport(travelType, guide.groupIndex - 1, guide.group - 1)

    if not hasRegisteredGuide then
        player:messageSpecial(zones[guide.zoneId].text.COMMON_SENSE_SURVIVAL)
        player:addTeleport(travelType, guide.groupIndex - 1, guide.group - 1)

        return false
    end

    return true
end

local function teleportMenuUpdate(player, option, teleportType, optionMap, var)
    local choice = bit.band(option, 0xFF)

    if choice >= optionMap.SET_MENU_LAYOUT or choice <= optionMap.REPLACE_FAVORITE then
        local favorites = player:getTeleportMenu(travelType)

        if choice ~= optionMap.TELEPORT_MENU then
            local index = bit.rshift(bit.lshift(option, 8), 24)

            if choice == optionMap.ADD_FAVORITE then
                local temp = 0
                for x = 1, 9 do
                    temp = favorites[x]
                    favorites[x] = index
                    index = temp
                end
            elseif choice == optionMap.REMOVE_FAVORITE then
                for x = 1, 9 do
                    if favorites[x] == index then
                        for x = x, 8 do
                            favorites[x] = favorites[x+1]
                        end
                        favorites[9] = -1
                        break
                    end
                end
            elseif choice == optionMap.REPLACE_FAVORITE then
                favorites[bit.rshift(option, 24) + 1] = index
            elseif choice == optionMap.SET_MENU_LAYOUT then
                favorites[10] = bit.rshift(option, 16) == 1 and 1 or 0
            end

            player:setTeleportMenu(travelType, favorites)
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

        -- If this survival guide hasn't been registered yet (saved to database) do that now.
        local foundRegisteredGuide = checkForRegisteredSurvivalGuide(player,
                                                                     guide)

        if foundRegisteredGuide then
            local param = bit.bor(tableIndex, bit.lshift(
                                      player:getCurrency("valor_point"), 16))

            local teleportMenu = player:getTeleportMenu(travelType)
            local G1,G2,G3,G4 = unpack(player:getTeleport(travelType))

            -- param 1 = Favorites and menu layout.
            -- param 2 = current area and player amount of tabs - this is the zone index passed in,
                -- this means that the area won't show in the list of areas to teleport to.
            -- param 3 = gil
            -- param 4 = zones unlocked (group 1), set to -1 to enable all zones in the group.
            -- param 5 = Zones unlocked (group 2), set to -1 to enable all zones in the group.
            -- param 6 = Zones unlocked (group 3), set to -1 to enable all zones in the group.
            -- param 7 = zones unlocked (Zehrun mines and Eastern Adoulin), set to -1 to enable all zones in the group.
            -- param 8 = expansions available.
            -- NOTE: To allow teleportation to all zones, set all of the mask values to -1.
            player:startEvent(cutsceneID, teleportMenu, param, player:getGil(), G1, G2, G3,G4, expansions)
        end
    else
        player:PrintToPlayer('Survival guides are not enabled!')
    end
end

dsp.survivalGuide.onEventUpdate = function(player, csid, option)
    teleportMenuUpdate(player, option, travelType, optionMap, tempMenuLayoutVar)
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

                -- If the player has the rhapsody in white, the cost is 10% of original gil or 20% of original tabs.
                -- GIL: 1000 -> 200
                -- TABS: 100 -> 10
                if (player:hasKeyItem(dsp.keyItem.RHAPSODY_IN_WHITE) == 1) then
                    teleportCostGil = teleportCostGil * .2
                    teleportCostTabs = teleportCostTabs * .1
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
