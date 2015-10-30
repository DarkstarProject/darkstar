-----------------------------------------
-- Spell: Infrasonics
-- Lowers the evasion of enemies within a fan-shaped area originating from the caster
-- Spell cost: 42 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 4
-- Stat Bonus: INT+1
-- Level: 65
-- Casting Time: 5 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Induration, Distortion, Darkness
-- Combos: None
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

    local typeEffect = EFFECT_EVASION_DOWN;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local duration = 60 * resist;
    local power = 20;
    
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
