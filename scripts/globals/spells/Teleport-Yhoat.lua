-----------------------------------------
-- Spell: teleport yhoat
-----------------------------------------
require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   if (target:hasKeyItem(356) == true) then
   toYhoat(target);
   end;
end;

