-----------------------------------------
-- Spell: Tractor
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    -- target:setPos(caster:getXPos(), caster:getYPos(), caster:getZPos());

    return 0;
end;