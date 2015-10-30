-----------------------------------------
-- Spell: Endark
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)

    return 0;

end;


function onSpellCast(caster,target,spell)
    local effect = EFFECT_ENDARK;
    local magicskill = target:getSkillLevel(DARK_MAGIC_SKILL);
    local duration = 180;
    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local potency = (magicskill / 8) + 12.5;

    if (target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(230);
    else
        spell:setMsg(75);
    end
    return effect;
end;