-----------------------------------------
-- ID: 6263
-- Item: kusamochi+1
-- Food Effect: 60 Min, All Races
-----------------------------------------
-- HP + 30 (Pet & Master)
-- Vitality + 4 (Pet & Master)
-- Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
-- Ranged Attack + 21% Cap: 77 (Pet & Master) Pet Cap: 120
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
    target:addStatusEffect(dsp.effect.FOOD,0,0,3600,6263)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.HP, 30)
    target:addMod(dsp.mod.VIT, 4)
    target:addMod(dsp.mod.FOOD_ATTP, 21)
    target:addMod(dsp.mod.FOOD_ATT_CAP, 77)
    target:addMod(dsp.mod.FOOD_RATTP, 21)
    target:addMod(dsp.mod.FOOD_RATT_CAP, 77)
    target:addPetMod(dsp.mod.HP, 30)
    target:addPetMod(dsp.mod.VIT, 4)
    target:addPetMod(dsp.mod.FOOD_ATTP, 21)
    target:addPetMod(dsp.mod.FOOD_ATT_CAP, 120)
    target:addPetMod(dsp.mod.FOOD_RATTP, 21)
    target:addPetMod(dsp.mod.FOOD_RATT_CAP, 120)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.HP, 30)
    target:delMod(dsp.mod.VIT, 4)
    target:delMod(dsp.mod.FOOD_ATTP, 21)
    target:delMod(dsp.mod.FOOD_ATT_CAP, 77)
    target:delMod(dsp.mod.FOOD_RATTP, 21)
    target:delMod(dsp.mod.FOOD_RATT_CAP, 77)
    target:delPetMod(dsp.mod.HP, 30)
    target:delPetMod(dsp.mod.VIT, 4)
    target:delPetMod(dsp.mod.FOOD_ATTP, 21)
    target:delPetMod(dsp.mod.FOOD_ATT_CAP, 120)
    target:delPetMod(dsp.mod.FOOD_RATTP, 21)
    target:delPetMod(dsp.mod.FOOD_RATT_CAP, 120)
end
