-----------------------------------
-- Area: Dynamis Bastok
--  NPC: Vanguard Beasttender + Vanguard's Scorpion
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DespawnMob(mob:getID() + 1);
end;