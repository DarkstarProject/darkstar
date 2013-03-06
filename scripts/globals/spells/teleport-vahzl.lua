-----------------------------------------
-- Spell: Teleport-Vahzl
-----------------------------------------

require("scripts/globals/teleports");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
   		if (target:hasKeyItem(355) == true) then
   				toVahzl(target);
   		end;
        return 0;
end;