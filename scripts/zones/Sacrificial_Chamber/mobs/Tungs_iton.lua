-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Tungs'Iton
-- Zilart Mission 4 BCNM Fight
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
mixins = {require("scripts/mixins/job_special")};

require("scripts/globals/status");

function onMobDeath(mob, player, isKiller)
    local elemental = mob:getID()+1;

    if (GetMobByID(elemental):isSpawned()) then
        DespawnMob(elemental);
    end
end;
