---------------------------------------------------
-- Wanion
-- AoE of all status ailments it has.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    -- list of effects to give in AoE
    local effects = {EFFECT_SLOW, EFFECT_DIA, EFFECT_BIO, EFFECT_WEIGHT, EFFECT_DEFENSE_DOWN, EFFECT_PARALYSIS, EFFECT_BLINDNESS, EFFECT_SILENCE, EFFECT_POISON}

    local lastEffect = 0;
    local effectCount = false;

    for i, effect in ipairs(effects) do

        if(mob:hasStatusEffect(effect) == false and target:hasStatusEffect(typeEffect) == false) then
            effectCount = true;
            local statmod = MOD_INT;
            local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,ELE_ICE);
            if(resist > 0.1) then
                lastEffect = effect;
                local currentEffect = mob:getStatusEffect(effect);
                skill:setMsg(MSG_ENFEEB_IS);
                target:delStatusEffect(EFFECT_HASTE);
                target:addStatusEffect(effect,currentEffect:getPower(),3,120);--power=20;tic=0;duration=120;
            end
        end

    end

    -- all resisted
    if(lastEffect == 0) then
        skill:setMsg(MSG_RESIST);
    end

    -- no effects present
    if(effectCount == false) then
        skill:setMsg(MSG_NO_EFFECT);
    end

    return lastEffect;
end;
