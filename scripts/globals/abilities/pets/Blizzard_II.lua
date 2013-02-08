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
	dmg = calculateMagicDamage(155,1,pet,skill,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	resist = applyPlayerResistance(pet,-1,target,pet:getMod(MOD_INT)-target:getMod(MOD_INT),ELEMENTAL_MAGIC_SKILL, ELE_ICE);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = mobAddBonuses(pet,skill,target,dmg, 5);
	--add on TP bonuses
	tp = pet:getTP();
	if tp < 100 then
		tp = 100;
	end
	dmg = dmg * tp / 100;
	--add in final adjustments
	dmg = finalMagicAdjustments(pet,target,skill,dmg);
	return dmg;
end