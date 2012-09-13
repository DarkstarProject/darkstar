--------------------------------------
-- 	Spell: Absorb-AGI
-- 	Steals an enemy's agility.
--------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:hasStatusEffect(EFFECT_AGI_DOWN) or caster:hasStatusEffect(EFFECT_AGI_BOOST)) then
		spell:setMsg(75); -- no effect
	else		
		bonus = AffinityBonus(caster,spell);
		dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,37,bonus);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(332);
			caster:addStatusEffect(EFFECT_AGI_BOOST,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains AGI
			target:addStatusEffect(EFFECT_AGI_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses AGI
		end
	end
	return EFFECT_AGI_DOWN;
end;