-----------------------------------------
-- Spell: Retrace
-- Transports player to their home point. Can cast on allies.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/teleports");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    local Allegiance = target:getCampaignAllegiance();
    if (Allegiance == 1) then
    return 0;
    elseif (Allegiance == 2) then
    return 0;
    elseif (Allegiance == 3) then
    return 0;
    else
    return;
    end
end;

function onSpellCast(caster,target,spell)
    target:addStatusEffectEx(EFFECT_TELEPORT,0,TELEPORT_RETRACE,0,3.4);
    spell:setMsg(93);
    return 0;
end;
