-----------------------------------------
-- 
-- Spell: Auspice
--
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local effect = EFFECT_AUSPICE;
	if(caster:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then     		
	     	doEnspell(caster,target,spell,effect);
	else
		spell:setMsg(230);
		target:addStatusEffect(EFFECT_AUSPICE, 0, 0, 150);
	end
	 
	return effect;
end;