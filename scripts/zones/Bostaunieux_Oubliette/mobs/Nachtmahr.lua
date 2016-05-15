-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Nachtmahr
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,616,1);
end;
