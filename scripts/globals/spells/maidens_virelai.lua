-----------------------------------------
-- Spell: Maiden's Virelai
-- Charms pet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    spell:setMsg(137);

    return EFFECT_CHARM;
end;