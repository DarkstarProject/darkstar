---------------------------------------------
--  Magic Hammer
--
--  Description: Steals an amount of enemy's MP equal to damage dealt. Ineffective against undead.
--  Type: Magical (Light)
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.LIGHT,dmgmod,TP_MAB_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHT,MOBPARAM_IGNORE_SHADOWS)

        MobPhysicalDrainMove(mob, target, skill, MOBDRAIN_MP, dmg)

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.LIGHT)
    return dmg
end
