-----------------------------------
--
-- EFFECT_FIELD_SUPPORT_FOOD
-- From FoV and GoV
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() == 1) then -- Dried Meat
        target:addMod(MOD_STR, 4);
        target:addMod(MOD_FOOD_ATTP, 22);
        target:addMod(MOD_FOOD_ATT_CAP, 63);
    elseif (effect:getPower() == 2) then -- Salted Fish
        target:addMod(MOD_VIT, 2);
        target:addMod(MOD_FOOD_DEFP, 30);
        target:addMod(MOD_FOOD_DEF_CAP, 86);
    elseif (effect:getPower() == 3) then -- Hard Cookie
        target:addMod(MOD_INT, 4);
        target:addMod(MOD_MP, 30);
    elseif (effect:getPower() == 4) then -- Instant Noodles
        target:addMod(MOD_VIT, 1);
        target:addMod(MOD_FOOD_HPP, 27);
        target:addMod(MOD_FOOD_HP_CAP, 75);
        target:addMod(MOD_STORETP, 5);
    elseif (effect:getPower() == 5) then -- Dried Agaricus
        target:addMod(MOD_MND, 4);
    elseif (effect:getPower() == 6) then -- Instant Rice
        target:addMod(MOD_CHR, 6);
    elseif (effect:getPower() == 255) then -- ACP Seed Goblin Saucepan Attack
        -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
        target:addMod(MOD_STR, -10);
        target:addMod(MOD_DEX, -10);
        target:addMod(MOD_VIT, -10);
        target:addMod(MOD_AGI, -10);
        target:addMod(MOD_INT, -10);
        target:addMod(MOD_MND, -10);
        target:addMod(MOD_CHR, -10);
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    if (effect:getPower() == 1) then -- Dried Meat
        target:delMod(MOD_STR, 4);
        target:delMod(MOD_FOOD_ATTP, 22);
        target:delMod(MOD_FOOD_ATT_CAP, 63);
    elseif (effect:getPower() == 2) then -- Salted Fish
        target:delMod(MOD_VIT, 2);
        target:delMod(MOD_FOOD_DEFP, 30);
        target:delMod(MOD_FOOD_DEF_CAP, 86);
    elseif (effect:getPower() == 3) then -- Hard Cookie
        target:delMod(MOD_INT, 4);
        target:delMod(MOD_MP, 30);
    elseif (effect:getPower() == 4) then -- Instant Noodles
        target:delMod(MOD_VIT, 1);
        target:delMod(MOD_FOOD_HPP, 27);
        target:delMod(MOD_FOOD_HP_CAP, 75);
        target:delMod(MOD_STORETP, 5);
    elseif (effect:getPower() == 5) then -- Dried Agaricus
        target:delMod(MOD_MND, 4);
    elseif (effect:getPower() == 6) then -- Instant Rice
        target:delMod(MOD_CHR, 6);
    elseif (effect:getPower() == 255) then -- ACP Seed Goblin Saucepan Attack
        -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
        target:delMod(MOD_STR, -10);
        target:delMod(MOD_DEX, -10);
        target:delMod(MOD_VIT, -10);
        target:delMod(MOD_AGI, -10);
        target:delMod(MOD_INT, -10);
        target:delMod(MOD_MND, -10);
        target:delMod(MOD_CHR, -10);
    end
end;