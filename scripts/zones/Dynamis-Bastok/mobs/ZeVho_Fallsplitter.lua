-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Ze'Vho Fallsplitter
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
