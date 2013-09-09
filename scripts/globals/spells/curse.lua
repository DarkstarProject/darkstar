-----------------------------------------
-- Spell: Blind
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

    -- Pull base stats.
    dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    bonus = AffinityBonus(caster,spell:getElement());

    power = 50;

    -- Duration, including resistance.  Unconfirmed.
    duration = 300 * applyResistance(caster,spell,target,dINT,35,bonus);

    if(100 * math.random() >= target:getMod(MOD_CURSERES)) then
        if(duration >= 90) then --Do it!

            if(target:addStatusEffect(EFFECT_CURSE,power,0,duration)) then
                spell:setMsg(236);
            else

                spell:setMsg(75);
            end
        else
            spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return EFFECT_CURSE;
end;