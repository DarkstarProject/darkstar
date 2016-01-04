-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,765,2);
end;