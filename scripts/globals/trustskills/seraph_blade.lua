---------------------------------------------
-- Seraph Blade
--
-- Description: Deals light elemental damage. Damage varies with TP.
-- Type: Physical
-- Utsusemi/Blink absorb: 1 Shadow?
-- Range: Melee
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")

function onTrustWeaponSkill(target, trust, skill, action)
    local dmgmod = 1.25
    local info = MobMagicalMove(trust,target,skill,trust:getWeaponDmg()*4,dsp.magic.ele.LIGHT,dmgmod,TP_DMG_BONUS,1)
    local dmg = MobFinalAdjustments(info.dmg,trust,skill,target,dsp.attackType.MAGICAL,dsp.damageType.LIGHT,MOBPARAM_1_SHADOW)

    target:takeDamage(dmg, trust, dsp.attackType.MAGICAL, dsp.damageType.LIGHT)
    return dmg
end
