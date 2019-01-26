---------------------------------------------
--  Blizzard Breath
--
--  Description: Deals ice damage to enemies within a fan-shaped area originating from the caster.
--  Type: Magical (Ice)
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 1
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = MobBreathMove(mob, target, 0.5, 1, dsp.magic.ele.ICE, 700)
    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.ICE,MOBPARAM_IGNORE_SHADOWS)

    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.ICE)
    return dmg
end
