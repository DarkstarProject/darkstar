-----------------------------------------
-- ID: 6538
-- Item: Altanas Repast
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- AoE:
-- STR+10
-- DEX+10
-- VIT+10
-- AGI+10
-- INT+10
-- MND+10
-- CHR+10
-- Accuracy+70
-- Attack+70
-- R. Accuracy+70
-- R. Attack+70
-- M. Accuracy+70
-- "M. Atk. Bonus"+10
-- "M. Def. Bonus"+3
-- Evasion+70
-- DEF+70
-- M. Evasion+70
-- "Store TP"+6
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
            member:addStatusEffect(dsp.effect.FOOD,0,0,10800,6538)
        end
    end)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 10)
    target:addMod(dsp.mod.DEX, 10)
    target:addMod(dsp.mod.VIT, 10)
    target:addMod(dsp.mod.AGI, 10)
    target:addMod(dsp.mod.INT, 10)
    target:addMod(dsp.mod.MND, 10)
    target:addMod(dsp.mod.CHR, 10)
    target:addMod(dsp.mod.ACC, 70)
    target:addMod(dsp.mod.ATT, 70)
    target:addMod(dsp.mod.RACC, 70)
    target:addMod(dsp.mod.RATT, 70)
    target:addMod(dsp.mod.MACC, 70)
    target:addMod(dsp.mod.MATT, 10)
    target:addMod(dsp.mod.MDEF, 3)
    target:addMod(dsp.mod.EVA, 70)
    target:addMod(dsp.mod.DEF, 70)
    target:addMod(dsp.mod.MEVA, 70)
    target:addMod(dsp.mod.STORETP, 6)
    target:addPetMod(dsp.mod.STR, 10)
    target:addPetMod(dsp.mod.DEX, 10)
    target:addPetMod(dsp.mod.VIT, 10)
    target:addPetMod(dsp.mod.AGI, 10)
    target:addPetMod(dsp.mod.INT, 10)
    target:addPetMod(dsp.mod.MND, 10)
    target:addPetMod(dsp.mod.CHR, 10)
    target:addPetMod(dsp.mod.ACC, 70)
    target:addPetMod(dsp.mod.ATT, 70)
    target:addPetMod(dsp.mod.RACC, 70)
    target:addPetMod(dsp.mod.RATT, 70)
    target:addPetMod(dsp.mod.MACC, 70)
    target:addPetMod(dsp.mod.MATT, 10)
    target:addPetMod(dsp.mod.MDEF, 3)
    target:addPetMod(dsp.mod.EVA, 70)
    target:addPetMod(dsp.mod.DEF, 70)
    target:addPetMod(dsp.mod.MEVA, 70)
    target:addPetMod(dsp.mod.STORETP, 6)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 10)
    target:delMod(dsp.mod.DEX, 10)
    target:delMod(dsp.mod.VIT, 10)
    target:delMod(dsp.mod.AGI, 10)
    target:delMod(dsp.mod.INT, 10)
    target:delMod(dsp.mod.MND, 10)
    target:delMod(dsp.mod.CHR, 10)
    target:delMod(dsp.mod.ACC, 70)
    target:delMod(dsp.mod.ATT, 70)
    target:delMod(dsp.mod.RACC, 70)
    target:delMod(dsp.mod.RATT, 70)
    target:delMod(dsp.mod.MACC, 70)
    target:delMod(dsp.mod.MATT, 10)
    target:delMod(dsp.mod.MDEF, 3)
    target:delMod(dsp.mod.EVA, 70)
    target:delMod(dsp.mod.DEF, 70)
    target:delMod(dsp.mod.MEVA, 70)
    target:delMod(dsp.mod.STORETP, 6)
    target:delPetMod(dsp.mod.STR, 10)
    target:delPetMod(dsp.mod.DEX, 10)
    target:delPetMod(dsp.mod.VIT, 10)
    target:delPetMod(dsp.mod.AGI, 10)
    target:delPetMod(dsp.mod.INT, 10)
    target:delPetMod(dsp.mod.MND, 10)
    target:delPetMod(dsp.mod.CHR, 10)
    target:delPetMod(dsp.mod.ACC, 70)
    target:delPetMod(dsp.mod.ATT, 70)
    target:delPetMod(dsp.mod.RACC, 70)
    target:delPetMod(dsp.mod.RATT, 70)
    target:delPetMod(dsp.mod.MACC, 70)
    target:delPetMod(dsp.mod.MATT, 10)
    target:delPetMod(dsp.mod.MDEF, 3)
    target:delPetMod(dsp.mod.EVA, 70)
    target:delPetMod(dsp.mod.DEF, 70)
    target:delPetMod(dsp.mod.MEVA, 70)
    target:delPetMod(dsp.mod.STORETP, 6)
end
