-----------------------------------------
-- ID: 6262
-- Item: kusamochi
-- Food Effect: 30 Min, All Races
-----------------------------------------
-- HP + 20 (Pet & Master)
-- Vitality + 3 (Pet & Master)
-- Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
-- Ranged Attack + 20% Cap: 72 (Pet & Master) Pet Cap: 113
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if (target:hasStatusEffect(dsp.effect.FOOD) or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        result = dsp.msg.basic.IS_FULL
    end
    return result
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,1800,6262)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 20)
    target:addMod(dsp.mod.VIT, 3)
    target:addMod(dsp.mod.FOOD_ATTP, 20)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 72)
    target:addMod(dsp.mod.FOOD_RATTP, 20)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 72)
    target:addPetMod(dsp.mod.HP, 20)
    target:addPetMod(dsp.mod.VIT, 3)
    target:addPetMod(dsp.mod.FOOD_ATTP, 20)
    target:addPetMod(dsp.mod.FOOD_ATT_CAP, 113)
    target:addPetMod(dsp.mod.FOOD_RATTP, 20)
    target:addPetMod(dsp.mod.FOOD_RATT_CAP, 113)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 20)
    target:delMod(dsp.mod.VIT, 3)
    target:delMod(dsp.mod.FOOD_ATTP, 20)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 72)
    target:delMod(dsp.mod.FOOD_RATTP, 20)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 72)
    target:delPetMod(dsp.mod.HP, 20)
    target:delPetMod(dsp.mod.VIT, 3)
    target:delPetMod(dsp.mod.FOOD_ATTP, 20)
    target:delPetMod(dsp.mod.FOOD_ATT_CAP, 113)
    target:delPetMod(dsp.mod.FOOD_RATTP, 20)
    target:delPetMod(dsp.mod.FOOD_RATT_CAP, 113)
end
