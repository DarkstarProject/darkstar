-----------------------------------
-- Area: Dynamis San d'Oria
--  NPC: Vanguard Dollmaster - smn
-----------------------------------

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
end;

function onMobDeath(mob, player, isKiller)
end;