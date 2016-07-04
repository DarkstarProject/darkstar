-----------------------------------------
-- Spell: Stinking Gas
-- Lowers Vitality of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Undead
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 44
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

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

    local typeEffect = EFFECT_VIT_DOWN;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local duration = 60 * resist;
    local power = 5;

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end;

    return typeEffect; 
end;
