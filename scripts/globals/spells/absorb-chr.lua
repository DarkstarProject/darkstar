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

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_CHR_DOWN) ~= nil) or (caster:getStatusEffect(EFFECT_CHR_BOOST) ~=nil) then
		spell:setMsg(75); -- no effect
	else		
		bonus = AffinityBonus(caster,spell);
		dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,37,bonus);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(335);
			target:updateEnmity(caster,640,1);
			caster:addStatusEffect(EFFECT_CHR_BOOST,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains CHR
			target:addStatusEffect(EFFECT_CHR_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses CHR
		end
	end
	
	return EFFECT_CHR_DOWN;
	
end;