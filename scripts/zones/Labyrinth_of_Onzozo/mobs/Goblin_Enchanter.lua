-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Goblin Enchanter
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,771,2);
    checkGoVregime(ally,mob,772,2);
    checkGoVregime(ally,mob,774,2);
end;