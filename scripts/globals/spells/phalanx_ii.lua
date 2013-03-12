-----------------------------------------
--  Spell: PHALANX
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
    enhskill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
    final = 0;
    local merits = caster:getMerit(MERIT_PHALANX_II);

    duration = 90 + (30 * merits);

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    final = (enhskill / 25) + (3 * merits) + 1;

    if(final>35) then
        final = 35;
    end

    if(target:addStatusEffect(EFFECT_PHALANX,final,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end

    return EFFECT_PHALANX;
end;