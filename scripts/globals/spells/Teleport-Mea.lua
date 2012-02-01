-----------------------------------------
-- Spell: teleport mea
-----------------------------------------
require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   if (target:hasKeyItem(354) == true) then
   toMea(target);
   end;
end;

