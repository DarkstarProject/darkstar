-----------------------------------------
-- ID: 5362
-- Rainbow Powder
-- When applied, it makes things invisible.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");

function onItemCheck(target)
    local result = 0;

    if (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
        result = 111;
    end

    return result;
end;

function onItemUse(target)
    local duration = 180;
    target:delStatusEffect(EFFECT_INVISIBLE);
    target:addStatusEffect(EFFECT_INVISIBLE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    target:addStatusEffect(EFFECT_MEDICINE,0,0,180);
end;
