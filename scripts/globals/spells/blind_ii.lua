-----------------------------------------
-- Spell: Blind II
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

    local merits = 1;

    -- Pull base stats.
    dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    bonus = AffinityBonus(caster,spell);

    -- Base power.  May need more research.
    power = math.floor((dINT + 100 + (merits * 10)) / 4);

    if(power < 15) then
        power = 15;
    end

    if(power > 30) then
        power = 30;
    end

    -- Duration, including resistance.  Unconfirmed.
    duration = 180 * applyResistance(caster,spell,target,dINT,35,bonus);

    if(100 * math.random() >= target:getMod(MOD_BLINDRES)) then
        if(duration >= 90) then --Do it!

            if(target:addStatusEffect(EFFECT_BLINDNESS,power,0,duration)) then
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
    return EFFECT_BLINDNESS;
end;