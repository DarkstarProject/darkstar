-----------------------------------------
-- Spell: Awful Eye

-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	
	if(target:hasStatusEffect(EFFECT_STR_DOWN)) then
		spell:setMsg(75); 
	else		
		local bonus = AffinityBonus(caster, spell:getElement());
		local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		local resist = applyResistance(caster,spell,target,dINT,37,bonus);
		if(resist <= 0) then
			spell:setMsg(85);
		else
			spell:setMsg(329);
			target:addStatusEffect(EFFECT_STR_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE); -- target loses STR
		end
	end
	return EFFECT_STR_DOWN;
end;