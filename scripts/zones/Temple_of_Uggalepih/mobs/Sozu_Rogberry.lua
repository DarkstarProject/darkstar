-----------------------------------
-- Area: Temple of Uggalepih
--  NM:  Sozu Rogberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/zones/Temple_of_Uggalepih/MobIDs");
require("scripts/globals/settings");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(SOZU_ROGBERRY_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;