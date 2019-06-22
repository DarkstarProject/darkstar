---------------------------------------------------
-- Aerial Blast
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/monstertpmoves")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    local level = player:getMainLvl() * 2
    
    if(player:getMP()<level) then
       return 87,0
    end
    
    return 0,0
end

function onPetAbility(target, pet, skill, master)
    local dINT = math.floor(pet:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT))
    
    local level = pet:getMainLvl()
    local damage = 48 + (level * 8)
    damage = damage + (dINT * 1.5)
    damage = MobMagicalMove(pet,target,skill,damage,dsp.magic.ele.WIND,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, dsp.magic.ele.WIND)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,dsp.attackType.MAGICAL,dsp.damageType.WIND,1)

    master:setMP(0)
    target:takeDamage(damage, pet, dsp.attackType.MAGICAL, dsp.damageType.WIND)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end
