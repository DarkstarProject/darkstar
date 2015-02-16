-----------------------------------------
-- Spell: Indi-Regen
-- Gradually restores party's HP.
-----------------------------------------
-- 
-- 
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
	
	local hp = 1;
	
	hp = hp + caster:getLvl(JOB_GEO) >+1;
    
	
	if(target:addStatusEffect(EFFECT_REGEN,hp,3,360)) then
		spell:setMsg(230);
	else
		spell:setMsg(75); -- no effect
	end

	return EFFECT_REGEN;
end;