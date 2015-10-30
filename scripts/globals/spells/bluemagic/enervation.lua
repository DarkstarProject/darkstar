-----------------------------------------
-- Spell: Enervation
-- Lowers the defense and magical defense of enemies within range
-- Spell cost: 48 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 5
-- Stat Bonus: HP-5, MP+5
-- Level: 67
-- Casting Time: 6 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Counter
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

    local typeEffectOne = EFFECT_DEFENSE_DOWN;
    local typeEffectTwo = EFFECT_MAGIC_DEF_DOWN;
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT) - target:getStat(MOD_INT),BLUE_SKILL,1.0);
    local duration = 30 * resist;
    local returnEffect = typeEffectOne;

    if (resist >= 0.5) then
        if (target:hasStatusEffect(typeEffectOne) and target:hasStatusEffect(typeEffectTwo)) then -- the def/mag def down does not overwrite the same debuff from any other source
            spell:setMsg(75); -- no effect
        elseif (target:hasStatusEffect(typeEffectOne)) then
            target:addStatusEffect(typeEffectTwo,8,0,duration);
            returnEffect = typeEffectTwo;
            spell:setMsg(236);
        elseif (target:hasStatusEffect(typeEffectTwo)) then
            target:addStatusEffect(typeEffectOne,10,0,duration);
            spell:setMsg(236);
        else
            target:addStatusEffect(typeEffectOne,10,0,duration);
            target:addStatusEffect(typeEffectTwo,8,0,duration);
            spell:setMsg(236);
        end;
    end;

    return returnEffect;
end;