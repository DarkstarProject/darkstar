---------------------------------------------------
-- Uranos Cascade: Theta
-- Deals damage in an area of effect.
---------------------------------------------------

require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (mob:AnimationSub() ~= 1) then
        return 1
    end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local numhits = 1
    local accmod = 1
    local dmgmod = 1.5
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.SLASHING,MOBPARAM_2_SHADOW)
    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.BIND, 1, 0, 10)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.SLASHING)
    return dmg
end
