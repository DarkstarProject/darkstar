-----------------------------------
-- Area: Al'Taieu
-- NPC:  Absolute Virtue
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

function onMobDeath(mob, killer)
    killer:addTitle(VIRTUOUS_SAINT);
end;