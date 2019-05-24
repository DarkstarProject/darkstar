---------------------------------------------------
-- Nether Blast
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local level = pet:getMainLvl()
    local damage = (5 * level +  10)
    damage = MobMagicalMove(pet,target,skill,damage,dsp.magic.ele.DARK,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, dsp.magic.ele.DARK)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,dsp.attackType.MAGICAL,dsp.damageType.DARK,1)

    target:takeDamage(damage, pet, dsp.attackType.MAGICAL, dsp.damageType.DARK)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end