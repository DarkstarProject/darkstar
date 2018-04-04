-----------------------------------------
-- ID: 4603
-- Item: cup_of_chamomile_tea
-- Food Effect: 180Min, All Races
-----------------------------------------
-- Magic 8
-- Vitality -2
-- Charisma 2
-- Magic Regen While Healing 1
-- Sleep resistance -30
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,10800,4603);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MP, 8);
    target:addMod(MOD_VIT, -2);
    target:addMod(MOD_CHR, 2);
    target:addMod(MOD_MPHEAL, 1);
    target:addMod(MOD_SLEEPRES, -30);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 8);
    target:delMod(MOD_VIT, -2);
    target:delMod(MOD_CHR, 2);
    target:delMod(MOD_MPHEAL, 1);
    target:delMod(MOD_SLEEPRES, -30);
end;
