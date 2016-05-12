-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Carrion Crow
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,93,1);
end;
