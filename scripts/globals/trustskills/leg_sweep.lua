-----------------------------------
-- Leg Sweep
-- Polearm weapon skill
-- Skill Level: 100
-- Stuns enemy. Chance of stunning varies with TP.
-- Will stack with Sneak Attack.
-- Element: None
-- Modifiers: STR:30%
-- 100%TP    200%TP    300%TP
-- 1.00      1.00      1.00
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_CRIT_VARIES,1,1,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    local chance = (skill:getTP()-1000) * applyResistanceAddEffect(trust,target,dsp.magic.ele.LIGHTNING,0) > math.random() * 150
    if (dmg > 0 and chance) then
        if (target:hasStatusEffect(dsp.effect.STUN) == false) then
            target:addStatusEffect(dsp.effect.STUN, 1, 0, 4)
        end
    end
	
	target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end