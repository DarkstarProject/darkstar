---------------------------------------------------
-- Meteorite
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	
	local dint = pet:getStat(MOD_INT) - target:getStat(MOD_INT);
	local dmg = 500 + dint*1.5;
	dmg = MobMagicalMove(pet,target,skill,dmg,ELE_LIGHT,1,TP_NO_EFFECT,0);
	dmg = mobAddBonuses(pet, nil, target, dmg, ELE_LIGHT);
	dmg = dmg + skill:getTP()/2;
	dmg = AvatarFinalAdjustments(dmg,pet,skill,target,MOBSKILL_MAGICAL,MOBPARAM_NONE,1);
	
	target:delHP(dmg);
	target:updateEnmityFromDamage(pet,dmg);
	
	return dmg;
end
