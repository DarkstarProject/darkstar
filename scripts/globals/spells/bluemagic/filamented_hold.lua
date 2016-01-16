-----------------------------------------
-- Spell: Filamented Hold
-- Reduces the attack speed of enemies within a fan-shaped area originating from the caster
-- Spell cost: 38 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: VIT+1
-- Level: 52
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
-- Magic Bursts on: Scission, Gravitation, and Darkness
-- Combos: Clear Mind
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

    local typeEffect = EFFECT_SLOW
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0,typeEffect);
    local duration = 90 * resist;
    local power = 256;
    
    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect,power,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return typeEffect;
end;
