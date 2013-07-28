-----------------------------------------
-- Spell: Dokumori: Ichi
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
    local effect = EFFECT_POISON;
    -- Base Stats
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local bonus = AffinityBonus(caster,spell:getElement());
    --Duration Calculation
    local duration = 60 * applyResistance(caster,spell,target,dINT,NINJUTSU_SKILL,bonus);
    local power = 3;

    --Calculates resist chanve from Reist Blind
    if(target:hasStatusEffect(effect)) then
        spell:setMsg(75); -- no effect
        return effect;
    end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        if(duration >= 30) then
            if(target:addStatusEffect(effect,power,3,duration)) then
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
    return effect;
end;