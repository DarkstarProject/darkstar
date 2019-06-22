-----------------------------------
-- Area: Dynamis San d'Oria
--  MOB: Voidstreaker Butchnotch
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("dynamis_currency", 1452)
end

function onMobEngaged(mob,target)
end

function onMobDeath(mob, player, isKiller)
    if not alreadyReceived(player, 7) then
        player:addTimeToDynamis(30)
        addDynamisList(player,64)
        SpawnMob(17535385) -- 145
        SpawnMob(17535386) -- 146
        SpawnMob(17535387) -- 147
        SpawnMob(17535389) -- 149
    end
end
