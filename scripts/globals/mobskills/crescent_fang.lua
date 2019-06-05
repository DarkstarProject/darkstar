---------------------------------------------------
-- Crescent Fang
-- Fenrir inflicts Paralysis along with a single attack to target.
---------------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 2
    local dmgmod = 5

    local totaldamage = 0
    local damage = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3)
    totaldamage = MobFinalAdjustments(damage.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,numhits)

    if (damage.hitslanded > 0) then
        target:addStatusEffect(dsp.effect.PARALYSIS, 50, 0, 90)
    end

    target:takeDamage(totaldamage, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)

    return totaldamage

end