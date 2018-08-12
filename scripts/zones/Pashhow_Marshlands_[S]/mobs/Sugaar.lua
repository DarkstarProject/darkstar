-----------------------------------
-- Area: Pashhow Marshlands [S] (90)
--  NM:  Sugaar
-- !pos -416.496,24.11,-441.589,132
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onAdditionalEffect(mob, player)
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.WIND,dsp.effect.SILENCE);
    if (resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(dsp.effect.SILENCE)) then
            player:addStatusEffect(dsp.effect.SILENCE, 1, 0, duration);
        end
        return dsp.subEffect.SILENCE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.SILENCE;
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;