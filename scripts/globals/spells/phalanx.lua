-----------------------------------------
--	Spell: PHALANX
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local enhskill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
	local final = 0;
	local duration = 180;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	if (enhskill<=300) then
		final = (enhskill/10) -2;
		if (final<0) then
			final = 0;
		end
	elseif (enhskill>300) then
		final = ((enhskill-300)/29) + 28;
	else
		print("Warning: Unknown enhancing magic skill for phalanx.");
	end

	if (final>35) then
		final = 35;
	end

	if (target:addStatusEffect(EFFECT_PHALANX,final,0,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end

	return EFFECT_PHALANX;
end;