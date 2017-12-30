-----------------------------------------
-- Spell: Chaotic Eye
-- Silences an enemy
-- Spell cost: 13 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 32
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Conserve MP
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffect = EFFECT_SILENCE;
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.bonus = 0;
    params.effect = typeEffect;
    local resist = applyResistanceEffect(caster, target, spell, params);
    local duration = 180 * resist;

    if (resist > 0.5) then -- Do it!
        if (target:isFacing(caster)) then
            if (target:addStatusEffect(typeEffect,1,0,duration)) then
                spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
            else
                spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
            end;
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end;
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end;

    return typeEffect;
end;
