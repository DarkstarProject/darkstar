---------------------------------------------------
-- Predator Claws M=10 subsequent hits M=2
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	totaldamage = 0;
	numhits = 3;
	
	damage = pet:getMeleeHitDamage(target,95);
	if(damage>=0) then
		totaldamage = totaldamage + damage*10;
	else
		numhits = numhits - 1;
	end
	damage2 = pet:getMeleeHitDamage(target);
	if(damage2>0) then
		totaldamage = totaldamage + damage2*2;
	else
		numhits = numhits - 1;
	end
	damage3 = pet:getMeleeHitDamage(target);
	if(damage3>0) then
		totaldamage = totaldamage + damage3*2;
	else
		numhits = numhits - 1;
	end
	
	if(numhits==0) then
		--all hits missed!
		skill:setMsg(324);
		return 0;
	end
	
	totaldamage = MobFinalAdjustments(totaldamage,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	
	return totaldamage;
end