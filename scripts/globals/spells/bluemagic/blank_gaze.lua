-----------------------------------------
-- Spell: Blank Gaze
-- Removes one beneficial magic effect from an enemy
-- Spell cost: 25 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: None
-- Level: 38
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Transfixion, Fusion, Light
-- Combos: None
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");
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
    
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local effect = EFFECT_NONE;

    if (resist > 0.0625) then
        if (target:isFacing(caster)) then
            spell:setMsg(341);
            effect = target:dispelStatusEffect();
            if (effect == EFFECT_NONE) then
                spell:setMsg(75);
            end;
        else
            spell:setMsg(75);
        end;
    else
        spell:setMsg(85);
    end

    return effect;
end;