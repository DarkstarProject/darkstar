-----------------------------------------
-- Spell: Burn
-- Deals fire damage that lowers an enemy's intelligence and gradually reduces its HP.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_DROWN) ~= nil) then
		spell:setMsg(75); -- no effect
	else		
		bonus = AffinityBonus(caster, spell);
		dINT = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,36,bonus);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			if(target:getStatusEffect(EFFECT_FROST) ~= nil) then
				target:delStatusEffect(EFFECT_FROST);
			end;
			sINT = caster:getStat(MOD_INT);
			DOT = getElementalDebuffDOT(sINT);
			effect = target:getStatusEffect(EFFECT_BURN);
			noeffect = false;
			if(effect ~= nil) then
				if(effect:getPower() >= DOT) then
					noeffect = true;
				end;
			end;
			if(noeffect) then
				spell:setMsg(75); -- no effect
			else
				if(effect ~= nil) then
					target:delStatusEffect(EFFECT_BURN);
				end;
				spell:setMsg(237);
				duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
				target:addStatusEffect(EFFECT_BURN,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASBLE);
			end;
		end;
	end;
	
	return EFFECT_BURN;
	
end;