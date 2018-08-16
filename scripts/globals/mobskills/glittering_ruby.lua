---------------------------------------------
-- Glittering Ruby
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
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effect = math.random()
    local effectid = dsp.effect.STR_BOOST
    if (effect<=0.14) then --STR
        effectid = dsp.effect.STR_BOOST
    elseif (effect<=0.28) then --DEX
        effectid = dsp.effect.DEX_BOOST
    elseif (effect<=0.42) then --VIT
        effectid = dsp.effect.VIT_BOOST
    elseif (effect<=0.56) then --AGI
        effectid = dsp.effect.AGI_BOOST
    elseif (effect<=0.7) then --INT
        effectid = dsp.effect.INT_BOOST
    elseif (effect<=0.84) then --MND
        effectid = dsp.effect.MND_BOOST
    else --CHR
        effectid = dsp.effect.CHR_BOOST
    end

    target:addStatusEffect(effectid,math.random(12,14),0,90)
    skill:setMsg(dsp.msg.basic.SKILL_GAIN_EFFECT)
    return effectid
end
