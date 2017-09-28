-----------------------------------
-- Area: Beadeaux (254)
--  NM: Ge'Dha Evileye
-- @spawnmob 17379450
-- @pos -238 1 -202 254
-----------------------------------
require("scripts/zones/Beadeaux/MobIDs");

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
    -- Set ToD, DisallowRespawn NM, set placeholder respawn time, set Placeholder back to normal
    local wait = math.random(3600,7200); -- 1-2 hours
    SetServerVariable("[POP]Ge_Dha_Evileye", os.time() + wait);
    DisallowRespawn(mob:getID(), true);
    GetMobByID(Ge_Dha_Evileye_PH):setRespawnTime(GetMobRespawnTime(Ge_Dha_Evileye_PH));
    DisallowRespawn(Ge_Dha_Evileye_PH, false);
end;
