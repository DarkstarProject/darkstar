-----------------------------------------
-- Spell: Teleport-Dem
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
  		if (target:hasKeyItem(DEM_GATE_CRYSTAL) == true) then
  				toDem(target);
   		end;
        return 0;
end;