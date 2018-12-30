-----------------------------------
-- Area: Attohwa Chasm
--  NPC: Alastor Antlion
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush_noaggro")}
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
    mob:setMobMod(dsp.mobMod.GA_CHANCE,50);
    mob:setMobMod(dsp.mobMod.MUG_GIL,10000);
    mob:addMod(dsp.mod.FASTCAST,10);
    mob:addMod(dsp.mod.BINDRES,40);
    mob:addMod(dsp.mod.SILENCERES,40);
end;

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.EARTH,dsp.effect.PETRIFICATION);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(dsp.effect.PETRIFICATION)) then
            player:addStatusEffect(dsp.effect.PETRIFICATION, 1, 0, duration);
        end
        return dsp.subEffect.PETRIFY, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PETRIFICATION;
    end
end;

function onMobDeath(mob, player, isKiller)
end;
