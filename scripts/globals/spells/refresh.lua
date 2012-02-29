-----------------------------------------
-- Spell: Refresh
-- Gradually restores target party member's MP
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell) 
    
	   
    mp = 3; 
	duration = 150;
	
			
	if (target:getMainLvl() < 41) then
		duration = duration * target:getMainLvl() / 41;
	end
	
	target:delStatusEffect(EFFECT_REFRESH);
	target:addStatusEffect(EFFECT_REFRESH,mp,3,duration,FLAG_DISPELABLE);
    return 0;
	
end;