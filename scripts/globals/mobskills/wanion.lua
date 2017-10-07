---------------------------------------------------
-- Wanion
-- AoE of all status ailments it has.
---------------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    -- list of effects to give in AoE
    local effects = {EFFECT_SLOW, EFFECT_DIA, EFFECT_BIO, EFFECT_WEIGHT, EFFECT_DEFENSE_DOWN, EFFECT_PARALYSIS, EFFECT_BLINDNESS, EFFECT_SILENCE, EFFECT_POISON}
    local lastEffect = 0;
    local effectCount = false;

    for i, effect in ipairs(effects) do
        if (mob:hasStatusEffect(effect) == true) then
            effectCount = true;
            local currentEffect = mob:getStatusEffect(effect);
            local msg = MobStatusEffectMove(mob, target, effect, currentEffect:getPower(), currentEffect:getTick(), 120);
            if (msg == msgBasic.ENFEEB_IS) then
                lastEffect = effect;
            end
        end
    end

    -- all resisted
    if (lastEffect == 0) then
        skill:setMsg(msgBasic.RESIST);
    end

    -- no effects present
    if (effectCount == false) then
        skill:setMsg(msgBasic.NO_EFFECT);
    end

    return lastEffect;
end;
