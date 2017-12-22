-----------------------------------------
-- ID: 4165
-- Silent oil
-- This lubricant cuts down 99.99% of all friction
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local duration = math.random(60, 180);
    if (not target:hasStatusEffect(EFFECT_SNEAK)) then
        target:addStatusEffect(EFFECT_SNEAK, 1, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    end
end;
