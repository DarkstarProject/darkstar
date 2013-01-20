-----------------------------------------
-- Spell: Tonko: san
-- Lessens chance of being detected by sound
-- Duration is 7 minutes (non-random duration)
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    if (target:hasStatusEffect(EFFECT_INVISIBLE) == false) then
        spell:setMsg(0);
        target:addStatusEffect(EFFECT_INVISIBLE,0,10,420);
    else
        spell:setMsg(75); -- no effect.
    end
end;
