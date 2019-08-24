---------------------------------------------
-- Royal Bash
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.2
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,info.hitslanded)

    local typeEffect = dsp.effect.STUN

    MobPhysicalStatusEffectMove(trust, target, skill, typeEffect, 1, 0, 4)

    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    return dmg
end
