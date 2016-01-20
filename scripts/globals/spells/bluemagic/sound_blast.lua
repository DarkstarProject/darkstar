-----------------------------------------
-- Spell: Sound Blast
-- Lowers Intelligence of enemies within range.
-- Spell cost: 25 MP
-- Monster Type: Birds
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 1
-- Stat Bonus: None
-- Level: 32
-- Casting Time: 4 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Magic Attack Bonus
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

    local typeEffect = EFFECT_INT_DOWN;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local duration = 30 * resist;
    local power = 6;

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
