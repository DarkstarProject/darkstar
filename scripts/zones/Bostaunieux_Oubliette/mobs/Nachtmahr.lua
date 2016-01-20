-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Nachtmahr
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,616,1);
end;
