---------------------------------------------------
-- Lightning Roar
-- Emits the roar of an impact event, dealing damage in a fan-shaped area of effect. Lightning damage
-- Ignores Shadows
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * math.random(4,6),tpz.magic.ele.THUNDER,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHTNING,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    return dmg
end
