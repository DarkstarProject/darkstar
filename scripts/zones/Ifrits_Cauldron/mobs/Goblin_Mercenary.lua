-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Goblin Mercenary
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,757,1);
end;