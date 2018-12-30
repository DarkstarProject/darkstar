-----------------------------------
-- Area: Inner Horutoto Ruins
--  NM: Nocuous Weapon
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob, player)
    local chance = 25;
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.WATER,dsp.effect.POISON);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 30;
        if (mob:getMainLvl() > player:getMainLvl()) then
            duration = duration + (mob:getMainLvl() - player:getMainLvl())
        end
        duration = utils.clamp(duration,1,45);
        duration = duration * resist;
        if (not player:hasStatusEffect(dsp.effect.POISON)) then
            player:addStatusEffect(dsp.effect.POISON, 1, 3, duration); -- Don't know potency on the poison.
        end
        return dsp.subEffect.POISON, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.POISON;
    end
end;

function onMobDeath(mob, player, isKiller)
end;
