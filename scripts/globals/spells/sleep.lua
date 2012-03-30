-----------------------------------------
-- Spell: Sleep I
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 60;
	resm = applyResistance(caster,spell,target);
	if(resm < 0.5) then
		--TODO: Set resist msg
		return 0;
	end
	
	if(target:hasStatusEffect(EFFECT_SLEEP_II) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
		--TODO: No effect
	else
		target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration);
	end
	
	return 0;
end;