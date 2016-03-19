-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Tonberry Pursuer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)

    checkGoVregime(ally,mob,790,1);
    checkGoVregime(ally,mob,791,1);
    checkGoVregime(ally,mob,792,1);
    checkGoVregime(ally,mob,793,1);
    checkGoVregime(ally,mob,794,1);
    checkGoVregime(ally,mob,795,1);

    local kills = ally:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        ally:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;