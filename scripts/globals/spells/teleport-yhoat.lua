-----------------------------------------
-- Spell: Teleport-Yhoat
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(356) == true) then
   				toYhoat(target);
   		end;
        return 0;
end;