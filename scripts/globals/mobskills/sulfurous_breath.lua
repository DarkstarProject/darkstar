---------------------------------------------
-- Sulfurous_Breath
-- Deals Fire damage to enemies within a fan-shaped area.
-- Breath Attack
---------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:isBehind(mob, 48) == true) then
        return 1
    else
        return 0
    end
end

function onMobWeaponSkill(target, mob, skill)

    local dmgmod = MobBreathMove(mob, target, 0.2, 0.75, dsp.magic.ele.FIRE, 700)

    local dmg = MobFinalAdjustments(dmgmod,mob,skill,target,dsp.attackType.BREATH,dsp.damageType.FIRE,MOBPARAM_IGNORE_SHADOWS)
    target:takeDamage(dmg, mob, dsp.attackType.BREATH, dsp.damageType.FIRE)
    return dmg
end
