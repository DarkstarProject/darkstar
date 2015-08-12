-----------------------------------------
-- Spell: BARAERA
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local enhanceSkill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);

	local power = calculateBarspellPower(caster,enhanceSkill);

	local duration = 150;

	if (enhanceSkill >180) then
		duration = 150 + 0.8 * (enhanceSkill - 180);
	end

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	target:addStatusEffect(EFFECT_BARAERO,power,0,duration,0,1);

	return EFFECT_BARAERO;
end;
