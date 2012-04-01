-----------------------------------------
-- Spell: Mage's Ballad
-- Gradually restores target's MP.
-----------------------------------------
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
        
    local mp = 1;
	
    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_BALLAD);
    target:addStatusEffect(EFFECT_BALLAD,mp,3,120);
end;
