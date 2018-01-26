----------------------------------
-- Area: Jugner_Forest
--  NM:  Sappy Sycamore
-----------------------------------
require("scripts/globals/msg");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, 1);
    mob:addMod(MOD_SLEEPRES,20);
    mob:addMod(MOD_BINDRES,20);
end;

function onMobSpawn(mob)
end;

function onAdditionalEffect(mob,target,damage)
    -- Guesstimating 1 in 4 chance to slow on melee.
    if ((math.random(1,100) >= 25) or (target:hasStatusEffect(EFFECT_SLOW) == true)) then
        return 0,0,0;
    else
        local duration = math.random(15,25);
        target:addStatusEffect(EFFECT_SLOW,15,0,duration); -- sproud smack like
        return SUBEFFECT_SLOW,msgBasic.ADD_EFFECT_STATUS,EFFECT_SLOW;
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random(3600,4200)); -- repop 60-70min
end;
