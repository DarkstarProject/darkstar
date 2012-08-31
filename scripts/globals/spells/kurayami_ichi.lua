-----------------------------------------
-- Spell: Kurayami:Ichi
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	
	-- Base Stats
	dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
	bonus = AffinityBonus(caster,spell);
	--Duration Calculation
	duration = 180 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,bonus);
	--Kurayami base power is 20 and is not affected by resistaces.
	power = 20;
	
	--Calculates resist chance from Reist Blind
	if(math.random(0,100) >= target:getMod(MOD_BLINDRES)) then
		if(duration >= 80) then
			-- Erases a weaker blind and applies the stronger one
			if(target:getStatusEffect(EFFECT_BLINDNESS) ~= nil) then
				if(target:getStatusEffect(EFFECT_BLINDNESS) < power) then
					target:delStatusEffect(EFFECT_BLINDNESS);	
					target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
					spell:setMsg(267);

				else
				
					spell:setMsg(75);
				
				end
			
			else
				
				target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration);
				spell:setMsg(267);

			end
		
		else

			spell:setMsg(85);

		end
	else

		spell:setMsg(284);

	end
	
	target:updateEnmity(caster,320,1);
	
	return EFFECT_BLINDNESS;
	
end;
