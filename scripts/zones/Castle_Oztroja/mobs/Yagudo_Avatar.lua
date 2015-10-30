-----------------------------------
--  Area: Castle Oztroja (151)
--   Mob: Yagudo_Avatar (Tzee Xicu the Manifest PH)
-----------------------------------

require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
-- target:showText(mob,YAGUDO_AVATAR_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

-- killer:showText(mob,YAGUDO_AVATAR_DEATH);

    Yagudo_Avatar = mob:getID();
    Tzee_Xicu_the_Manifest = 17396137;
    ToD     = GetServerVariable("[POP]Tzee_Xicu_the_Manifest");
    kills   = GetServerVariable("[PH]Tzee_Xicu_the_Manifest");
    DeterMob(Yagudo_Avatar, true);
    if (ToD <= os.time(t) and GetMobAction(Tzee_Xicu_the_Manifest) == 0) then
        if (math.random((1),(5)) == 3 or kills > 6) then
            UpdateNMSpawnPoint(Tzee_Xicu_the_Manifest);
            GetMobByID(Tzee_Xicu_the_Manifest):setRespawnTime(math.random((75600),(86400)));
        end
    else
        UpdateNMSpawnPoint(Yagudo_Avatar);
        mob:setRespawnTime(math.random((75600),(86400)));
        SetServerVariable("[PH]Tzee_Xicu_the_Manifest", kills + 1);
    end
end;
