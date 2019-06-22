---------------------------------------------------
-- Tidal Wave
-- Deals water elemental damage to enemies within area of effect.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    dmgmod = 3
    info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 9, dsp.magic.ele.WATER, dmgmod,TP_NO_EFFECT, 1)
    dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.WATER, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WATER)
    return dmg
end
