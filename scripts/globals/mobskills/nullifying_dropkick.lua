---------------------------------------------
--  Nullifying Dropkick
--
---------------------------------------------
local ID = require("scripts/zones/Empyreal_Paradox/IDs")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    if (target:hasStatusEffect(dsp.effect.PHYSICAL_SHIELD) or target:hasStatusEffect(dsp.effect.MAGIC_SHIELD)) then
        mob:showText(mob, ID.text.PRISHE_TEXT + 5)
        return 0
    end
    return 1
end

function onMobWeaponSkill(target, mob, skill)

    local numhits = 1
    local accmod = 1
    local dmgmod = 2.0
    local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3)
    local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,info.hitslanded)
    
    target:delStatusEffect(dsp.effect.PHYSICAL_SHIELD)
    target:delStatusEffect(dsp.effect.MAGIC_SHIELD)

    target:takeDamage(dmg, mob, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    return dmg
end
