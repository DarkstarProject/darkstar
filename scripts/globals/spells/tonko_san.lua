-----------------------------------------
-- Spell: Tonko: san
-- Lessens chance of being detected by sound
-- Duration is 7 minutes (non-random duration)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(EFFECT_INVISIBLE) == false) then
        target:addStatusEffect(EFFECT_INVISIBLE,0,10,420);
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect.
    end
    return EFFECT_INVISIBLE;
end;
