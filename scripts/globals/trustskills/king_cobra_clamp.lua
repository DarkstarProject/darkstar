

require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local dmgmod = 1.25
    local info = MobMagicalMove(trust,target,skill,trust:getWeaponDmg()*4,dsp.magic.ele.DARK,dmgmod,TP_DMG_BONUS,1)	
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,MOBPARAM_IGNORE_SHADOWS)
	
	MobPhysicalStatusEffectMove(trust, target, skill, dsp.effect.POISON, 25, 20, 30);
	MobPhysicalStatusEffectMove(trust, target, skill, dsp.effect.PARALYSIS, 25, 0, 30);
	MobPhysicalStatusEffectMove(trust, target, skill, dsp.effect.STUN, 25, 0, 5);
	
    target:takeDamage(info.dmg, trust, dsp.attackType.MAGICAL, dsp.damageType.DARK)	
    return dmg
end
