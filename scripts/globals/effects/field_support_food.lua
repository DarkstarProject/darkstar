-----------------------------------
--
-- dsp.effect.FIELD_SUPPORT_FOOD
-- From FoV and GoV
-----------------------------------

function onEffectGain(target,effect)
    if (effect:getPower() == 1) then -- Dried Meat
        target:addMod(dsp.mod.STR, 4)
        target:addMod(dsp.mod.FOOD_ATTP, 22)
        target:addMod(dsp.mod.FOOD_ATT_CAP, 63)
    elseif (effect:getPower() == 2) then -- Salted Fish
        target:addMod(dsp.mod.VIT, 2)
        target:addMod(dsp.mod.FOOD_DEFP, 30)
        target:addMod(dsp.mod.FOOD_DEF_CAP, 86)
    elseif (effect:getPower() == 3) then -- Hard Cookie
        target:addMod(dsp.mod.INT, 4)
        target:addMod(dsp.mod.MP, 30)
    elseif (effect:getPower() == 4) then -- Instant Noodles
        target:addMod(dsp.mod.VIT, 1)
        target:addMod(dsp.mod.FOOD_HPP, 27)
        target:addMod(dsp.mod.FOOD_HP_CAP, 75)
        target:addMod(dsp.mod.STORETP, 5)
    elseif (effect:getPower() == 5) then -- Dried Agaricus
        target:addMod(dsp.mod.MND, 4)
    elseif (effect:getPower() == 6) then -- Instant Rice
        target:addMod(dsp.mod.CHR, 6)
    elseif (effect:getPower() == 255) then -- ACP Seed Goblin Saucepan Attack
        -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
        target:addMod(dsp.mod.STR, -10)
        target:addMod(dsp.mod.DEX, -10)
        target:addMod(dsp.mod.VIT, -10)
        target:addMod(dsp.mod.AGI, -10)
        target:addMod(dsp.mod.INT, -10)
        target:addMod(dsp.mod.MND, -10)
        target:addMod(dsp.mod.CHR, -10)
    end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    if (effect:getPower() == 1) then -- Dried Meat
        target:delMod(dsp.mod.STR, 4)
        target:delMod(dsp.mod.FOOD_ATTP, 22)
        target:delMod(dsp.mod.FOOD_ATT_CAP, 63)
    elseif (effect:getPower() == 2) then -- Salted Fish
        target:delMod(dsp.mod.VIT, 2)
        target:delMod(dsp.mod.FOOD_DEFP, 30)
        target:delMod(dsp.mod.FOOD_DEF_CAP, 86)
    elseif (effect:getPower() == 3) then -- Hard Cookie
        target:delMod(dsp.mod.INT, 4)
        target:delMod(dsp.mod.MP, 30)
    elseif (effect:getPower() == 4) then -- Instant Noodles
        target:delMod(dsp.mod.VIT, 1)
        target:delMod(dsp.mod.FOOD_HPP, 27)
        target:delMod(dsp.mod.FOOD_HP_CAP, 75)
        target:delMod(dsp.mod.STORETP, 5)
    elseif (effect:getPower() == 5) then -- Dried Agaricus
        target:delMod(dsp.mod.MND, 4)
    elseif (effect:getPower() == 6) then -- Instant Rice
        target:delMod(dsp.mod.CHR, 6)
    elseif (effect:getPower() == 255) then -- ACP Seed Goblin Saucepan Attack
        -- Based on info from http://www.bg-wiki.com/bg/Seed_Goblin
        target:delMod(dsp.mod.STR, -10)
        target:delMod(dsp.mod.DEX, -10)
        target:delMod(dsp.mod.VIT, -10)
        target:delMod(dsp.mod.AGI, -10)
        target:delMod(dsp.mod.INT, -10)
        target:delMod(dsp.mod.MND, -10)
        target:delMod(dsp.mod.CHR, -10)
    end
end