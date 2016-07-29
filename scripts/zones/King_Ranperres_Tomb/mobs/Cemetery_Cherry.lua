-----------------------------------
-- Area: King Ranperres Tomb
--  NM:  Cemetery Cherry
-- @pos 33.000 0.500 -287.000 190
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(MON_CHERRY);
end;