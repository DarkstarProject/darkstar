-----------------------------------
-- Area: Xarcabard
--  MOB: Cursed Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,52,2);
    checkRegime(player,mob,53,3);
end;
