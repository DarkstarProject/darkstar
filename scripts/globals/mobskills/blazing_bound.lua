---------------------------------------------
--  Blazing Bound
--
--  Description: Deals fire damage to an enemy.
--  Type: Magical (Fire)
--
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
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,tpz.magic.ele.FIRE,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.FIRE)
    return dmg
end
