-----------------------------------------
-- ID: 6539
-- Item: Altanas Repast +1
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- AoE:
-- STR+15
-- DEX+15
-- VIT+15
-- AGI+15
-- INT+15
-- MND+15
-- CHR+15
-- Accuracy+80
-- Attack+80
-- R. Accuracy+80
-- R. Attack+80
-- M. Accuracy+80
-- "M. Atk. Bonus"+15
-- "M. Def. Bonus"+4
-- Evasion+80
-- DEF+80
-- M. Evasion+80
-- "Store TP"+7
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
    target:forMembersInRange(30, function(member)
        if not member:hasStatusEffect(dsp.effect.FOOD) and not member:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) then
            member:addStatusEffect(dsp.effect.FOOD,0,0,10800,6539)
        end
    end)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 15)
    target:addMod(dsp.mod.DEX, 15)
    target:addMod(dsp.mod.VIT, 15)
    target:addMod(dsp.mod.AGI, 15)
    target:addMod(dsp.mod.INT, 15)
    target:addMod(dsp.mod.MND, 15)
    target:addMod(dsp.mod.CHR, 15)
    target:addMod(dsp.mod.ACC, 80)
    target:addMod(dsp.mod.ATT, 80)
    target:addMod(dsp.mod.RACC, 80)
    target:addMod(dsp.mod.RATT, 80)
    target:addMod(dsp.mod.MACC, 80)
    target:addMod(dsp.mod.MATT, 15)
    target:addMod(dsp.mod.MDEF, 4)
    target:addMod(dsp.mod.EVA, 80)
    target:addMod(dsp.mod.DEF, 80)
    target:addMod(dsp.mod.MEVA, 80)
    target:addMod(dsp.mod.STORETP, 7)
    target:addPetMod(dsp.mod.STR, 15)
    target:addPetMod(dsp.mod.DEX, 15)
    target:addPetMod(dsp.mod.VIT, 15)
    target:addPetMod(dsp.mod.AGI, 15)
    target:addPetMod(dsp.mod.INT, 15)
    target:addPetMod(dsp.mod.MND, 15)
    target:addPetMod(dsp.mod.CHR, 15)
    target:addPetMod(dsp.mod.ACC, 80)
    target:addPetMod(dsp.mod.ATT, 80)
    target:addPetMod(dsp.mod.RACC, 80)
    target:addPetMod(dsp.mod.RATT, 80)
    target:addPetMod(dsp.mod.MACC, 80)
    target:addPetMod(dsp.mod.MATT, 15)
    target:addPetMod(dsp.mod.MDEF, 4)
    target:addPetMod(dsp.mod.EVA, 80)
    target:addPetMod(dsp.mod.DEF, 80)
    target:addPetMod(dsp.mod.MEVA, 80)
    target:addPetMod(dsp.mod.STORETP, 7)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 15)
    target:delMod(dsp.mod.DEX, 15)
    target:delMod(dsp.mod.VIT, 15)
    target:delMod(dsp.mod.AGI, 15)
    target:delMod(dsp.mod.INT, 15)
    target:delMod(dsp.mod.MND, 15)
    target:delMod(dsp.mod.CHR, 15)
    target:delMod(dsp.mod.ACC, 80)
    target:delMod(dsp.mod.ATT, 80)
    target:delMod(dsp.mod.RACC, 80)
    target:delMod(dsp.mod.RATT, 80)
    target:delMod(dsp.mod.MACC, 80)
    target:delMod(dsp.mod.MATT, 15)
    target:delMod(dsp.mod.MDEF, 4)
    target:delMod(dsp.mod.EVA, 80)
    target:delMod(dsp.mod.DEF, 80)
    target:delMod(dsp.mod.MEVA, 80)
    target:delMod(dsp.mod.STORETP, 7)
    target:delPetMod(dsp.mod.STR, 15)
    target:delPetMod(dsp.mod.DEX, 15)
    target:delPetMod(dsp.mod.VIT, 15)
    target:delPetMod(dsp.mod.AGI, 15)
    target:delPetMod(dsp.mod.INT, 15)
    target:delPetMod(dsp.mod.MND, 15)
    target:delPetMod(dsp.mod.CHR, 15)
    target:delPetMod(dsp.mod.ACC, 80)
    target:delPetMod(dsp.mod.ATT, 80)
    target:delPetMod(dsp.mod.RACC, 80)
    target:delPetMod(dsp.mod.RATT, 80)
    target:delPetMod(dsp.mod.MACC, 80)
    target:delPetMod(dsp.mod.MATT, 15)
    target:delPetMod(dsp.mod.MDEF, 4)
    target:delPetMod(dsp.mod.EVA, 80)
    target:delPetMod(dsp.mod.DEF, 80)
    target:delPetMod(dsp.mod.MEVA, 80)
    target:delPetMod(dsp.mod.STORETP, 7)
end
