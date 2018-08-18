---------------------------------------------
-- Saucepan
-- Force feeds an unsavory dish.
---------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 0.8
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,info.hitslanded)
    if (target:hasStatusEffect(dsp.effect.FOOD)) then
        target:delStatusEffectSilent(dsp.effect.FOOD)
    elseif (target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD)) then
        target:delStatusEffectSilent(dsp.effect.FIELD_SUPPORT_FOOD)
    end
    target:addStatusEffectEx(dsp.effect.FIELD_SUPPORT_FOOD,dsp.effect.FOOD, 255, 0, 1800)
    target:delHP(dmg)
    return dmg
end
