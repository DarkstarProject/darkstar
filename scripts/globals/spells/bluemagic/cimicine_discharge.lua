-----------------------------------------
-- Bluemagic: Cimicine Discharge
-- Reduces the attack speed of enemies within range.
-- DEX +1  AGI +2
-- Lvl.: 78 MP Cost: 32 Blue Points: 3
--
-- Duration: Variable, with max of 3 min
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

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
    local duration = math.random(60,180);
    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL,0);

    if(resist < 0.5) then
        spell:setMsg(85); --resist message
        return EFFECT_SLOW;
    end

    if(target:addStatusEffect(EFFECT_SLOW,200,0,getBlueEffectDuration(caster,resist,EFFECT_SLOW)) then
        spell:setMsg(236);
    else
        spell:setMsg(75);
    end

    return EFFECT_SLOW;
end;