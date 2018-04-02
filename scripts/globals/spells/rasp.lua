-----------------------------------------
-- Spell: Rasp
-- Deals earth damage that lowers an enemy's dexterity and gradually reduces its HP.
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

    if (target:getStatusEffect(dsp.effects.CHOKE) ~= nil) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no effect
    else
        local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        local params = {};
        params.diff = nil;
        params.attribute = MOD_INT;
        params.skillType = 36;
        params.bonus = 0;
        params.effect = nil;
        local resist = applyResistance(caster, target, spell, params);
        if (resist <= 0.125) then
            spell:setMsg(msgBasic.MAGIC_RESIST);
        else
            if (target:getStatusEffect(dsp.effects.SHOCK) ~= nil) then
                target:delStatusEffect(dsp.effects.SHOCK);
            end;
            local sINT = caster:getStat(MOD_INT);
            local DOT = getElementalDebuffDOT(sINT);
            local effect = target:getStatusEffect(dsp.effects.RASP);
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
                    target:delStatusEffect(dsp.effects.RASP);
                end;
                spell:setMsg(msgBasic.MAGIC_ENFEEB);
                local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
                target:addStatusEffect(dsp.effects.RASP,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASABLE);
            end;
        end;
    end;
    return dsp.effects.RASP;
end;
