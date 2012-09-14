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
	resist = applyPlayerResistance(pet,skill,target,pet:getMod(MOD_INT)-target:getMod(MOD_INT),ELEMENTAL_MAGIC_SKILL, 4);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = mobAddBonuses(pet,skill,target,dmg, 4);
	--add in final adjustments
	dmg = finalMagicAdjustments(pet,target,skill,dmg);
	return dmg;
end