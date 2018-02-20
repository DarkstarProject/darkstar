-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Tungs'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    local mobid = mob:getID();

    for i=mobid-1,mobid+2 do
        GetMobByID(i):updateEnmity(target);
    end
end;

function onMobDeath(mob, player, isKiller)
    local elemental = mob:getID()+1;
    if (GetMobByID(elemental):isSpawned()) then
        DespawnMob(elemental);
    end
end;