---------------------------------------------------
-- Brain Crush
-- Deals damage to single target. Additional effect: Silence
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.3
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)

    if dmg > 0 then
        MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.SILENCE, 1, 0, 60)
    end

    return dmg
end
