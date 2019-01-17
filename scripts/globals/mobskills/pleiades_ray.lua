---------------------------------------------
--  Pleiades Ray
--  Description: Fires a magical ray at nearby targets. Additional effects: Paralysis + Blind + Poison + Plague + Bind + Silence + Slow
--  Type: Magical
--  Utsusemi/Blink absorb: Wipes shadows
--  Range: Unknown
--  Notes: Only used by Gurfurlur the Menacing with health below 20%.
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    local mobhp = mob:getHPP()

    if (mobhp <= 20) then
        return 0
    else
        return 1
    end
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob, target, skill, mob:getWeaponDmg() * 7, dsp.magic.ele.FIRE, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.FIRE, MOBPARAM_WIPE_SHADOWS)
    local duration = 120

    MobStatusEffectMove(mob, target, dsp.effect.PARALYSIS, 40, 3, duration)
    MobStatusEffectMove(mob, target, dsp.effect.BLINDNESS, 40, 3, duration)
    MobStatusEffectMove(mob, target, dsp.effect.POISON, 10, 3, duration)
    MobStatusEffectMove(mob, target, dsp.effect.PLAGUE, 5, 3, duration)
    MobStatusEffectMove(mob, target, dsp.effect.BIND, 1, 0, duration)
    MobStatusEffectMove(mob, target, dsp.effect.SILENCE, 1, 0, duration)
    MobStatusEffectMove(mob, target, dsp.effect.SLOW, 1250, 0, duration)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.FIRE)
    return dmg
end
