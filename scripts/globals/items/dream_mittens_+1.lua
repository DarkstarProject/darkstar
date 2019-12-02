-----------------------------------------
-- ID: 10383
-- Item: Dream Mittens +1
-- Enchantment: Invisible
-- Duration: 3 Mins 20 Secs
-- TODO: Enhances duration of Invisible Effect
-----------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    if (not target:hasStatusEffect(tpz.effect.INVISIBLE)) then
        target:addStatusEffect(tpz.effect.INVISIBLE, 0, 10, math.floor(200 * SNEAK_INVIS_DURATION_MULTIPLIER))
    end
end
