-----------------------------------------
-- Spell: Chaotic Eye
-- Silences an enemy
-- Spell cost: 13 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 32
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Conserve MP
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local typeEffect = EFFECT_SILENCE;
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0,typeEffect);
    local duration = 180 * resist;

    if (resist > 0.5) then -- Do it!
        if (target:isFacing(caster)) then
            if (target:addStatusEffect(typeEffect,1,0,duration)) then
                spell:setMsg(236);
            else
                spell:setMsg(75);
            end;
        else
            spell:setMsg(75);
        end;
    else
        spell:setMsg(85);
    end;

    return typeEffect;
end;
