-----------------------------------------
-- Spell: Teleport-Dem
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
  		if (target:hasKeyItem(353) == true) then
  				toDem(target);
   		end;
        return 0;
end;