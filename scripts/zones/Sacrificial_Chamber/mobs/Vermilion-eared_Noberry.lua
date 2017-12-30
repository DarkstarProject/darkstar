-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Vermilion-eared_Noberry
-- BCNM: Jungle Boogymen
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local elemental = mob:getID()+2;
    if (GetMobByID(elemental):isSpawned()) then
        DespawnMob(elemental);
    end
end;