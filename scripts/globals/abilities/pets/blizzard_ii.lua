---------------------------------------------------
-- Aero 2
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
require("scripts/globals/magic");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	local spell = getSpell(150);
	--calculate raw damage
	local dmg = calculateMagicDamage(155,1,pet,spell,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	local resist = applyPlayerResistance(pet,-1,target,pet:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL, ELE_ICE);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = mobAddBonuses(pet,spell,target,dmg, 5);
	--add on TP bonuses
	local tp = skill:getTP();
	if tp < 100 then
		tp = 100;
	end
	dmg = dmg * tp / 100;
	--add in final adjustments
	dmg = finalMagicAdjustments(pet,target,spell,dmg);
	return dmg;
end