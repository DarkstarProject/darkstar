-----------------------------------------
-- Spell: Teleport-Dem
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
  		if (target:hasKeyItem(353) == true) then
  				toDem(target);
   		end;
        return 0;
end;