---------------------------------------------
--  Ink Jet alt
--
--  Description: Unleashes a torrent of black spores in a fan-shaped area of effect, dealing dark damage to targets. Additional effect: Blind
--  Type: Magical Dark (Element)
--
--  Notes: Used by Fe'e in Up in Arms BCNM
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,dsp.magic.ele.DARK,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_IGNORE_SHADOWS)

    MobStatusEffectMove(mob, target, dsp.effect.BLINDNESS, 20, 0, 180)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.DARK)
    return dmg
end
