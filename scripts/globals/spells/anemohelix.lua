--------------------------------------
-- 	Spell: Anemohelix
-- 	Deals wind damage that gradually reduces
--  a target's HP. Damage dealt is greatly affected by the weather.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	--calculate raw damage
	dmg = calculateMagicDamage(35,1,caster,spell,target,ELEMENTAL_MAGIC_SKILL,MOD_INT,false);
	dmg = dmg + caster:getMod(MOD_HELIX_EFFECT);
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
	
	local duration = getHelixDuration(caster) + caster:getMod(MOD_HELIX_DURATION);
	
	duration = duration * (resist/2);
	
	target:addStatusEffect(EFFECT_HELIX,dmg,3,duration);
	
	return dmg;
end;