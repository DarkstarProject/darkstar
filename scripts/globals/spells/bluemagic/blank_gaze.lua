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
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;

    local resist = applyResistance(caster, target, spell, params);
    local effect = EFFECT_NONE;

    if (resist > 0.0625) then
        if (target:isFacing(caster)) then
            spell:setMsg(msgBasic.MAGIC_ERASE);
            effect = target:dispelStatusEffect();
            if (effect == EFFECT_NONE) then
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
            end;
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end;
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return effect;
end;
