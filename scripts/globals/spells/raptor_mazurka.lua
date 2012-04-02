-----------------------------------------
-- Spell: Raptor Mazurka
-- Gives party members enhanced movement
-----------------------------------------
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

        -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
        -- Since all the tiers use the same effect buff it is hard to delete a specific one.
		if(target:hasStatusEffect(EFFECT_MAZURKA) == true) then
	        target:delStatusEffect(EFFECT_MAZURKA);
		end
		
        target:addStatusEffect(EFFECT_MAZURKA,12,0,120,FLAG_DISPELABLE);
end;

