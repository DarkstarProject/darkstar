-----------------------------------
-- Area: RoMaeve
--  MOB: Ominous Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,119,2);
end;
