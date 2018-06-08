-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Note: Pet for JOL and JOJ
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/zones/AlTaieu/MobIDs");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    if (mob:getID() > JAILER_OF_LOVE) then
        local JoL = GetMobByID(JAILER_OF_LOVE);
        local xzomitsKilled = JoL:getLocalVar("JoL_Qn_xzomit_Killed");
        JoL:setLocalVar("JoL_Qn_xzomit_Killed", xzomitsKilled + 1);
    end
end;
