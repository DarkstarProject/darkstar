---------------------------------------------
-- Glittering Ruby
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effect = math.random();
    local effectid = dsp.effects.STR_BOOST;
    if (effect<=0.14) then --STR
        effectid = dsp.effects.STR_BOOST;
    elseif (effect<=0.28) then --DEX
        effectid = dsp.effects.DEX_BOOST;
    elseif (effect<=0.42) then --VIT
        effectid = dsp.effects.VIT_BOOST;
    elseif (effect<=0.56) then --AGI
        effectid = dsp.effects.AGI_BOOST;
    elseif (effect<=0.7) then --INT
        effectid = dsp.effects.INT_BOOST;
    elseif (effect<=0.84) then --MND
        effectid = dsp.effects.MND_BOOST;
    else --CHR
        effectid = dsp.effects.CHR_BOOST;
    end

    target:addStatusEffect(effectid,math.random(12,14),0,90);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return effectid;
end
