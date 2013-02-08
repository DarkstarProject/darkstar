---------------------------------------------------
-- Aero 4
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/magic");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
		--calculate raw damage
	dmg = calculateMagicDamage(512,1.5,pet,skill,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	dmg = dmg + (1+skill:getTP())*1.72;
	--get resist multiplier (1x if no resist)
	local statmod = MOD_INT;
	local resist = applyPlayerResistance(pet,-1,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_WIND);
	--get the resisted damage
	dmg = dmg*resist;
	--add in final adjustments
	dmg = finalMagicAdjustments(pet,target,spell,dmg);
	return dmg;
end