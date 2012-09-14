---------------------------------------------------
-- Punch M=3.5
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/summon");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 1;
	accmod = 1;
	dmgmod = 3.5;
	
	totaldamage = 0;
	damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,0,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_BLUNT,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	
	return totaldamage;
end