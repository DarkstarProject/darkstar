-----------------------------------------
-- Spell: Banishga 2
-- Deals light damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	--calculate raw damage
	dmg = calculateMagicDamage(180,1,caster,spell,target,DIVINE_MAGIC_SKILL,MOD_MND,false);
	--get resist multiplier (1x if no resist)
	resist = applyResistance(caster,spell,target,caster:getMod(MOD_MND)-target:getMod(MOD_MND),DIVINE_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	return dmg;
end;