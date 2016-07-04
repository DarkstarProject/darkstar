---------------------------------------------------
-- Stone 4
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local dINT = math.floor(pet:getStat(MOD_INT) - target:getStat(MOD_INT));
    local tp = skill:getTP();

    local damage = math.floor(325 + 0.025*(tp));
    damage = damage + (dINT * 1.5);
    damage = MobMagicalMove(pet,target,skill,damage,ELE_EARTH,1,TP_NO_EFFECT,0);
    damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_EARTH);
    damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

    target:delHP(damage);
    target:updateEnmityFromDamage(pet,damage);

    return damage;
end