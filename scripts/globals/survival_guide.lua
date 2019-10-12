require("scripts/globals/settings")
require("scripts/globals/survival_guide_map")

dsp = dsp or {}
dsp.survival_guide = dsp.survival_guide or {}

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
    local returnValue = 1 + 2

    if (ENABLE_COP == 1) then returnValue = returnValue + 4 end

    if (ENABLE_TOAU == 1) then returnValue = returnValue + 8 end

    if (ENABLE_WOTG == 1) then returnValue = returnValue + 16 end

    if (ENABLE_SOA == 1) then returnValue = returnValue + 2048 end

    return returnValue
end

local function checkForRegisteredSurvivalGuide(player, guide, masks)
    local group = guide.group
    local currentZoneId = player:getZoneID()
    local mask = nil
    local variableSuffix = ''
    local hasRegisteredGuide = false

    if (guide.groupIndex == 32) then
        mask = masks[group + 4]
        variableSuffix = 'a'

        -- This turns negative in the database for int32 max
        hasRegisteredGuide = mask == (guide.groupMask * -1)
    else
        mask = masks[group]
        hasRegisteredGuide = (bit.band(mask, guide.groupMask) ~= 0)
    end

    if (not hasRegisteredGuide) then
        player:PrintToPlayer(
            'This guide hasn\'t been registered yet, registering this Survival Guide.',
            13)

        local updatedValue = mask + guide.groupMask

        if (variableSuffix == 'a') then
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

-------------------------------------------------
-- public functions
-------------------------------------------------

dsp.survival_guide.onTrigger = function(player, csid, index)
    local guide = survivalGuides[index]

    if (not (guide == nil) or not (ENABLE_ROV == 1)) then

        -- Contains the zone to include, this is a bit-wise value.
        local expansions = getEnabledExpansions()

        local masks = {
            [1] = player:getVar("SgTeleportMask1"),
            [2] = player:getVar("SgTeleportMask2"),
            [3] = player:getVar("SgTeleportMask3"),
            [4] = player:getVar("SgTeleportMask4"),
            [5] = player:getVar("SgTeleportMask1a"),
            [6] = player:getVar("SgTeleportMask2a"),
            [7] = player:getVar("SgTeleportMask3a")
        }
        -- If this survival guide hasn't been registered yet (saved to database) do that now.
        local foundRegisteredGuide = checkForRegisteredSurvivalGuide(player, guide, masks)

        if (foundRegisteredGuide) then
            -- param 1 = Favorites, this is broken yet, not sure how to fix this, don't really care right now either, the rest of it works (except for tabs).
            -- param 2 = current area - this is the zone index passed in, this means that the area won't show in the list of areas to teleport too.
            -- param 3 = gil, NOTE: The startEvent method probably needs to be updated to allow for a table so gil and valor_point (tabs) can be passed in too.
            -- param 4 = zones unlocked (group 1), set to -1 to enable all zones in the group.
            -- param 5 = Zones unlocked (group 2), set to -1 to enable all zones in the group.
            -- param 6 = Zones unlocked (group 3), set to -1 to enable all zones in the group.
            -- param 7 = zones unlocked (Zehrun mines and Eastern Adoulin), set to -1 to enable all zones in the group.
            -- param 8 = expansions available.
            -- NOTE: To allow teleportation to all zones, set all of the mask values to -1.
            player:startEvent(csid, -1, index, player:getGil(), masks[1] + masks[5],
                            masks[2] + masks[6], masks[3] + masks[7], masks[4],
                            expansions)
        end
    else
        player:PrintToPlayer('Survival guides are not enabled!')
    end

    return 1
end

dsp.survival_guide.onEventFinish = function(player, csid, eventId, option)
    if (option >= 1 and not (option == 7) and not (option == 65539) and csid ==
        eventId) then
        local selectedMenuId = bit.rshift(option, 16)

        if (selectedMenuId <= 97) then
            local guide = survivalGuides[selectedMenuId]

            if (not (guide == nil)) then
                -- This is the standard fare unless they have the Rhapsody in white which isn't implemented yet.
                local teleportCost = 1000

                if (CHEAPER_SURVIVAL_GUIDE_TELEPORT == 1) then
                    teleportCost = 100
                end

                player:delGil(teleportCost)

                player:setPos(guide.posX, guide.posY, guide.posZ, guide.posRot,
                              guide.zoneId)
            end
        end
    end
end
