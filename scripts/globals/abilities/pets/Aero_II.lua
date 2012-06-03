---------------------------------------------------
-- Aero 2
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
require("/scripts/globals/magic");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
		--calculate raw damage
	dmg = calculateMagicDamage(113,1,pet,skill,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	resist = applyPlayerResistance(pet,skill,target,false,nil,MOD_INT);
	--get the resisted damage
	dmg = dmg*resist;
	--add in final adjustments
	dmg = finalMagicAdjustments(pet,target,spell,dmg);
	return dmg;
end