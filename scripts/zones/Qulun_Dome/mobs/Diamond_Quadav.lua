-----------------------------------
-- Area: Qulun_Dome
--  NM:  Diamond_Quadav
-- Note: PH for Za Dha Adamantking PH
-----------------------------------

require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    mob:showText(mob,DIAMOND_QUADAV_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local Diamond_Quadav = mob:getID();
    local Za_Dha_Adamantking = 17383443;
    local ToD = GetServerVariable("[POP]Za_Dha_Adamantking");
    DeterMob(Diamond_Quadav, true);
    mob:showText(mob,DIAMOND_QUADAV_DEATH);
    if (ToD <= os.time(t) + 172800 and GetMobAction(Za_Dha_Adamantking) == 0) then -- -- From wikia:  A 3-5 day spawn; however it can spawn as early as 2 days from previous kill or as late as 10 days.
        if (math.random((1),(5)) == 3 or os.time(t) >= 777600) then
            UpdateNMSpawnPoint(Za_Dha_Adamantking);
            GetMobByID(Za_Dha_Adamantking):setRespawnTime(math.random((75600),(86400))); -- 21 to 24 hours
        end
    else
        UpdateNMSpawnPoint(Diamond_Quadav);
        mob:setRespawnTime(math.random((75600),(86400)));
    end
end;