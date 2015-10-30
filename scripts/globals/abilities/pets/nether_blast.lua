---------------------------------------------------
-- Nether Blast
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
	local level = pet:getMainLvl();
	local damage = (5 * level +  10);
	damage = MobMagicalMove(pet,target,skill,damage,ELE_DARK,1,TP_NO_EFFECT,0);
	damage = mobAddBonuses(pet, nil, target, damage.dmg, ELE_DARK);
	damage = AvatarFinalAdjustments(damage,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);

	target:delHP(damage);
	target:updateEnmityFromDamage(pet,damage);

	return damage;
end