-----------------------------------------
-- Spell: Tractor
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    -- printf("Caster Zone: %u",caster:getZoneID());
    target:sendTractor(caster:getXPos(), caster:getYPos(), caster:getZPos(), target:getRotPos());

    spell:setMsg(309);

    return 1;
end;
