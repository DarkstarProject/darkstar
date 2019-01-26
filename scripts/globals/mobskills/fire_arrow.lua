---------------------------------------------------
-- Fire Arrow
-- Deals Fire damage.
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
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*2.8,dsp.magic.ele.FIRE,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.RANGED,dsp.damageType.PIERCING,info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)
    return dmg
end
