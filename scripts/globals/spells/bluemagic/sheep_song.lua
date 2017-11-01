-----------------------------------------
-- Spell: Sheep Song
-- Puts all enemies within range to sleep
-- Spell cost: 22 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Light)
-- Blue Magic Points: 2
-- Stat Bonus: CHR+1, HP+5
-- Level: 16
-- Casting Time: Casting Time: 3 seconds
-- Recast Time: Recast Time: 60 seconds
-- Duration: 60 seconds
-- Magic Bursts on: Transfixion, Fusion, and Light
-- Combos: Auto Regen
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffect = EFFECT_SLEEP_I;
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.bonus = 0;
    params.effect = typeEffect;
    resist = applyResistanceEffect(caster, target, spell, params);
    local duration = 60 * resist;

    if (resist > 0.5) then -- Do it!
        if (target:addStatusEffect(typeEffect,1,0,duration)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end;

    return typeEffect;
end;
