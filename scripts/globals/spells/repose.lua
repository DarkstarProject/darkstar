-----------------------------------------
-- Spell: Repose
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	local bonus = AffinityBonus(caster, spell);
	local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	
	if(applyResistance(caster,spell,target,dINT,37,bonus) < 0.5) then
		spell:setMsg(75); -- Resist
		return;
	end
	
	if(target:hasImmunity(1) or target:hasStatusEffect(EFFECT_SLEEP_II) or target:hasStatusEffect(EFFECT_SLEEP_I)) then
		spell:setMsg(85); -- No effect
		return;
	else
		spell:setMsg(237);
		target:addStatusEffect(EFFECT_SLEEP_I,1,0,60);
	end
	
	target:updateEnmity(caster,320,1);
	return EFFECT_SLEEP_I;
	
end;