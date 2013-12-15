-----------------------------------------
-- Spell: Feather Tickle
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    local tp = 15;
    if(target:getTP() == 0) then
        spell:setMsg(75); 
    else
        target:delTP(tp);
        spell:setMsg(431);
    end
    return tp;
end;