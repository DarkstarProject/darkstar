---------------------------------------------------
-- Mountain Buster M=12
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	totaldamage = 0;
	damage = pet:getMeleeHitDamage(target,95); --95% hit rate
	if(damage>0) then
		totaldamage = totaldamage + damage*12;
	end
	numhits = 1;
	if(damage==-1) then --it missed
		numhits = 0;
	end
	
	totaldamage = MobFinalAdjustments(totaldamage,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	
	return totaldamage;
end