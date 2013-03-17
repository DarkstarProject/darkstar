---------------------------------------------------
-- Chaotic Strike M=9 , 2
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/summon");

---------------------------------------------------

function OnAbilityCheck(player, target, ability)
    return 0,0;
end;

function OnPetAbility(target, pet, skill)
	local numhits = 3;
	local accmod = 1;
	local dmgmod = 9;
	local dmgmodsubsequent = 2;
	local totaldamage = 0;
	local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3);
	totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,numhits);
	target:addStatusEffect(EFFECT_STUN, 1, 0, 2);
	target:delHP(totaldamage);
	target:updateEnmityFromDamage(pet,totaldamage);
	return totaldamage;
end