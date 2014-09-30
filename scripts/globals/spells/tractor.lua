-----------------------------------------
-- Spell: Tractor
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
printf("Caster Zone: %u",caster:getZone():getID());
    target:sendTractor(caster:getXPos(), caster:getYPos(), caster:getZPos(), target:getRotPos());

    spell:setMsg(309);

    return 1;
end;