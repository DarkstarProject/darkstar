-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Bandit
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,740,2);
end;