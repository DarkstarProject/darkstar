-----------------------------------------
-- Spell: Teleport-Holla
-----------------------------------------

require("scripts/globals/teleports");
require("scripts/globals/keyitems");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(HOLLA_GATE_CRYSTAL) == true) then
   				toHolla(target);
   		end;
        return 0;
end;