-----------------------------------------
-- Spell: Teleport-Altep
-----------------------------------------
require("scripts/globals/teleports");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:hasKeyItem(ALTEPA_GATE_CRYSTAL) == true) then
        target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_ALTEP,0,4.7);
        spell:setMsg(93);
    else
        spell:setMsg(msgBasic.NO_EFFECT);
    end;

    return 0;
end;
