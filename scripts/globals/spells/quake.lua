-----------------------------------------
-- Spell: Quake
-- Deals earth damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--calculate raw damage
	local dmg = calculateMagicDamage(577,2,caster,spell,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	--doElementalNuke(V,M,caster,spell,target,hasMultipleTargetReduction,resistBonus)
	local dmg = doElementalNuke(577,2,caster,spell,target,false,1.0);
	return dmg;
end;