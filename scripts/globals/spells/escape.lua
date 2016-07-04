-----------------------------------------
-- Spell: Escape
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/teleports");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    spell:setMsg(93);
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_ESCAPE,0,4);
    --Escape(target, target:getZoneID());

    return 0;
end;