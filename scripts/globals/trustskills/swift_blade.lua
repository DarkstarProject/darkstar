---------------------------------------------
-- Swift Blade
--
-- Description: Delivers a three-hit attack. Accuracy varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: Shadow per hit
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 3
    local accmod = 1
    local dmgmod = 2
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_ACC_VARIES,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

    -- Around 700 damage from AA HM
    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
    return dmg
end
