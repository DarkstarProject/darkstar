-----------------------------------
-- Area: Behemoth's Dominion
-- HNM: Behemoth
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(BEHEMOTHS_BANE);

    Behemoth      = mob:getID();
    King_Behemoth = 17297441;
    ToD     = GetServerVariable("[POP]King_Behemoth");
    kills   = GetServerVariable("[PH]King_Behemoth");
    DeterMob(Behemoth, true);
    if (ToD <= os.time(t) and GetMobAction(King_Behemoth) == 0) then
        if (math.random((1),(5)) == 3 or kills > 6) then
            UpdateNMSpawnPoint(King_Behemoth);
            GetMobByID(King_Behemoth):setRespawnTime(math.random((75600),(86400)));
        end
    else
        UpdateNMSpawnPoint(Behemoth);
        mob:setRespawnTime(math.random((75600),(86400)));
        SetServerVariable("[PH]King_Behemoth", kills + 1);
    end

end;