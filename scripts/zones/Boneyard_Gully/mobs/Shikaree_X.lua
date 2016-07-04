-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree X
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)

    local MobID = mob:getID();

    if (MobID == 16809987) then
        SpawnMob(MobID+2);
    elseif (MobID == 16809992) then
        SpawnMob(MobID+2);
    elseif (MobID == 16809997) then
        SpawnMob(MobID+2);
    end
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;