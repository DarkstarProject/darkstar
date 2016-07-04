-----------------------------------
-- Area: RoMaeve
--  MOB: Apocalyptic Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,122,1);
end;
