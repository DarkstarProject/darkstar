-----------------------------------------
-- Spell: Death
-- Instant K.O.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

	if(target:hasStatusEffect(EFFECT_MAGIC_SHIELD)) then
		spell:setMsg(75);
		return 0;
	end

	-- is ko'd
	spell:setMsg(203);

	target:setHP(0);

	return 0;
end;