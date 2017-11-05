-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Jailor of Love Pet version
-----------------------------------
require("scripts/zones/AlTaieu/MobIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local JoL = GetMobByID(JAILER_OF_LOVE);
    local XZOMITS = JoL:getLocalVar("JoL_Qn_xzomit_Killed");
    JoL:setLocalVar("JoL_Qn_xzomit_Killed", XZOMITS+1);
end;