---------------------------------------------
--  Tachi: Kasha
--
--  Description:  Paralyzes target. Damage varies with TP.
--  Type: Physical
--  Shadow per hit
--  Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 3.5
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1.56,1.88,2.50)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

    MobStatusEffectMove(trust, target, dsp.effect.PARALYSIS, 25, 0, 60)

    -- About 400-500
    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
    return dmg
end
