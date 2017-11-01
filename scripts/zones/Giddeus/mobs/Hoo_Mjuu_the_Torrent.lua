-----------------------------------
-- Area: Giddeus (145)
--  NM:  Hoo_Mjuu_the_Torrent
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- ffxiclopedia says "Can use this at 50% HP "
    mob:setLocalVar("benedictionTrigger", math.random(10,50));
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight( mob, target)
    local hpTrigger = mob:getLocalVar("benedictionTrigger");
    if (mob:getHPP() <= hpTrigger and mob:getLocalVar("benediction") == 0) then
        mob:useMobAbility(689);
        mob:setLocalVar("benediction", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    -- Set Hoo_Mjuu_the_Torrent's Window Open Time
    SetServerVariable("[POP]Hoo_Mjuu_the_Torrent", os.time() + 3600); -- 1 hour
    DisallowRespawn(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Hoo_Mjuu_the_Torrent");
    SetServerVariable("[PH]Hoo_Mjuu_the_Torrent", 0);
    DisallowRespawn(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;
