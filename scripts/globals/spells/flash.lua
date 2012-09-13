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
	spell:setMsg(236);
	target:addStatusEffect(EFFECT_FLASH,100,0,12); -- Guess at power for now.
	return 156;
end;