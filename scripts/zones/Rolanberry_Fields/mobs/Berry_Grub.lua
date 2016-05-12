-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Berry Grub
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,25,2);
    checkRegime(player,mob,86,1);
    checkRegime(player,mob,87,1);
end;
