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
	local resist = applyResistance(caster,spell,target,dINT,37,bonus);
	if(resist < 0.5) then
		spell:setMsg(85); -- Resist
		return EFFECT_SLEEP_II;
	end

	if(target:addStatusEffect(EFFECT_SLEEP_II,2,0,90*resist)) then
		spell:setMsg(237);
	else
		spell:setMsg(75); -- No effect
	end

	target:updateEnmity(caster,320,1);
	return EFFECT_SLEEP_II;

end;