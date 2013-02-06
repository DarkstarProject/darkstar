-----------------------------------------
-- Spell: Drain II
-- Drain functions only on skill level!!
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	--calculate raw damage (unknown function  -> only dark skill though) - using http://www.bluegartr.com/threads/44518-Drain-Calculations
	-- also have small constant to account for 0 dark skill
	dmg = 20 + (1.236 * (caster:getSkillLevel(DARK_MAGIC_SKILL)) + caster:getMod(79 + DARK_MAGIC_SKILL));
	--get resist multiplier (1x if no resist)
	resist = applyResistance(caster,spell,target,caster:getMod(MOD_INT)-target:getMod(MOD_INT),DARK_MAGIC_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments
	if (dmg > (caster:getSkillLevel(DARK_MAGIC_SKILL) + 85)) then
		dmg = (caster:getSkillLevel(DARK_MAGIC_SKILL) + 85);
	end

	if(target:isUndead()) then
		spell:setMsg(75); -- No effect
		return;
	end

	dmg = finalMagicAdjustments(caster,target,spell,dmg);

	dmg = (dmg * DRAIN_POWER);

	caster:addHP(dmg);
	spell:setMsg(227); --change msg to 'xxx hp drained from the yyyy.'
	return dmg;
end;