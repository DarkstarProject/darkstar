-----------------------------------------
-- Spell: Light of Penance
-- Reduces an enemy's TP. Additional effect: Blindness and "Bind"
-- Spell cost: 53 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Light)
-- Blue Magic Points: 5
-- Stat Bonus: CHR+1, HP+15
-- Level: 58
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffectOne = EFFECT_BLINDNESS;
    local typeEffectTwo = EFFECT_BIND;
    local params = {};
    params.diff = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.bonus = 1.0;
    local resist = applyResistance(caster, target, spell, params);
    local duration = 30 * resist;
    local power = 100 * resist;
    local returnEffect = typeEffectOne;

    if (resist >= 0.5) then
        if (target:isFacing(caster)) then
            if (target:hasStatusEffect(typeEffectOne) and target:hasStatusEffect(typeEffectTwo) and target:getTP() == 0) then
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
            elseif (target:hasStatusEffect(typeEffectOne) and target:hasStatusEffect(typeEffectTwo)) then
                target:delTP(power);
                spell:setMsg(431); -- tp reduced
            elseif (target:hasStatusEffect(typeEffectOne)) then
                target:addStatusEffect(typeEffectTwo,1,0,duration);
                target:delTP(power);
                returnEffect = typeEffectTwo; -- make it return bind message if blind can't be inflicted
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            else
                target:addStatusEffect(typeEffectOne,50,0,duration);
                target:addStatusEffect(typeEffectTwo,1,0,duration);
                target:delTP(power);
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            end;
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end;
    end;

    return returnEffect;
end;
