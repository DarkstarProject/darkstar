-----------------------------------------
-- Spell: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	duration = 5;

	taff = AffinityBonus(caster,spell);
	dINT = caster:getStat(MOD_INT)*2 - target:getStat(MOD_INT);
	resist = applyResistance(caster,spell,target,dINT,37,bonus);
	if(resist <= (1/16)) then
		-- resisted!
		spell:setMsg(85);
		return 0;
	end

	if(target:hasStatusEffect(EFFECT_STUN)) then
		-- no effect
		spell:setMsg(75);
	else
		target:addStatusEffect(EFFECT_STUN,1,0,duration*resist);
		spell:setMsg(236);
	end

	return EFFECT_STUN;
end;