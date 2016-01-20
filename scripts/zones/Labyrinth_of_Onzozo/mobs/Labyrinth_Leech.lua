-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Labyrinth Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,771,1);
end;