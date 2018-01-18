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
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local params = {};
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.effect = EFFECT_INT_DOWN;
    local resist = applyResistance(caster, target, spell, params);
    local duration = 30 * resist;
    local power = 6;

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(params.effect,power,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end;

    return params.effect;
end;

