-----------------------------------
-- Area: Crawler's Nest
-- NPC:  Awd Goggie
-- @pos -253.026 -1.867 253.055 197
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
     GetNPCByID(17584461):setStatus(STATUS_NORMAL); -- qm7
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    killer:addTitle(BOGEYDOWNER);
end;