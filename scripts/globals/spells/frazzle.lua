-----------------------------------------
-- Spell: Frazzle
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- onMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    local power = 35;
    local duration = 120 * applyResistanceEffect(caster,spell,target,dMND,power,0,EFFECT_MAGIC_EVASION_DOWN);

    if (duration >= 60) then
        if (target:addStatusEffect(EFFECT_MAGIC_EVASION_DOWN,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_MAGIC_EVASION_DOWN;
end;
