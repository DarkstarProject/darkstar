-----------------------------------------
-- Spell: Bind
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 20;
	resm = applyResistance(caster,spell,target);
	if(resm <= (1/8)) then
		--TODO: Set resist msg
		return 0;
	end
	
	if(target:hasStatusEffect(EFFECT_BIND)) then
		--TODO: No effect
	else
		target:addStatusEffect(EFFECT_BIND,target:speed(),0,duration);
	end
	
	return 0;
end;