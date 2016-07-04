-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Tonberry Harrier
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

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,790,1);
    checkGoVregime(player,mob,791,1);
    checkGoVregime(player,mob,792,1);
    checkGoVregime(player,mob,793,1);
    checkGoVregime(player,mob,794,1);
    checkGoVregime(player,mob,795,1);

    local kills = player:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        player:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;