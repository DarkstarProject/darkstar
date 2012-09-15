---------------------------------------------------
-- Double Slap M=6, 2 (still guessing here)
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/summon");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 2;
	accmod = 1;
	dmgmod = 6;
	dmgmodsubsequent = 2;
	
	totaldamage = 0;
	damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_H2H,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	
	return totaldamage;
end