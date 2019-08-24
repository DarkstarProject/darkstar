-----------------------------------
-- Penta Thrust
-- Polearm weapon skill
-- Skill Level: 150
-- Delivers a five-hit attack. params.accuracy varies with TP.
-- 0.875 Attack penalty
-- Will stack with Sneak Attack.
-- Aligned with the Shadow Gorget.
-- Aligned with the Shadow Belt.
-- Element: None
-- Modifiers: STR:20%  DEX:20%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 5
    local accmod = 1
    local dmgmod = 0.875
	local ftp100 = 1
	local ftp200 = 1
	local ftp300 = 1
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,ftp100,ftp200,ftp300)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end