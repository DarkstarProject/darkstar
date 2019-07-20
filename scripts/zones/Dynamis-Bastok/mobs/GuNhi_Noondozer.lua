-----------------------------------
-- Area: Dynamis - Bastok
--  Mob: Gu'Nhi Noondozer
-- Time Extender: 30min
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

    if not alreadyReceived(player,4) then
        player:addTimeToDynamis(30)
        addDynamisList(player,8)
    end

end