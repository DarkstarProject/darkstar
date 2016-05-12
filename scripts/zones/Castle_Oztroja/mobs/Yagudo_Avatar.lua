-----------------------------------
-- Area: Castle Oztroja (151)
--  NM:  Yagudo_Avatar
-- Notes: PH for Tzee Xicu the Manifest
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
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
    -- Needs to be zone wide message
    -- mob:messagePublic(mob, YAGUDO_AVATAR_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- Needs to be zone wide message
    -- mob:messagePublic(mob, YAGUDO_AVATAR_DEATH);

    local Yagudo_Avatar = mob:getID();
    local Tzee_Xicu_the_Manifest = 17396137;
    local ToD     = GetServerVariable("[POP]Tzee_Xicu_the_Manifest");
    local kills   = GetServerVariable("[PH]Tzee_Xicu_the_Manifest");
    if (ToD <= os.time(t) and GetMobAction(Tzee_Xicu_the_Manifest) == 0) then
        if (math.random(1,5) == 3 or kills > 6) then
            UpdateNMSpawnPoint(Tzee_Xicu_the_Manifest);
            GetMobByID(Tzee_Xicu_the_Manifest):setRespawnTime(math.random((75600),(86400)));
            DeterMob(Yagudo_Avatar, true);
        end
    else
        UpdateNMSpawnPoint(Yagudo_Avatar);
        mob:setRespawnTime(math.random(75600,86400));
        SetServerVariable("[PH]Tzee_Xicu_the_Manifest", kills + 1);
    end
end;