-----------------------------------
-- Area: Sealions Den
--  MOB: Omega
-----------------------------------
require("scripts/zones/Sealions_Den/MobIDs");
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
        mob:getStatusEffect(dsp.effect.REGAIN):setFlag(32);
    end
end;

function onAdditionalEffect(mob, player)
    local chance = 20;
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.THUNDER,dsp.effect.STUN);
    if (math.random(0,99) >= chance or resist <= 0.5) then
        return 0,0,0;
    else
        local duration = 5;
        duration = duration * resist;
        if (not player:hasStatusEffect(dsp.effect.STUN)) then
            player:addStatusEffect(dsp.effect.STUN, 0, 0, duration);
        end
        return dsp.subEffect.STUN, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.STUN;
    end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OMEGA_OSTRACIZER);
    player:startEvent(11);
end;

function onEventFinish(player,csid,option)
    if (csid == 11) then
        local inst = player:getVar("bcnm_instanceid");
        if (inst >= 1 and inst <= 3) then
            -- players are healed in between fights, but their TP is set to 0
            player:setHP(player:getMaxHP());
            player:setMP(player:getMaxMP());
            player:setTP(0);

            -- spawn ultima for given instance
            local ultimaId = ONE_TO_BE_FEARED_OFFSET + (7 * (inst - 1)) + 6;
            if (ultimaId ~= nil and not GetMobByID(ultimaId):isSpawned()) then
                SpawnMob(ultimaId);
            end

            -- move player to instance
            if (inst == 1) then
                player:setPos(-779, -103, -80);
            elseif (inst == 2) then
                player:setPos(-140, -23, -440);
            elseif (inst == 3) then
                player:setPos(499, 56, -802);
            end
        end
    end
end;
