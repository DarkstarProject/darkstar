-----------------------------------
-- Wasp Sting
-- Dagger weapon skill
-- Skill level: 5
-- Poisons target. Duration of effect varies with TP.
-- Will stack with Sneak Attack.
-- Aligned with the Soil Gorget.
-- Aligned with the Soil Belt.
-- Element: None
-- Modifiers: :    DEX:100%
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
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT,1,1,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)

    if (dmg > 0 and target:hasStatusEffect(dsp.effect.POISON) == false) then
        local duration = (75 + (skill:getTP()/1000 * 15)) * applyResistanceAddEffect(trust,target,dsp.magic.ele.WATER,0)
		MobPhysicalStatusEffectMove(trust, target, skill, dsp.effect.POISON, 1, 0, duration);
    end

    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)
    return dmg
end