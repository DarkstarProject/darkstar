-----------------------------------
-- Area: Dynamis Windurst
--  NPC: Loo Hepe the Eyepiercer
-- Boss Trigger for MEGA BOSS
-----------------------------------

mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    -- If last boss trigger is killed -> pop the boss
    if (GetServerVariable("[DynaWindurst]Boss_Trigger") == 8) then
        SpawnMob(17543169);
        SetServerVariable("[DynaWindurst]Boss_Trigger",16);
    end

end;