-----------------------------------------
-- Spell: Venom Shell
-- Poisons enemies within range and gradually reduces their HP
-- Spell cost: 86 MP
-- Monster Type: Aquans
-- Spell Type: Magical (Water)
-- Blue Magic Points: 3
-- Stat Bonus: MND+2
-- Level: 42
-- Casting Time: 3 seconds
-- Recast Time: 45 seconds
-- Magic Bursts on: Reverberation, Distortion, and Darkness
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

    local typeEffect = EFFECT_POISON
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0,typeEffect);
    local duration = 180 * resist;
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
