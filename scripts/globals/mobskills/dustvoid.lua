---------------------------------------------
-- Dustvoid
--
-- Description: (**not in yet** Removes all equipment from player.) Additional effect: Knockback
-- Type: Breath
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: AoE 10'
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target,mob,skill)
    local dmgmod = 1
    local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,dsp.magic.ele.WIND,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WIND,MOBPARAM_IGNORE_SHADOWS)
    for i = dsp.slot.MAIN, dsp.slot.BACK do 
        target:unequipItem(i)
    end
    target:takeDamage(dmg, mob, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    return dmg
end
