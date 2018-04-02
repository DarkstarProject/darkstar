-----------------------------------------
-- ID: 4163
-- Item: Panacea
-- Item Effect: Removes any number of status effects
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    target:delStatusEffect(dsp.effects.PARALYSIS);
    target:delStatusEffect(dsp.effects.BIND);
    target:delStatusEffect(dsp.effects.WEIGHT);
    target:delStatusEffect(dsp.effects.ADDLE);
    target:delStatusEffect(dsp.effects.BURN);
    target:delStatusEffect(dsp.effects.FROST);
    target:delStatusEffect(dsp.effects.CHOKE);
    target:delStatusEffect(dsp.effects.RASP);
    target:delStatusEffect(dsp.effects.SHOCK);
    target:delStatusEffect(dsp.effects.DROWN);
    target:delStatusEffect(dsp.effects.DIA);
    target:delStatusEffect(dsp.effects.BIO);
    target:delStatusEffect(dsp.effects.STR_DOWN);
    target:delStatusEffect(dsp.effects.DEX_DOWN);
    target:delStatusEffect(dsp.effects.VIT_DOWN);
    target:delStatusEffect(dsp.effects.AGI_DOWN);
    target:delStatusEffect(dsp.effects.INT_DOWN);
    target:delStatusEffect(dsp.effects.MND_DOWN);
    target:delStatusEffect(dsp.effects.CHR_DOWN);
    target:delStatusEffect(dsp.effects.MAX_HP_DOWN);
    target:delStatusEffect(dsp.effects.MAX_MP_DOWN);
    target:delStatusEffect(dsp.effects.ATTACK_DOWN);
    target:delStatusEffect(dsp.effects.EVASION_DOWN);
    target:delStatusEffect(dsp.effects.DEFENSE_DOWN);
    target:delStatusEffect(dsp.effects.MAGIC_DEF_DOWN);
    target:delStatusEffect(dsp.effects.INHIBIT_TP);
    target:delStatusEffect(dsp.effects.MAGIC_ACC_DOWN);
    target:delStatusEffect(dsp.effects.MAGIC_ATK_DOWN);
end;

