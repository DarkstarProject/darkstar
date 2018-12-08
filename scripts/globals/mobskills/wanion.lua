---------------------------------------------
-- Wanion
-- Transfers all ailments the Seether itself has to players in AoE range.
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    -- list of effects to give in AoE
    local effects = {dsp.effect.POISON,dsp.effect.PARALYSIS,dsp.effect.BLINDNESS,dsp.effect.SILENCE,
        dsp.effect.WEIGHT,dsp.effect.SLOW,dsp.effect.ADDLE,dsp.effect.DIA,dsp.effect.BIO,dsp.effect.BURN,
        dsp.effect.FROST,dsp.effect.CHOKE,dsp.effect.RASP,dsp.effect.SHOCK,dsp.effect.DROWN,dsp.effect.STR_DOWN,
        dsp.effect.DEX_DOWN,dsp.effect.VIT_DOWN,dsp.effect.AGI_DOWN,dsp.effect.INT_DOWN,dsp.effect.MND_DOWN,
        dsp.effect.CHR_DOWN,dsp.effect.ACCURACY_DOWN,dsp.effect.ATTACK_DOWN,dsp.effect.EVASION_DOWN,
        dsp.effect.DEFENSE_DOWN,dsp.effect.MAGIC_DEF_DOWN,dsp.effect.MAGIC_ACC_DOWN,dsp.effect.MAGIC_ATK_DOWN}

    for i, effect in ipairs(effects) do
        if mob:hasStatusEffect(effect) then
            local currentEffect = mob:getStatusEffect(effect)
            MobStatusEffectMove(mob, target, effect, currentEffect:getPower(), currentEffect:getTick(), currentEffect:getTimeRemaining() / 1000)
            mob:delStatusEffect(effect)
        end
    end
    skill:setMsg(dsp.msg.basic.NONE)
end