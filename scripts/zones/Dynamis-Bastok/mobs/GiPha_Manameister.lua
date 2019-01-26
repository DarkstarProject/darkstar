-----------------------------------
-- Area: Dynamis Bastok
--  NPC: Gi'Pha Manameister
-- Boss Trigger for Gu'Dha Effigy
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/status");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)

    local bossTrigger = GetServerVariable("[DynaBastok]Boss_Trigger");

    if (bossTrigger == 0 or bossTrigger == 2 or bossTrigger == 4 or bossTrigger == 6) then
        SetServerVariable("[DynaBastok]Boss_Trigger",bossTrigger + 1);
    end

    -- If 3 boss trigger is killer -> pop the boss
    if (GetServerVariable("[DynaBastok]Boss_Trigger") == 7) then
        SpawnMob(17539073);
        SetServerVariable("[DynaBastok]Boss_Trigger",0);
    end

end;