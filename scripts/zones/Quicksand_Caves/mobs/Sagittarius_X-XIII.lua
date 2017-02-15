----------------------------------
-- Area: Quicksand Caves
--  NM:  Sagittarius X-XIII
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    -- GoV regimes requiring Antica
    checkGoVregime(player,mob,812,2);
    checkGoVregime(player,mob,813,2);
    checkGoVregime(player,mob,814,2);
    checkGoVregime(player,mob,815,1);
    checkGoVregime(player,mob,816,2);
    checkGoVregime(player,mob,817,2);
    checkGoVregime(player,mob,818,2);
    checkGoVregime(player,mob,819,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    -- set cooldown
    SetServerVariable("[POP]Sagittarius_X_XIII", os.time(t) + 14400); -- 4 hours
    DeterMob(mob:getID(), true);

    -- make PH spawn in place of NM
    local PH = GetServerVariable("[PH]Sagittarius_X_XIII");
    SetServerVariable("[PH]Sagittarius_X_XIII", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;