---------------------------------------------------
-- Inertia Stream
-- Deals light ele damage to enemies within range. Additional Effect: "Bind."
---------------------------------------------------
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    MobStatusEffectMove(mob, target, dsp.effect.BIND, 1, 0, 30)

    local dmgmod = 2
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.ICE,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.damageType.MAGICAL,dsp.attackType.ICE,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
