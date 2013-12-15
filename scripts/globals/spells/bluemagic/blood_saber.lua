-----------------------------------------
-- Spell: Blood Saber
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	local dmg = 1 + (0.709 * (caster:getSkillLevel(BLUE_SKILL)) + caster:getMod(1 + BLUE_SKILL));
	local resist = applyResistance(caster,spell,target,caster:getStat(MOD_MND)-target:getStat(MOD_MND),BLUE_SKILL,1.0);
	dmg = dmg*resist;
	dmg = addBonuses(caster,spell,target,dmg);
	dmg = adjustForTarget(target,dmg);
	if (dmg > (caster:getSkillLevel(BLUE_SKILL) + 20)) then
		dmg = (caster:getSkillLevel(BLUE_SKILL) + 20);
	end

	if(target:isUndead()) then
		spell:setMsg(75); 
		return dmg;
	end

	dmg = finalMagicAdjustments(caster,target,spell,dmg);

	dmg = (dmg * DRAIN_POWER);

	spell:setMsg(227);
	caster:addHP(dmg);
	return dmg;

end;
