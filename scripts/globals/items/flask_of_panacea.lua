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
    target:delStatusEffect(EFFECT.PARALYSIS);
    target:delStatusEffect(EFFECT.BIND);
    target:delStatusEffect(EFFECT.WEIGHT);
    target:delStatusEffect(EFFECT.ADDLE);
    target:delStatusEffect(EFFECT.BURN);
    target:delStatusEffect(EFFECT.FROST);
    target:delStatusEffect(EFFECT.CHOKE);
    target:delStatusEffect(EFFECT.RASP);
    target:delStatusEffect(EFFECT.SHOCK);
    target:delStatusEffect(EFFECT.DROWN);
    target:delStatusEffect(EFFECT.DIA);
    target:delStatusEffect(EFFECT.BIO);
    target:delStatusEffect(EFFECT.STR_DOWN);
    target:delStatusEffect(EFFECT.DEX_DOWN);
    target:delStatusEffect(EFFECT.VIT_DOWN);
    target:delStatusEffect(EFFECT.AGI_DOWN);
    target:delStatusEffect(EFFECT.INT_DOWN);
    target:delStatusEffect(EFFECT.MND_DOWN);
    target:delStatusEffect(EFFECT.CHR_DOWN);
    target:delStatusEffect(EFFECT.MAX_HP_DOWN);
    target:delStatusEffect(EFFECT.MAX_MP_DOWN);
    target:delStatusEffect(EFFECT.ATTACK_DOWN);
    target:delStatusEffect(EFFECT.EVASION_DOWN);
    target:delStatusEffect(EFFECT.DEFENSE_DOWN);
    target:delStatusEffect(EFFECT.MAGIC_DEF_DOWN);
    target:delStatusEffect(EFFECT.INHIBIT_TP);
    target:delStatusEffect(EFFECT.MAGIC_ACC_DOWN);
    target:delStatusEffect(EFFECT.MAGIC_ATK_DOWN);
end;

