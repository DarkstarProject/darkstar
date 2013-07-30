-----------------------------------------
-- Spell: Stun
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
	local duration = 5;

	local taff = AffinityBonus(caster,spell) + 300;
	local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
	local resist = applyResistance(caster,spell,target,dINT,37,bonus);
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