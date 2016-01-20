-----------------------------------------
-- ID: 4541
-- Item: Goblin Drink
-- Item Effect: Restores 1 MP while healing / 3 tick 180 mins.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (target:hasStatusEffect(EFFECT_FOOD) == false) then
        target:addStatusEffect(EFFECT_FOOD, 1, 3, 10800, 4541);
    else
        target:messageBasic(423);
    end
end;

function onEffectGain(target, effect)

end;

function onEffectTick(target, effect)
    if target:hasStatusEffect(EFFECT_HEALING) then
        target:addMP(effect:getPower());
     end;
end;

function onEffectLose(target, effect)

end;