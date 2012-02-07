-----------------------------------------
--	
--	Spell: Refesg
--	Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell) 
	
	duration = 150;
	target:addStatusEffect(EFFECT_REFRESH,1,3,duration,FLAG_DISPELABLE);
	return 0;
end;