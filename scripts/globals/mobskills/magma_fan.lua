---------------------------------------------
--  Magma_Fan
--
--  Description: Deals Fire damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical Fire (Element)
--
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.5, 1.25, dsp.magic.ele.FIRE, 600)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.FIRE)
    return dmg
end
