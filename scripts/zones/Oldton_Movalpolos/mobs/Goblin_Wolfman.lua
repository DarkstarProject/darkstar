-----------------------------------
-- Area: Oldton Movalpolos (11)
--  Mob: Goblin Wolfman
-----------------------------------
<<<<<<< HEAD
require("scripts/zones/Oldton_Movalpolos/MobIDs");
require("scripts/globals/settings");
require("scripts/mixins/job_special")
=======
>>>>>>> 225f7c5f1ee6a44797c8faf501af217dc417f0a0

function onMobDeath(mob, player, isKiller)
end;


function onMobSpawn(mob)
    local GoblinWolfmanID = mob:getID();
<<<<<<< HEAD
	
   -- Set the hp% to use blood weapon
    mob:setLocalVar("useSpecAtHpMin", 50);
    mob:setLocalVar("useSpecAtHpMax", 75);
=======

   -- Set the hp% to use blood weapon
    mob:setLocalVar("jobSpecTrigger", math.random(50, 75));
>>>>>>> 225f7c5f1ee6a44797c8faf501af217dc417f0a0

end;

function onMobFight(mob, target)
<<<<<<< HEAD
    
=======
    local trigger = mob:getLocalVar("jobSpecTrigger")
    if (mob:getHPP() <= trigger and mob:getLocalVar("BloodWeapon") == 0) then
        mob:useMobAbility(jobSpec.BLOOD_WEAPON);
        mob:setLocalVar("BloodWeapon", 1);
    end
>>>>>>> 225f7c5f1ee6a44797c8faf501af217dc417f0a0
end;

function onMobDespawn(mob)
    local npc = GetNPCByID(SCRAWLED_WRITING);

    npc:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);

    local randpos = math.random(1,3);

    switch (randpos): caseof
    {
        [1] = function (x) npc:setPos(-16.806,7.718,14.155); end,
        [2] = function (x) npc:setPos(-150.020,8.000,-251.543); end,
        [3] = function (x) npc:setPos(-19.355,12.053,-107.989); end,       
    }
end;