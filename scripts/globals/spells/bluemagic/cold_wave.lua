-----------------------------------------
-- Spell: Cold Wave
-- Deals ice damage that lowers Agility and gradually reduces HP of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Ice)
-- Blue Magic Points: 1
-- Stat Bonus: INT-1
-- Level: 52
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Induration, Distortion, and Darkness
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local typeEffect = EFFECT_FROST;
    local dINT = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.bonus = 0;
    params.effect = nil;
    local resist = applyResistance(caster, target, spell, params);

    if (target:getStatusEffect(EFFECT_BURN) ~= nil) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    elseif (resist > 0.5) then
        if (target:getStatusEffect(EFFECT_CHOKE) ~= nil) then
            target:delStatusEffect(EFFECT_CHOKE);
        end;
        local sINT = caster:getStat(MOD_INT);
        local DOT = getElementalDebuffDOT(sINT);
        local effect = target:getStatusEffect(typeEffect);
        local noeffect = false;
        if (effect ~= nil) then
            if (effect:getPower() >= DOT) then
                noeffect = true;
            end;
        end;
        if (noeffect) then
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
        else
            if (effect ~= nil) then
                target:delStatusEffect(typeEffect);
            end;
                spell:setMsg(msgBasic.MAGIC_ENFEEB);
            local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
            target:addStatusEffect(typeEffect,DOT,3,ELEMENTAL_DEBUFF_DURATION,FLAG_ERASABLE);
        end;
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end;

    return typeEffect;
end;
