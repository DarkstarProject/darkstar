---------------------------------------------
-- Glittering Ruby
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
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effect = math.random();
    local effectid = EFFECT.STR_BOOST;
    if (effect<=0.14) then --STR
        effectid = EFFECT.STR_BOOST;
    elseif (effect<=0.28) then --DEX
        effectid = EFFECT.DEX_BOOST;
    elseif (effect<=0.42) then --VIT
        effectid = EFFECT.VIT_BOOST;
    elseif (effect<=0.56) then --AGI
        effectid = EFFECT.AGI_BOOST;
    elseif (effect<=0.7) then --INT
        effectid = EFFECT.INT_BOOST;
    elseif (effect<=0.84) then --MND
        effectid = EFFECT.MND_BOOST;
    else --CHR
        effectid = EFFECT.CHR_BOOST;
    end

    target:addStatusEffect(effectid,math.random(12,14),0,90);
    skill:setMsg(msgBasic.SKILL_GAIN_EFFECT);
    return effectid;
end
