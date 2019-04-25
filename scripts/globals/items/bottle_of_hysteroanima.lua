-----------------------------------------
-- ID: 5262
-- Hysteroanima
-- Using a Hysteroanima on an Empty foe in Promyvion will prevent it from using any TP abilities for 30 seconds, similar to an Amnesia effect
-- Abilities will appear to be readied, but will not execute. Regular attacks may still be used. 
-----------------------------------------
require("scripts/globals/msg")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------------

function onItemCheck(target)
    local result = dsp.msg.basic.ITEM_UNABLE_TO_USE -- default result is fail
    local family = target:getSystem()
    local zone = target:getZoneID()
    local validZoneList =
            {
                16,17,18,19,20,21,22,23 -- only usable in Promyvion areas
            }

    for _, validZone in ipairs(validZoneList) do
        if validZone == zone and family == 12 then -- only useable on Empty family mobs
            return 0
        end
    end

    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.AMNESIA,100, 0, 30)
end
