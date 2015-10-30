-----------------------------------
-- Area: Den of Rancor
-- NPC:  Tonberry Trailer
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    checkGoVregime(killer,mob,798,1);
    checkGoVregime(killer,mob,799,2);
    checkGoVregime(killer,mob,800,2);

    kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;