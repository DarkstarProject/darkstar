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

    local typeEffect = EFFECT_FROST;
    local dINT = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL,0);

    if (target:getStatusEffect(EFFECT_BURN) ~= nil) then
        spell:setMsg(75); -- no effect
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
            spell:setMsg(75); -- no effect
        else
            if (effect ~= nil) then
                target:delStatusEffect(typeEffect);
            end;
                spell:setMsg(237);
            local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
            target:addStatusEffect(typeEffect,DOT,3,ELEMENTAL_DEBUFF_DURATION,FLAG_ERASABLE);
        end;
    else
        spell:setMsg(85);
    end;
    
    return typeEffect;
end;
