-----------------------------------------
-- Spell: Teleport-Holla
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(352) == true) then
   				toHolla(target);
   		end;
        return 0;
end;