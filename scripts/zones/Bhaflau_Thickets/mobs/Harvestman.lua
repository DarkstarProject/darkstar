-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Harvestman
-- !pos 398.130 -10.675 179.169 52
-----------------------------------
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 4 chance to poison on melee.
    if ((math.random(1,100) >= 25) or (target:hasStatusEffect(dsp.effects.POISON) == true)) then
        return 0,0,0;
    else
        local duration = math.random(6,9); -- 2-3 Tick's
        target:addStatusEffect(dsp.effects.POISON,100,3,duration);
        return SUBEFFECT_POISON,msgBasic.ADD_EFFECT_STATUS,EFFECT_POISON;
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    -- Set Harvesman's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(75600,86400));
end;
