-----------------------------------
-- Area: Sealions Den
--  MOB: Ultima
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/titles");
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onMobFight(mob,target)
    -- Gains regain at under 25% HP
    if (mob:getHPP() < 25 and not mob:hasStatusEffect(dsp.effect.REGAIN)) then
        mob:addStatusEffect(dsp.effect.REGAIN,5,3,0);
        mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH);
    end
end;

function onAdditionalEffect(mob, player)
    local chance = 20;
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.ICE,dsp.effect.PARALYSIS);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 60;
        local power = 20;
        duration = duration * resist;
        if (player:hasStatusEffect(dsp.effect.PARALYSIS) == false) then
            player:addStatusEffect(dsp.effect.PARALYSIS, power, 0, duration);
        end
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS;
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.ULTIMA_UNDERTAKER);
end;
