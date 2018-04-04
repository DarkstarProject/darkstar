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
    local removables = {dsp.effects.FLASH, dsp.effects.BLINDNESS, dsp.effects.ELEGY, dsp.effects.REQUIEM, dsp.effects.PARALYSIS, dsp.effects.POISON,
                        dsp.effects.CURSE_I, dsp.effects.CURSE_II, dsp.effects.DISEASE, dsp.effects.PLAGUE, dsp.effects.WEIGHT, dsp.effects.BIND,
                        dsp.effects.BIO, dsp.effects.DIA, dsp.effects.BURN, dsp.effects.FROST, dsp.effects.CHOKE, dsp.effects.RASP, dsp.effects.SHOCK, dsp.effects.DROWN,
                        dsp.effects.STR_DOWN, dsp.effects.DEX_DOWN, dsp.effects.VIT_DOWN, dsp.effects.AGI_DOWN, dsp.effects.INT_DOWN, dsp.effects.MND_DOWN,
                        dsp.effects.CHR_DOWN, dsp.effects.ADDLE, dsp.effects.SLOW, dsp.effects.HELIX, dsp.effects.ACCURACY_DOWN, dsp.effects.ATTACK_DOWN,
                        dsp.effects.EVASION_DOWN, dsp.effects.DEFENSE_DOWN, dsp.effects.MAGIC_ACC_DOWN, dsp.effects.MAGIC_ATK_DOWN, dsp.effects.MAGIC_EVASION_DOWN,
                        dsp.effects.MAGIC_DEF_DOWN, dsp.effects.MAX_TP_DOWN, dsp.effects.MAX_MP_DOWN, dsp.effects.MAX_HP_DOWN};

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
