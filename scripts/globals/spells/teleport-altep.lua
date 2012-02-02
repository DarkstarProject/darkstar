-----------------------------------------
-- Spell: teleport altep
-----------------------------------------
require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   if (target:hasKeyItem(357) == true) then
   toAltep(target);
   end;
end;

