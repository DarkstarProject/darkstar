-----------------------------------------
-- ID: 4286
-- Item: cup_of_healing_tea
-- Food Effect: 240Min, All Races
-----------------------------------------
-- Magic 10
-- Vitality -1
-- Charisma 3
-- Magic Regen While Healing 2
-- Sleep resistance -40
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,14400,4286);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_MP, 10);
    target:addMod(MOD_VIT, -1);
    target:addMod(MOD_CHR, 3);
    target:addMod(MOD_MPHEAL, 2);
    target:addMod(MOD_SLEEPRES, -40);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MP, 10);
    target:delMod(MOD_VIT, -1);
    target:delMod(MOD_CHR, 3);
    target:delMod(MOD_MPHEAL, 2);
    target:delMod(MOD_SLEEPRES, -40);
end;
