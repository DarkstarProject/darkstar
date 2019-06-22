---------------------------------------------
-- Emetic Discharge
-- Family: Bloodlapper and Brummbar
-- Description: Transfers all ailments to target
-- Type: Enfeebling
-- Utsusemi/Blink absorb: 2-3 shadows
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local removables = {dsp.effect.FLASH, dsp.effect.BLINDNESS, dsp.effect.ELEGY, dsp.effect.REQUIEM, dsp.effect.PARALYSIS, dsp.effect.POISON,
                        dsp.effect.CURSE_I, dsp.effect.CURSE_II, dsp.effect.DISEASE, dsp.effect.PLAGUE, dsp.effect.WEIGHT, dsp.effect.BIND,
                        dsp.effect.BIO, dsp.effect.DIA, dsp.effect.BURN, dsp.effect.FROST, dsp.effect.CHOKE, dsp.effect.RASP, dsp.effect.SHOCK, dsp.effect.DROWN,
                        dsp.effect.STR_DOWN, dsp.effect.DEX_DOWN, dsp.effect.VIT_DOWN, dsp.effect.AGI_DOWN, dsp.effect.INT_DOWN, dsp.effect.MND_DOWN,
                        dsp.effect.CHR_DOWN, dsp.effect.ADDLE, dsp.effect.SLOW, dsp.effect.HELIX, dsp.effect.ACCURACY_DOWN, dsp.effect.ATTACK_DOWN,
                        dsp.effect.EVASION_DOWN, dsp.effect.DEFENSE_DOWN, dsp.effect.MAGIC_ACC_DOWN, dsp.effect.MAGIC_ATK_DOWN, dsp.effect.MAGIC_EVASION_DOWN,
                        dsp.effect.MAGIC_DEF_DOWN, dsp.effect.MAX_TP_DOWN, dsp.effect.MAX_MP_DOWN, dsp.effect.MAX_HP_DOWN}

    local dmg = utils.takeShadows(target, 1, math.random(2,3)) --removes 2-3 shadows
    --if removed more shadows than were up or there weren't any
    if (dmg > 0) then
        for i, effect in ipairs(removables) do
            if (mob:hasStatusEffect(effect)) then
                local statusEffect = mob:getStatusEffect(effect)
                target:addStatusEffect(effect, statusEffect:getPower(), statusEffect:getTickCount(), statusEffect:getDuration())
                mob:delStatusEffect(effect)
            end
        end
    end

    skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT) -- no effect
    return 0
end
