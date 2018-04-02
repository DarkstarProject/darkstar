-----------------------------------------
-- ID: 5718
-- Item: Cream Puff
-- Food Effect: 30 mintutes, All Races
-----------------------------------------
-- Intelligence +7
-- HP -10
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effects.FOOD) == true or target:hasStatusEffect(dsp.effects.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
   target:addStatusEffect(dsp.effects.FOOD,0,0,1800,5718);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_INT, 7);
   target:addMod(MOD_HP, -10);
end;

function onEffectLose(target, effect)
   target:delMod(MOD_INT, 7);
   target:delMod(MOD_HP, -10);
end;
