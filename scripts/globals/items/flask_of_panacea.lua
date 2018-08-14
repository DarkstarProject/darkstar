-----------------------------------------
-- ID: 4163
-- Item: Panacea
-- Item Effect: Removes any number of status effects
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)
    target:delStatusEffect(dsp.effect.PARALYSIS)
    target:delStatusEffect(dsp.effect.BIND)
    target:delStatusEffect(dsp.effect.WEIGHT)
    target:delStatusEffect(dsp.effect.ADDLE)
    target:delStatusEffect(dsp.effect.BURN)
    target:delStatusEffect(dsp.effect.FROST)
    target:delStatusEffect(dsp.effect.CHOKE)
    target:delStatusEffect(dsp.effect.RASP)
    target:delStatusEffect(dsp.effect.SHOCK)
    target:delStatusEffect(dsp.effect.DROWN)
    target:delStatusEffect(dsp.effect.DIA)
    target:delStatusEffect(dsp.effect.BIO)
    target:delStatusEffect(dsp.effect.STR_DOWN)
    target:delStatusEffect(dsp.effect.DEX_DOWN)
    target:delStatusEffect(dsp.effect.VIT_DOWN)
    target:delStatusEffect(dsp.effect.AGI_DOWN)
    target:delStatusEffect(dsp.effect.INT_DOWN)
    target:delStatusEffect(dsp.effect.MND_DOWN)
    target:delStatusEffect(dsp.effect.CHR_DOWN)
    target:delStatusEffect(dsp.effect.MAX_HP_DOWN)
    target:delStatusEffect(dsp.effect.MAX_MP_DOWN)
    target:delStatusEffect(dsp.effect.ATTACK_DOWN)
    target:delStatusEffect(dsp.effect.EVASION_DOWN)
    target:delStatusEffect(dsp.effect.DEFENSE_DOWN)
    target:delStatusEffect(dsp.effect.MAGIC_DEF_DOWN)
    target:delStatusEffect(dsp.effect.INHIBIT_TP)
    target:delStatusEffect(dsp.effect.MAGIC_ACC_DOWN)
    target:delStatusEffect(dsp.effect.MAGIC_ATK_DOWN)
end

