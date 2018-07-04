-----------------------------------
-- Area: Dynamis Bastok
--  NPC: SMN Vanguard Undertaker + Vanguard's Avatar
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DespawnMob(mob:getID() + 1);
end;