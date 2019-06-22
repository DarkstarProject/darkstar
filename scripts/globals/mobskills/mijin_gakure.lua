---------------------------------------------------
-- Mijin Gakure
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target, mob, skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dmgmod = 1
    local hpmod = skill:getMobHPP() / 100
    local basePower = (mob:getFamily() == 335) and 4 or 6 -- Maat has a weaker (4) Mijin than usual (6)
    local power = hpmod * 10 + basePower
    local baseDmg = mob:getWeaponDmg() * power
    local info = MobMagicalMove(mob, target, skill, baseDmg, dsp.magic.ele.NONE, dmgmod, TP_MAB_BONUS, 1)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, dsp.attackType.MAGICAL, dsp.damageType.ELEMENTAL, MOBPARAM_IGNORE_SHADOWS)

    if mob:isInDynamis() then -- dynamis mobs will kill themselves, other mobs might not
        mob:setHP(0)
    end

    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.ELEMENTAL)

    return dmg
end
