-----------------------------------------
-- Spell: Teleport-Mea
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(354) == true) then
   				toMea(target);
   		end;
        return 0;
end;