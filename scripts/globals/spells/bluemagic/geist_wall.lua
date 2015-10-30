-----------------------------------------
-- Spell: Geist Wall
-- Removes one beneficial magic effect from enemies within range
-- Spell cost: 35 MP
-- Monster Type: Lizards
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 3
-- Stat Bonus: HP-5, MP+10
-- Level: 46
-- Casting Time: 3 seconds
-- Recast Time: 30 seconds
-- Magic Bursts on: Compression, Gravitation, Darkness
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
        spell:setMsg(341);
        effect = target:dispelStatusEffect();
        if (effect == EFFECT_NONE) then
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return effect;
end;