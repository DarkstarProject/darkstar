-----------------------------------
-- Dancing Edge
-- Dagger weapon skill
-- Skill level: 200
-- Delivers a fivefold attack. params.accuracy varies with TP.
-- Will stack with Sneak Attack.
-- Will stack with Trick Attack.
-- Aligned with the Breeze Gorget & Soil Gorget.
-- Aligned with the Breeze Belt & Soil Belt.
-- Element: None
-- Modifiers: DEX:30%  CHR:40%
-- 100%TP    200%TP    300%TP
-- 1.19      1.19      1.19
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 5
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1.1875,1.1875,1.1875)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end