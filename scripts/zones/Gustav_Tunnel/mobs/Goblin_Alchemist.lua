-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Alchemist
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,764,3);
    checkGoVregime(ally,mob,765,3);
end;