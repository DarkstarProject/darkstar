-----------------------------------------
-- Spell: Teleport-Vahzl
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
   		if (target:hasKeyItem(VAHZL_GATE_CRYSTAL) == true) then
   				toVahzl(target);
            spell:setMsg(93);
        else
            spell:setMsg(283);
        end;
        return 0;
end;