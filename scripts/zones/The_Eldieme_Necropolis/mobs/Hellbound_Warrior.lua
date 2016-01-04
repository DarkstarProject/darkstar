-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Hellbound Warrior
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,677,1);
end;