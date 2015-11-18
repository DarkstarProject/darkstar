-----------------------------------------
-- 
-- Spell: Temper
--
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
	local effect = EFFECT_MULTI_STRIKES;
	local enhskill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
	local final = 0;
	local duration = 180;

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end
	
	if (enhskill<360) then
		final = 5;
	elseif (enhskill>=360) then
		final = math.floor( (enhskill - 300) / 10 ); 
	else
		print("Warning: Unknown enhancing magic skill for Temper.");
	end
	
	if (final>20) then
		final = 20;
	end
	
	if (target:addStatusEffect(effect,final,0,duration)) then
		spell:setMsg(230);
	else
		spell:setMsg(75);
	end
	
	return effect;	
end;