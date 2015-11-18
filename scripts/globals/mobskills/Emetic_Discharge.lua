---------------------------------------------
--  Emetic Discharge
--  Family: Bloodlapper and Brummbar
--  Description: Transfers all ailments to target
--  Type: Enfeebling
--  Utsusemi/Blink absorb: 2-3 shadows
--  Notes:
---------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_ELEGY, EFFECT_REQUIEM, EFFECT_PARALYSIS, EFFECT_POISON,
                        EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE, EFFECT_WEIGHT, EFFECT_BIND, 
                        EFFECT_BIO, EFFECT_DIA, EFFECT_BURN, EFFECT_FROST, EFFECT_CHOKE, EFFECT_RASP, EFFECT_SHOCK, EFFECT_DROWN, 
                        EFFECT_STR_DOWN, EFFECT_DEX_DOWN, EFFECT_VIT_DOWN, EFFECT_AGI_DOWN, EFFECT_INT_DOWN, EFFECT_MND_DOWN,
                        EFFECT_CHR_DOWN, EFFECT_ADDLE, EFFECT_SLOW, EFFECT_HELIX, EFFECT_ACCURACY_DOWN, EFFECT_ATTACK_DOWN,
                        EFFECT_EVASION_DOWN, EFFECT_DEFENSE_DOWN, EFFECT_MAGIC_ACC_DOWN, EFFECT_MAGIC_ATK_DOWN, EFFECT_MAGIC_EVASION_DOWN,
                        EFFECT_MAGIC_DEF_DOWN, EFFECT_MAX_TP_DOWN, EFFECT_MAX_MP_DOWN, EFFECT_MAX_HP_DOWN};

    local dmg = utils.takeShadows(target, 1, math.random(2,3)); --removes 2-3 shadows
    --if removed more shadows than were up or there weren't any
    if (dmg > 0) then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                local statusEffect = mob:getStatusEffect(effect);
                target:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration());
                mob:delStatusEffect(effect);
            end;
        end;
    end;
    
    skill:setMsg(MSG_NO_EFFECT); -- no effect
    return 0;
end;