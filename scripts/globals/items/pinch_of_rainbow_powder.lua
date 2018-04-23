-----------------------------------------
-- ID: 5362
-- Rainbow Powder
-- When applied, it makes things invisible.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effects.MEDICINE)) then
        return msgBasic.ITEM_NO_USE_MEDICATED;
    end
    return 0;
end;

function onItemUse(target)
    local duration = 180;
    target:delStatusEffect(dsp.effects.INVISIBLE);
    target:addStatusEffect(dsp.effects.INVISIBLE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    target:addStatusEffect(dsp.effects.MEDICINE,0,0,180);
end;
