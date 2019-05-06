-----------------------------------------
-- ID: 6540
-- Item: Altanas Repast +2
-- Food Effect: 3 Hrs, All Races
-----------------------------------------
-- AoE:
-- STR+20
-- DEX+20
-- VIT+20
-- AGI+20
-- INT+20
-- MND+20
-- CHR+20
-- Accuracy+90
-- Attack+90
-- R. Accuracy+90
-- R. Attack+90
-- M. Accuracy+90
-- "M. Atk. Bonus"+20
-- "M. Def. Bonus"+5
-- Evasion+90
-- DEF+90
-- M. Evasion+90
-- "Store TP"+8
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
            member:addStatusEffect(dsp.effect.FOOD,0,0,10800,6540)
        end
    end)
end

function onEffectGain(target, effect)
    target:addMod(dsp.mod.STR, 20)
    target:addMod(dsp.mod.DEX, 20)
    target:addMod(dsp.mod.VIT, 20)
    target:addMod(dsp.mod.AGI, 20)
    target:addMod(dsp.mod.INT, 20)
    target:addMod(dsp.mod.MND, 20)
    target:addMod(dsp.mod.CHR, 20)
    target:addMod(dsp.mod.ACC, 90)
    target:addMod(dsp.mod.ATT, 90)
    target:addMod(dsp.mod.RACC, 90)
    target:addMod(dsp.mod.RATT, 90)
    target:addMod(dsp.mod.MACC, 90)
    target:addMod(dsp.mod.MATT, 20)
    target:addMod(dsp.mod.MDEF, 5)
    target:addMod(dsp.mod.EVA, 90)
    target:addMod(dsp.mod.DEF, 90)
    target:addMod(dsp.mod.MEVA, 90)
    target:addMod(dsp.mod.STORETP, 8)
    target:addPetMod(dsp.mod.STR, 20)
    target:addPetMod(dsp.mod.DEX, 20)
    target:addPetMod(dsp.mod.VIT, 20)
    target:addPetMod(dsp.mod.AGI, 20)
    target:addPetMod(dsp.mod.INT, 20)
    target:addPetMod(dsp.mod.MND, 20)
    target:addPetMod(dsp.mod.CHR, 20)
    target:addPetMod(dsp.mod.ACC, 90)
    target:addPetMod(dsp.mod.ATT, 90)
    target:addPetMod(dsp.mod.RACC, 90)
    target:addPetMod(dsp.mod.RATT, 90)
    target:addPetMod(dsp.mod.MACC, 90)
    target:addPetMod(dsp.mod.MATT, 20)
    target:addPetMod(dsp.mod.MDEF, 5)
    target:addPetMod(dsp.mod.EVA, 90)
    target:addPetMod(dsp.mod.DEF, 90)
    target:addPetMod(dsp.mod.MEVA, 90)
    target:addPetMod(dsp.mod.STORETP, 8)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.STR, 20)
    target:delMod(dsp.mod.DEX, 20)
    target:delMod(dsp.mod.VIT, 20)
    target:delMod(dsp.mod.AGI, 20)
    target:delMod(dsp.mod.INT, 20)
    target:delMod(dsp.mod.MND, 20)
    target:delMod(dsp.mod.CHR, 20)
    target:delMod(dsp.mod.ACC, 90)
    target:delMod(dsp.mod.ATT, 90)
    target:delMod(dsp.mod.RACC, 90)
    target:delMod(dsp.mod.RATT, 90)
    target:delMod(dsp.mod.MACC, 90)
    target:delMod(dsp.mod.MATT, 20)
    target:delMod(dsp.mod.MDEF, 5)
    target:delMod(dsp.mod.EVA, 90)
    target:delMod(dsp.mod.DEF, 90)
    target:delMod(dsp.mod.MEVA, 90)
    target:delMod(dsp.mod.STORETP, 8)
    target:delPetMod(dsp.mod.STR, 20)
    target:delPetMod(dsp.mod.DEX, 20)
    target:delPetMod(dsp.mod.VIT, 20)
    target:delPetMod(dsp.mod.AGI, 20)
    target:delPetMod(dsp.mod.INT, 20)
    target:delPetMod(dsp.mod.MND, 20)
    target:delPetMod(dsp.mod.CHR, 20)
    target:delPetMod(dsp.mod.ACC, 90)
    target:delPetMod(dsp.mod.ATT, 90)
    target:delPetMod(dsp.mod.RACC, 90)
    target:delPetMod(dsp.mod.RATT, 90)
    target:delPetMod(dsp.mod.MACC, 90)
    target:delPetMod(dsp.mod.MATT, 20)
    target:delPetMod(dsp.mod.MDEF, 5)
    target:delPetMod(dsp.mod.EVA, 90)
    target:delPetMod(dsp.mod.DEF, 90)
    target:delPetMod(dsp.mod.MEVA, 90)
    target:delPetMod(dsp.mod.STORETP, 8)
end
