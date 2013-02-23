-----------------------------------------
-- Spell: Raise
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	target:sendRaise(3);
    spell:setMsg(309);

    return 3;
end;