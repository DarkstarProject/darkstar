-----------------------------------------
-- Spell: Hojo:San
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
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

    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    --Power for Hojo is a flat 30% reduction
    local power = 300;
    --Duration and Resistance calculation
    local duration = 420 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,0);
    --Calculates the resist chance from Resist Blind trait
    if (math.random(0,100) >= target:getMod(MOD_SLOWRES)) then
        -- Spell succeeds if a 1 or 1/2 resist check is achieved
        if (duration >= 210) then

            if (target:addStatusEffect(EFFECT_SLOW,power,0,duration)) then
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
    return EFFECT_SLOW;
end;