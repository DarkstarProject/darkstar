---------------------------------------------
-- Emetic Discharge
-- Family: Bloodlapper and Brummbar
-- Description: Transfers all ailments to target
-- Type: Enfeebling
-- Utsusemi/Blink absorb: 2-3 shadows
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local removables = {EFFECT.FLASH, EFFECT.BLINDNESS, EFFECT.ELEGY, EFFECT.REQUIEM, EFFECT.PARALYSIS, EFFECT.POISON,
                        EFFECT.CURSE_I, EFFECT.CURSE_II, EFFECT.DISEASE, EFFECT.PLAGUE, EFFECT.WEIGHT, EFFECT.BIND,
                        EFFECT.BIO, EFFECT.DIA, EFFECT.BURN, EFFECT.FROST, EFFECT.CHOKE, EFFECT.RASP, EFFECT.SHOCK, EFFECT.DROWN,
                        EFFECT.STR_DOWN, EFFECT.DEX_DOWN, EFFECT.VIT_DOWN, EFFECT.AGI_DOWN, EFFECT.INT_DOWN, EFFECT.MND_DOWN,
                        EFFECT.CHR_DOWN, EFFECT.ADDLE, EFFECT.SLOW, EFFECT.HELIX, EFFECT.ACCURACY_DOWN, EFFECT.ATTACK_DOWN,
                        EFFECT.EVASION_DOWN, EFFECT.DEFENSE_DOWN, EFFECT.MAGIC_ACC_DOWN, EFFECT.MAGIC_ATK_DOWN, EFFECT.MAGIC_EVASION_DOWN,
                        EFFECT.MAGIC_DEF_DOWN, EFFECT.MAX_TP_DOWN, EFFECT.MAX_MP_DOWN, EFFECT.MAX_HP_DOWN};

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

    skill:setMsg(msgBasic.SKILL_NO_EFFECT); -- no effect
    return 0;
end;
