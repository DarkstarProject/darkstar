-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Ko'Dho Cannonball
-- Boss Trigger for Gu'Dha Effigy
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1455)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)

    local bossTrigger = GetServerVariable("[DynaBastok]Boss_Trigger")

    if bossTrigger == 0 or bossTrigger == 1 or bossTrigger == 4 or bossTrigger == 5 then
        SetServerVariable("[DynaBastok]Boss_Trigger", bossTrigger + 2)
    end

    -- If 3 boss trigger is killer -> pop the boss
    if GetServerVariable("[DynaBastok]Boss_Trigger") == 7 then
        SpawnMob(17539073)
        SetServerVariable("[DynaBastok]Boss_Trigger",0)
    end

end