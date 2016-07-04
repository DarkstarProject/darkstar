-----------------------------------------
-- ID: 4278
-- Item: Shogun Rice Ball
-- Food Effect: 60Min, All Races
-----------------------------------------
-- HP +20
-- Dex +4
-- Vit +4
-- Chr +4
-- Effect with enhancing equipment (Note: these are latents on gear with the effect) 
-- Atk +50
-- Def +30
-- Double Attack +5%
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(EFFECT_FOOD) == true or target:hasStatusEffect(EFFECT_FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addStatusEffect(EFFECT_FOOD,0,0,3600,4278);
end;

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 20);
    target:addMod(MOD_DEX, 4);
    target:addMod(MOD_VIT, 4);
    target:addMod(MOD_CHR, 4);

end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
    target:delMod(MOD_HP, 20);
    target:delMod(MOD_DEX, 4);
    target:delMod(MOD_VIT, 4);
    target:delMod(MOD_CHR, 4);
end;