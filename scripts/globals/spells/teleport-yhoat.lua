-----------------------------------------
-- Spell: Teleport-Yhoat
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(356) == true) then
   				toYhoat(target);
   		end;
        return 0;
end;