---------------------------------------------
--  Benthic Typhoon
--
--  Description: Delivers an area attack that lowers target's defense and magic defense. Damage varies with TP.
--  Type: Physical (Piercing)
--
--
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
    local dmgmod = 2.3
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.PIERCING,info.hitslanded)
    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.PIERCING)

    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.MAGIC_DEF_DOWN, 30, 0, 60)
    MobPhysicalStatusEffectMove(mob, target, skill, dsp.effect.DEFENSE_DOWN, 30, 0, 60)

    return dmg
end
