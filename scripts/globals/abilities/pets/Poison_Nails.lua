---------------------------------------------------
-- Poison Nails 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	numhits = 1;
	accmod = 1;
	dmgmod = 1;
	info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_DMG_VARIES,1,2,3);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,info.hitslanded);
	target:delHP(dmg);
	target:updateEnmityFromDamage(pet,dmg);
	if(target:getStatusEffect(EFFECT_POISON)==nil) then
		target:addStatusEffect(EFFECT_POISON,1,3,60);
	end
	
	return dmg;
end