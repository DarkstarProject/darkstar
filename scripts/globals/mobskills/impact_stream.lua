---------------------------------------------
--  Impact Stream
--
--  Description: 50% Defense Down, Stun
--  Type: Magical
--  Wipe Shadows
--  Range: 10.0' AoE
--  Notes:
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------
function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect1 = dsp.effect.STUN
    local typeEffect2 = dsp.effect.DEFENSE_DOWN

    MobStatusEffectMove(mob, target, typeEffect1, 1, 0, 4)
    MobStatusEffectMove(mob, target, typeEffect2, 50, 0, 60)

    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.5,dsp.magic.ele.LIGHT,dmgmod,0,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.EARTH,MOBPARAM_WIPE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.EARTH)
    return dmg
end
