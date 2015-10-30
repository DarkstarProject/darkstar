-----------------------------------------
-- Spell: Curse
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

    -- Pull base stats.
    dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

    power = 50;

    -- Duration, including resistance.  Unconfirmed.
    duration = 300 * applyResistanceEffect(caster,spell,target,dINT,35,0,EFFECT_CURSE_I);

    if (duration >= 150) then --Do it!
        if (target:addStatusEffect(EFFECT_CURSE_I,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_CURSE_I;
end;