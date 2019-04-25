-----------------------------------------
-- ID: 5261
-- Psychoanima
-- Using a Psychoanima on an Empty foe in Promyvion will cause it to become fully intimidated for 30 seconds, 
-- stopping all of its regular physical attacks. TP abilities may still occur while Psychoanima is in effect. 
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
    target:addStatusEffect(dsp.effect.DOUBT,100, 0, math.random(20, 30))
end
