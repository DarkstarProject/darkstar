-----------------------------------------
-- Spell: Sleep II
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 90;
	resm = applyResistance(caster,spell,target);
	if(resm < 0.5) then
		--TODO: Set resist msg
		return 0;
	end
	
	if(target:hasStatusEffect(EFFECT_SLEEP_II)) then
		--TODO: No effect msg
	else
		target:addStatusEffect(EFFECT_SLEEP_II,1,0,duration);
	end
	
	return 0;
end;