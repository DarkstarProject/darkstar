-----------------------------------
-- Tachi Jinpu
-- Great Katana weapon skill
-- Two-hit attack. Deals Physical and wind elemental damage to enemy. Additonal Effect Damage varies with TP.
-- Element: Wind
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local dmgmod = 1
	local info = MobMagicalMove(trust,target,skill,trust:getWeaponDmg()*3,dsp.magic.ele.WIND,dmgmod,TP_DMG_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.WIND,MOBPARAM_1_SHADOW)
	
    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.WIND)
    return dmg
end