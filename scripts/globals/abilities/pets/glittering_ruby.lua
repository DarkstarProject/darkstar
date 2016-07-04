---------------------------------------------------
-- Glittering Ruby
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    --randomly give str/dex/vit/agi/int/mnd/chr (+12)
    local effect = math.random();
    local effectid = EFFECT_STR_BOOST;
    if (effect<=0.14) then --STR
        effectid = EFFECT_STR_BOOST;
    elseif (effect<=0.28) then --DEX
        effectid = EFFECT_DEX_BOOST;
    elseif (effect<=0.42) then --VIT
        effectid = EFFECT_VIT_BOOST;
    elseif (effect<=0.56) then --AGI
        effectid = EFFECT_AGI_BOOST;
    elseif (effect<=0.7) then --INT
        effectid = EFFECT_INT_BOOST;
    elseif (effect<=0.84) then --MND
        effectid = EFFECT_MND_BOOST;
    else --CHR
        effectid = EFFECT_CHR_BOOST;
    end

    target:addStatusEffect(effectid,math.random(12,14),0,90);
    skill:setMsg(MSG_BUFF);
    return effectid;
end
