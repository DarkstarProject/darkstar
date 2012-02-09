-----------------------------------------
-- Spell: Teleport-Vahzl
-----------------------------------------
require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(355) == true) then
   				toVahzl(target);
   		end;
end;