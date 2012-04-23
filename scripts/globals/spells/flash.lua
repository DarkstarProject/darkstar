-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	final = 156;
	spell:setMsg(236);
	target:addStatusEffect(EFFECT_FLASH,75,0,12); -- Guess at power for now.
	
	target:updateEnmity(caster,1280,180);
	
	return final;
	
end;