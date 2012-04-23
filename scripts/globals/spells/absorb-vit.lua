--------------------------------------
-- 	Spell: Absorb-VIT
-- 	Steals an enemy's vitality.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_VIT_DOWN) ~= nil) or (caster:getStatusEffect(EFFECT_VIT_BOOST) ~=nil) then
		spell:setMsg(75); -- no effect
	else		
		staff = StaffBonus(caster,spell);
		dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,37,staff);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			spell:setMsg(331);
			target:updateEnmity(caster,640,1);
			caster:addStatusEffect(EFFECT_VIT_BOOST,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains VIT
			target:addStatusEffect(EFFECT_VIT_DOWN,ABSORB_SPELL_AMOUNT*resist, ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASBLE);    -- target loses VIT
		end
	end
	
	return EFFECT_VIT_DOWN;
	
end;