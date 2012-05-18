-----------------------------------------
-- Spell: Refresh
-- Gradually restores target party member's MP
-- Composure increases duration 3x
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell) 
    
	   
    mp = 3; 
	duration = 150;
	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end	
			
	if (target:getMainLvl() < 41) then
		duration = duration * target:getMainLvl() / 41;
	end
	
	target:delStatusEffect(EFFECT_REFRESH);
	target:addStatusEffect(EFFECT_REFRESH,mp,3,duration);
    return 0;
	
end;