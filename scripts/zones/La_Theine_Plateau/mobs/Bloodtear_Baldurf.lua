-----------------------------------
-- Area: La Theine Plateau
--  MOB: Bloodtear_Baldurf
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(THE_HORNSPLITTER);
end;