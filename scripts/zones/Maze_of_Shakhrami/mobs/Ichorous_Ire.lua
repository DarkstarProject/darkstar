-----------------------------------
-- Area: Maze of Shakhrami
--  MOB: Ichorous_Ire
-----------------------------------

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
    player:addTitle(JELLYBANE);
end;