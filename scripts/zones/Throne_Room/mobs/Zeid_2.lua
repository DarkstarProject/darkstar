-----------------------------------
-- Area: Throne Room
--  MOB: Zeidpart2
-- Mission 9-2 BASTOK BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("useMainSpecAtHPP", math.random(20,50));
end;

function onMobFight(mob, target)
    local zeid = mob:getID();
    local shadow1 = GetMobByID(zeid + 1);
    local shadow2 = GetMobByID(zeid + 2);

    if (mob:getHPP() <= 77 and mob:getTP() >= 1000 and shadow1:isDead() and shadow2:isDead()) then
        mob:useMobAbility(984);
    end
end;

function onMobDeath(mob, player, isKiller)
    DespawnMob(mob:getID()+1);
    DespawnMob(mob:getID()+2);
end;
