-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Rime Gigas
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,50,1);
end;
