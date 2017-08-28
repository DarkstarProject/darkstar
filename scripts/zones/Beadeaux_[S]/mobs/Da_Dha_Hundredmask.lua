-----------------------------------
-- Area: Beadeaux [S] (92)
--  NM:  Da'Dha Hundredmask
-- @spawnmob 17154195
-- !pos -89.901 .225 -159.694 92
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("HpTrigger", math.random(5,65));
    mob:setMod(MOD_TRIPLE_ATTACK, 25);
    mob:addMod(MOD_GRAVITYRES, 50);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight( mob, target )
    if (mob:getHPP() < mob:getLocalVar("HpTrigger") and mob:getLocalVar("perfect_dodge") == 0) then
        mob:useMobAbility(1013);
        mob:setLocalVar("perfect_dodge", 1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onAdditionalEffect
-----------------------------------

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- Set Window Open Time
    SetServerVariable("[POP]Da_Dha_Hundredmask", os.time() + 7200); -- 2 hours
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set to respawn spawn
    local PH = GetServerVariable("[PH]Da_Dha_Hundredmask");
    SetServerVariable("[PH]Da_Dha_Hundredmask", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;
