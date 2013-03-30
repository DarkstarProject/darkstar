-----------------------------------------
-- Spell: Teleport-Yhoat
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
   		if (target:hasKeyItem(YHOATOR_GATE_CRYSTAL) == true) then
   				toYhoat(target);
            spell:setMsg(93);
        else
            spell:setMsg(283);
        end;
        return 0;
end;