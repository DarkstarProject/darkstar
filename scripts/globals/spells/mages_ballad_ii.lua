-----------------------------------------
-- Spell: Mage's Ballad II
-- Gradually restores target's MP.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    local mp = 2;

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:addStatusEffect(EFFECT_BALLAD,mp,3,120);

    return EFFECT_BALLAD;
end;
