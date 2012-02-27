-----------------------------------------
--	Spell: Poison
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    if(target:hasStatusEffect(EFFECT_POISON) == false) then -- This stops Poison from being stacked, since poison doesn't over write itself we can't use delete effect.
		duration = 30;
		res = target:getMod(MOD_POISONRES);
		if(res > 0) then
			res = 3 * res;
			duration = duration - res;
		end	

		cLvl = caster:getMainLvl(); -- This is a temporary fix that allows the spells damage to vary on Lvl since magic skill is broken
		if(cLvl < 18) then
			power = 1;
		end
	
		if(cLvl >= 18 and cLvl < 38) then
			power = 2;
		end
		if(cLvl >= 38 and cLvl < 56) then
			power = 3;		
		end
		if(cLvl >= 56) then
			power = 4;	
		end
	
		target:addStatusEffect(EFFECT_POISON,power,3,duration);
	end
	return 0;
end;