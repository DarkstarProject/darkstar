-----------------------------------------
-- ID: 5934
-- Item: Chocobiscuit
-- Food Effect: 3Min, All Races
-----------------------------------------
-- Magic Regen While Healing 3
-- Charisma 3
-- Evasion 2
-- Aquan Killer 10
-- Silence Resist 10
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
    target:addStatusEffect(dsp.effects.FOOD,0,0,180,5934);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_MPHEAL, 3);
    target:addMod(MOD_CHR, 3);
    target:addMod(MOD_EVA, 2);
    target:addMod(MOD_AQUAN_KILLER, 10);
    target:addMod(MOD_SILENCERES, 10);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_MPHEAL, 3);
    target:delMod(MOD_CHR, 3);
    target:delMod(MOD_EVA, 2);
    target:delMod(MOD_AQUAN_KILLER, 10);
    target:delMod(MOD_SILENCERES, 10);
end;
