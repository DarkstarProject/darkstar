-----------------------------------------
-- ID: 11403
-- Item: Talaria
-- Enchantment: Increases movement speed.
-- Durration: 60 Mins
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_ENCHANTMENT) == false) then
        target:addStatusEffect(EFFECT_ENCHANTMENT,0,0,3600,11403);
    end;
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MOVE, 15);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MOVE, 15);
end;