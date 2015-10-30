-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Jailor of Love Pet version
-----------------------------------


-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    local JoL = GetMobByID(16912848);
    local XZOMITS = JoL:getLocalVar("JoL_Qn_xzomit_Killed");
    JoL:setLocalVar("JoL_Qn_xzomit_Killed", XZOMITS+1);
end;