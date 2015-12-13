-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Steelshell
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,723,2);
end;