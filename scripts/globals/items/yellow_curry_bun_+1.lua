-----------------------------------------
-- ID: 5763
-- Item: yellow_curry_bun_+1
-- Food Effect: 60 min, All Races
-----------------------------------------
-- TODO: Group effects
-- Health Points 30
-- Strength 5
-- Vitality 2
-- Agility 3
-- Intelligence -2
-- Attack 22% (caps @ 85)
-- Ranged Attack 22% (caps @ 85)
-- Resist Sleep +5
-- Resist Stun +6
-- hHP +6
-- hMP +3
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,5763)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.STR, 5)
    target:addMod(dsp.mod.VIT, 2)
    target:addMod(dsp.mod.AGI, 3)
    target:addMod(dsp.mod.INT, -2)
    target:addMod(dsp.mod.FOOD_ATTP, 22)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:addMod(dsp.mod.FOOD_RATTP, 22)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:addMod(dsp.mod.SLEEPRES, 5)
    target:addMod(dsp.mod.STUNRES, 6)
    target:addMod(dsp.mod.HPHEAL, 6)
    target:addMod(dsp.mod.MPHEAL, 3)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.STR, 5)
    target:delMod(dsp.mod.VIT, 2)
    target:delMod(dsp.mod.AGI, 3)
    target:delMod(dsp.mod.INT, -2)
    target:delMod(dsp.mod.FOOD_ATTP, 22)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 85)
    target:delMod(dsp.mod.FOOD_RATTP, 22)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 85)
    target:delMod(dsp.mod.SLEEPRES, 5)
    target:delMod(dsp.mod.STUNRES, 6)
    target:delMod(dsp.mod.HPHEAL, 6)
    target:delMod(dsp.mod.MPHEAL, 3)
end
