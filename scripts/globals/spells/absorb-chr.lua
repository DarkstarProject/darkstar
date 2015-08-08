--------------------------------------
-- 	Spell: Absorb-CHR
-- 	Steals an enemy's Charism.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	
	if (target:hasStatusEffect(EFFECT_CHR_DOWN) or caster:hasStatusEffect(EFFECT_CHR_BOOST)) then
		spell:setMsg(75); -- no effect
	else		
		local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		local resist = applyResistance(caster,spell,target,dINT,37,0);
		if (resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(335);
			caster:addStatusEffect(EFFECT_CHR_BOOST,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains CHR
			target:addStatusEffect(EFFECT_CHR_DOWN,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses CHR
		end
	end
	return EFFECT_CHR_DOWN;
end;