-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Metal Shears
-----------------------------------
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 3 chance to poison on melee.
    if ((math.random(1,100) >= 33) or (target:hasStatusEffect(EFFECT_POISON) == true)) then
        return 0,0,0;
    else
        local duration = math.random(10,25);
        target:addStatusEffect(EFFECT_POISON,15,3,duration);
        return SUBEFFECT_POISON,msgBasic.ADD_EFFECT_STATUS,EFFECT_POISON;
    end
end;

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- 60-70min repop
end;
