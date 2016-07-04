-----------------------------------
-- Area: Den of Rancor
--  MOB: Tonberry Imprecator
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

    checkGoVregime(player,mob,798,1);
    checkGoVregime(player,mob,799,2);
    checkGoVregime(player,mob,800,2);

    local kills = player:getVar("EVERYONES_GRUDGE_KILLS");
    if (kills < 480) then
        player:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
    end
end;