-----------------------------------
-- Area: Al'Taieu
--  MOB: Qn'xzomit
-- Note: Pet for JOL and JOJ
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
local ID = require("scripts/zones/AlTaieu/IDs")
-----------------------------------

function onMobFight(mob, target)
    if mob:getID() < ID.mob.JAILER_OF_LOVE and mob:getLocalVar("Mijin_Gakure") == 0 and mob:getBattleTime() > 10 then
	    mob:setLocalVar("Mijin_Gakure",1)
		mob:useMobAbility(731) -- Mijin_Gakure 
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    if mob:getID() > ID.mob.JAILER_OF_LOVE then
        local JoL = GetMobByID(ID.mob.JAILER_OF_LOVE)
        local xzomitsKilled = JoL:getLocalVar("JoL_Qn_xzomit_Killed")
        JoL:setLocalVar("JoL_Qn_xzomit_Killed", xzomitsKilled + 1)
    end
end