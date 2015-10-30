-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Tonberry Maledictor
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

    checkGoVregime(killer,mob,790,1);
    checkGoVregime(killer,mob,791,1);
    checkGoVregime(killer,mob,792,1);
    checkGoVregime(killer,mob,793,1);
    checkGoVregime(killer,mob,794,1);
    checkGoVregime(killer,mob,795,1);

    kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;