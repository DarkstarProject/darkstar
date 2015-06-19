-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'hpemde
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
    local HPEMDES = JoL:getLocalVar("JoL_Qn_hpemde_Killed");
    JoL:setLocalVar("JoL_Qn_hpemde_Killed", HPEMDES+1);
end;