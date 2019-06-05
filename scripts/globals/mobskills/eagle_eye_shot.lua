---------------------------------------------------
-- Eagle Eye Shot
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local dmgmod = 9 + math.random()

    local info = MobRangedMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)

    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.RANGED, dsp.damageType.PIERCING, info.hitslanded)

    if dmg > 0 then
       target:addTP(20)
       mob:addTP(80)
    end

    target:takeDamage(dmg, mob, dsp.attackType.RANGED, dsp.damageType.PIERCING)

    return dmg
end
