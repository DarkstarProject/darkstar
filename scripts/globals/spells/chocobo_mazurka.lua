-----------------------------------------
-- Spell: Chocobo Mazurka
-- Gives party members enhanced movement
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
	target:delStatusEffect(EFFECT_MAZURKA);
    target:addStatusEffect(EFFECT_MAZURKA,25,0,120);
    return EFFECT_MAZURKA;
end;

