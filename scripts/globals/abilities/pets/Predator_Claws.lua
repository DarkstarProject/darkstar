---------------------------------------------------
-- Predator Claws M=10 subsequent hits M=2
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/summon");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 3;
	accmod = 1;
	dmgmod = 10;
	dmgmodsubsequent = 2;
	totaldamage = 0;
	damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	return totaldamage;
end