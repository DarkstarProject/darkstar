---------------------------------------------------
-- Mountain Buster M=12
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 1;
	accmod = 1;
	dmgmod = 12;
	
	totaldamage = 0;
	damage = MobPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	
	totaldamage = MobFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	
	return totaldamage;
end