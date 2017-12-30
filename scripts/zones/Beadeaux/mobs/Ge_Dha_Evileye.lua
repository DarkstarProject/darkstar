-----------------------------------
-- Area: Beadeaux (254)
--  NM: Ge'Dha Evileye
-- !spawnmob 17379450
-- !pos -238 1 -202 254
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("benedictionTrigger", math.random(10,50));
end;

function onMobFight( mob, target )
    local hpTrigger = mob:getLocalVar("benedictionTrigger");
    if (mob:getHPP() <= hpTrigger and mob:getLocalVar("benediction") == 0) then
        mob:useMobAbility(689);
        mob:setLocalVar("benediction", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("benediction", 0);
end;

function onMobDespawn(mob)
end;
