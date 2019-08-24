---------------------------------------------
-- Burning Blade
--
-- Description: Deals fire elemental damage. Damage varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow?
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local dmgmod = 1
    local info = MobMagicalMove(trust,target,skill,trust:getWeaponDmg()*3,dsp.magic.ele.FIRE,dmgmod,TP_DMG_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.MAGICAL,dsp.damageType.FIRE,MOBPARAM_1_SHADOW)

    target:takeDamage(dmg, trust, dsp.attackType.MAGICAL, dsp.damageType.FIRE)
    return dmg
end
