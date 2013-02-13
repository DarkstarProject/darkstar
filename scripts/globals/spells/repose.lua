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
		return EFFECT_SLEEP_II;
	end
	
	if(target:hasImmunity(1) or target:hasStatusEffect(EFFECT_SLEEP_II)) then
		spell:setMsg(85); -- No effect
	else
		spell:setMsg(237);
		removeSleepEffects(target);
		target:addStatusEffect(EFFECT_SLEEP_II,1,0,90);
	end
	
	target:updateEnmity(caster,320,1);
	return EFFECT_SLEEP_II;
	
end;