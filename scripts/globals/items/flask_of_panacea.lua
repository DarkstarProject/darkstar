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
    target:delStatusEffect(EFFECT_PARALYSIS);
    target:delStatusEffect(EFFECT_BIND);
    target:delStatusEffect(EFFECT_WEIGHT);
    target:delStatusEffect(EFFECT_ADDLE);
    target:delStatusEffect(EFFECT_BURN);
    target:delStatusEffect(EFFECT_FROST);
    target:delStatusEffect(EFFECT_CHOKE);
    target:delStatusEffect(EFFECT_RASP);
    target:delStatusEffect(EFFECT_SHOCK);
    target:delStatusEffect(EFFECT_DROWN);
    target:delStatusEffect(EFFECT_DIA);
    target:delStatusEffect(EFFECT_BIO);
    target:delStatusEffect(EFFECT_STR_DOWN);
    target:delStatusEffect(EFFECT_DEX_DOWN);
    target:delStatusEffect(EFFECT_VIT_DOWN);
    target:delStatusEffect(EFFECT_AGI_DOWN);
    target:delStatusEffect(EFFECT_INT_DOWN);
    target:delStatusEffect(EFFECT_MND_DOWN);
    target:delStatusEffect(EFFECT_CHR_DOWN);
    target:delStatusEffect(EFFECT_MAX_HP_DOWN);
    target:delStatusEffect(EFFECT_MAX_MP_DOWN);
    target:delStatusEffect(EFFECT_ATTACK_DOWN);
    target:delStatusEffect(EFFECT_EVASION_DOWN);
    target:delStatusEffect(EFFECT_DEFENSE_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_DEF_DOWN);
    target:delStatusEffect(EFFECT_INHIBIT_TP);
    target:delStatusEffect(EFFECT_MAGIC_ACC_DOWN);
    target:delStatusEffect(EFFECT_MAGIC_ATK_DOWN);
end;

