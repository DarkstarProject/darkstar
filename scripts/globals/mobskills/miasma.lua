---------------------------------------------
--  Miasma
--
--  Description: Releases a toxic cloud on nearby targets. Additional effects: Slow + Poison + Plague
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows?
--  Range: Less than or equal to 10.0
--  Notes: Only used by Gulool Ja Ja.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local duration = 180

    MobStatusEffectMove(mob, target, dsp.effect.POISON, mob:getMainLvl() / 3, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.SLOW, 1250, 3, 120)

    MobStatusEffectMove(mob, target, dsp.effect.POISON, mob:getMainLvl()/3, 3, 60)
    MobStatusEffectMove(mob, target, dsp.effect.SLOW, 128, 3, 120)
    MobStatusEffectMove(mob, target, dsp.effect.PLAGUE, 5, 3, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 4, dsp.magic.ele.EARTH, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.EARTH, MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
