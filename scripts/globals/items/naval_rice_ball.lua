-----------------------------------------
-- ID: 4605
-- Item: Naval Rice Ball
-- Food Effect: 30Min, All Races
-----------------------------------------
-- HP +12
-- Dex +3
-- Vit +3
-- hHP +2 
-- Effect with enhancing equipment (Note: these are latents on gear with the effect)
-- Atk +40
-- Def +40
-- Arcana Killer (guesstimated 5%)
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT.FOOD) == true or target:hasStatusEffect(EFFECT.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(EFFECT.FOOD,0,0,1800,4605);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_HP, 12);
    target:addMod(MOD_DEX, 3);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_HPHEAL, 2);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 12);
    target:delMod(MOD_DEX, 3);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_HPHEAL, 2);
end;