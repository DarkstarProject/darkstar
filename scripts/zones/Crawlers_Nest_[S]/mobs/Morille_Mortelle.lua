-----------------------------------
-- Area: Crawlers nest [S] (171)
--  NM:  Morille Mortelle
-- !pos 59.788 -0.939 22.316 171
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onMobSpawn(mob)
    mob:setMod(dsp.mod.DOUBLE_ATTACK, 20);
    mob:setMod(dsp.mod.STORETP, 10);
end;

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.WATER,dsp.effect.PLAGUE);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(dsp.effect.PLAGUE)) then
            player:addStatusEffect(dsp.effect.PLAGUE, 1, 0, duration);
        end
        return dsp.subEffect.PLAGUE, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PLAGUE;
    end
end;

function onMobDeath(mob, player, isKiller)
end;
