---------------------------------------------
-- Astral Flow
-- Will make existing pet use astral flow skill
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    -- need a pet to use astral flow
    if (mob:hasPet() == false) then
        return 1;
    end

    local pet = mob:getPet();

    if (pet:getSystem() ~= 5) then
        -- pet is not an avatar
        return 1;
    end

    -- pet needs to be active
    if (pet:hasStatusEffect(dsp.effects.LULLABY) or
        pet:hasStatusEffect(dsp.effects.STUN) or
        pet:hasStatusEffect(dsp.effects.PETRIFICATION) or
        pet:hasStatusEffect(dsp.effects.SLEEP_II) or
        pet:hasStatusEffect(dsp.effects.SLEEP_I) or
        pet:hasStatusEffect(dsp.effects.TERROR)) then
        return 1;
    end

    if (mob:getMobMod(MOBMOD_SCRIPTED_2HOUR) == 1) then
        return 0;
    elseif (mob:getHPP() <= mob:getMobMod(MOBMOD_2HOUR_PROC)) then
        return 0;
    end

    return 1;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.ASTRAL_FLOW;
    skill:setMsg(msgBasic.USES);

    -- Find proper pet skill
    local pet = mob:getPet();
    local petFamily = pet:getFamily();
    local skillId = 0;

    if (petFamily == 34 or petFamily == 379) then
        -- carbuncle
        skillId = 919; -- searing light
    elseif (petFamily == 36 or petFamily == 381) then
        -- fenrir
        skillId = 839; -- howling moon
    elseif (petFamily == 37 or petFamily == 382) then
        -- garuda
        skillId = 916; -- aerial blast
    elseif (petFamily == 38 or petFamily == 383) then
        -- ifrit
        skillId = 913; -- inferno
    elseif (petFamily == 40 or petFamily == 384) then
        -- levi
        skillId = 915; -- tidal wave
    elseif (petFamily == 43 or petFamily == 386) then
        -- ramuh
        skillId = 918; -- judgment bolt
    elseif (petFamily == 44 or petFamily == 387) then
        -- shiva
        skillId = 917; -- diamond dust
    elseif (petFamily == 45 or petFamily == 388) then
        -- titan
        skillId = 914; -- earthen fury
    else
        printf("Astral_Flow_Pet couldn't find astral skill for (%d) family", petFamily);
        skillId = 919; -- searing light
    end

    -- Astral flow has no effect if pet is inactive
    if (pet:hasStatusEffect(dsp.effects.LULLABY) or
        pet:hasStatusEffect(dsp.effects.STUN) or
        pet:hasStatusEffect(dsp.effects.PETRIFICATION) or
        pet:hasStatusEffect(dsp.effects.SLEEP_II) or
        pet:hasStatusEffect(dsp.effects.SLEEP_I) or
        pet:hasStatusEffect(dsp.effects.TERROR)) then
        return typeEffect;
    end

    pet:useMobAbility(skillId);

    return typeEffect;
end;
