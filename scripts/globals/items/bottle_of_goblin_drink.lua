-----------------------------------------
-- ID: 4541
-- Item: Goblin Drink
-- Item Effect: Restores 1 MP while healing / 3 tick 180 mins.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT.FOOD)) then
        target:addStatusEffect(EFFECT.FOOD, 1, 3, 10800, 4541);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;

function onEffectGain(target, effect)
end;

function onEffectTick(target, effect)
    if (target:hasStatusEffect(EFFECT.HEALING)) then
        target:addMP(effect:getPower());
    end;
end;

function onEffectLose(target, effect)
end;
