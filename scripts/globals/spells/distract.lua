-----------------------------------------
-- Spell: Distract
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
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    
    -- Base power.  May need more research.
    local power = 35;

    -- Duration, including resistance.  Unconfirmed.
    local duration = 120 * applyResistanceEffect(caster,spell,target,dMND,35,0,EFFECT_EVASION_DOWN);

    if (duration >= 60) then -- Do it!
        if (target:addStatusEffect(EFFECT_EVASION_DOWN,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_EVASION_DOWN;
end;
