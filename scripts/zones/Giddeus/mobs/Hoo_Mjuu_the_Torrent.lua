-----------------------------------
-- Area: Giddeus (145)
--  NM:  Hoo_Mjuu_the_Torrent
-----------------------------------

function onMobSpawn(mob)
    -- ffxiclopedia says "Can use this at 50% HP "
    mob:setLocalVar("benedictionTrigger", math.random(10,50));
end;

function onMobFight( mob, target)
    local hpTrigger = mob:getLocalVar("benedictionTrigger");
    if (mob:getHPP() <= hpTrigger and mob:getLocalVar("benediction") == 0) then
        mob:useMobAbility(689);
        mob:setLocalVar("benediction", 1);
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
end;
