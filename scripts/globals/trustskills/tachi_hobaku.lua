-----------------------------------
-- Tachi Hobaku
-- Great Katana weapon skill
-- Stuns enemy. Chance of stun varies with TP.
-- Element: None
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1
    local info = MobPhysicalMove(trust,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,1,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,info.hitslanded)

    local chance = (skill:getTP()-1000) * applyResistanceAddEffect(trust,target,dsp.magic.ele.LIGHTNING,0) > math.random() * 150
    if (dmg > 0 and chance) then
        if (target:hasStatusEffect(dsp.effect.STUN) == false) then
            target:addStatusEffect(dsp.effect.STUN, 1, 0, 4)
        end
    end

    -- About 300-400 to a DD.
    target:takeDamage(dmg, trust, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
    return dmg
end