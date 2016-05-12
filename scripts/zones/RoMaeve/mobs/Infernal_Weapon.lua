-----------------------------------
-- Area: RoMaeve
--  MOB: Infernal Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,123,1);
end;
