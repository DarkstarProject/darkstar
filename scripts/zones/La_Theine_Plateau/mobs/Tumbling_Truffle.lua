-----------------------------------
-- Area: La Theine Plateau
--  MOB: Tumbling Truffle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,2);
end;
