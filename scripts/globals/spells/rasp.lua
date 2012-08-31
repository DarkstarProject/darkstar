-----------------------------------------
-- Spell: Rasp
-- Deals earth damage that lowers an enemy's dexterity and gradually reduces its HP. 
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	if(target:getStatusEffect(EFFECT_CHOKE) ~= nil) then
		spell:setMsg(75); -- no effect
	else		
		bonus = AffinityBonus(caster,spell);
		dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
		resist = applyResistance(caster,spell,target,dINT,36,bonus);
		if(resist <= 0.125) then
			spell:setMsg(85);
		else
			if(target:getStatusEffect(EFFECT_SHOCK) ~= nil) then
				target:delStatusEffect(EFFECT_SHOCK);
			end;
			sINT = caster:getStat(MOD_INT);
			DOT = getElementalDebuffDOT(sINT);
			effect = target:getStatusEffect(EFFECT_RASP);
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
					target:delStatusEffect(EFFECT_RASP);
				end;
				spell:setMsg(237);
				duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
				target:updateEnmity(caster,300,1);
				target:addStatusEffect(EFFECT_RASP,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASBLE);
			end;
		end;
	end;
	
	return EFFECT_RASP;
	
end;