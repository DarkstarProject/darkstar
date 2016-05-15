-----------------------------------
-- Area: Boneyard_Gully
-- Name: Shikaree Z
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

    if (MobID == 16809985) then
        SpawnMob(MobID+3);
    elseif (MobID == 16809990) then
        SpawnMob(MobID+3);
    elseif (MobID == 16809995) then
        SpawnMob(MobID+3);
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