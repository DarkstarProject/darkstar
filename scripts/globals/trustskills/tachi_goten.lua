 -- ---------------------------------
-- Tachi Goten
-- Great Katana weapon skill
-- Deals lightning elemental damage to enemy. Damage varies with TP.
-- Will stack with Sneak Attack.
-- Element: Thunder
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local dmgmod = 1
	local info = MobMagicalMove(trust,target,skill,trust:getWeaponDmg()*3,dsp.magic.ele.LIGHTNING,dmgmod,TP_DMG_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHTNING,MOBPARAM_1_SHADOW)
	
    target:takeDamage(dmg, trust, dsp.attackType.MAGICAL, dsp.damageType.LIGHTNING)
    return dmg
end