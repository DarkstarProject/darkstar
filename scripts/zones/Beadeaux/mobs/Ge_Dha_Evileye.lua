-----------------------------------
-- Area: Beadeaux (254)
--  NM: Ge'Dha Evileye
-- @spawnmob 17379450
-- @pos -238 1 -202 (254)
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight( mob, target )
    if (mob:getHPP() < 30 and mob:getLocalVar("benediction") == 0) then
        mob:useMobAbility(689);
        mob:setLocalVar("benediction", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    mob:setLocalVar("benediction", 0);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set Ge_Dha_Evileye ToD
    local wait = math.random(3600,7200);
    SetServerVariable("[POP]Ge_Dha_Evileye",os.time()); -- 1-2 hours
    DeterMob(mob:getID(), true);


    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Ge_Dha_Evileye");
    SetServerVariable("[PH]Ge_Dha_Evileye", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));

end;