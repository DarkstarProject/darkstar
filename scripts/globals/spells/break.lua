-----------------------------------------
-- Spell: Breakga
-- Temporarily blinds an enemy, greatly lowering its accuracy.
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
    bonus = AffinityBonus(caster,spell);

    -- Duration, including resistance.  Unconfirmed.
    duration = 30 * applyResistance(caster,spell,target,dINT,35,bonus);

    if(resist > 0.0625) then
        if(target:addStatusEffect(EFFECT_PETRIFICATION,1,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_PETRIFICATION;
end;