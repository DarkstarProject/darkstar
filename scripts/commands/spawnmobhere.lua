---------------------------------------------------------------------------------------------------
-- func: @mobhere <mobId>
-- auth: Forgottenandlost
-- desc: Spawns a MOB and then moves it to the current position, if in same zone.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, mobId, depopOnFail)

    if (mobId == nil) then
        player:PrintToPlayer("You must enter a valid MobID.");
        return;
    end

    SpawnMob( mobId );

    local mob = GetMobByID(mobId);

    if (player:getZone() == mob:getZone()) then
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), 0, player:getZone() );
    else
        if (depopOnFail == nil or depopOnFail == 0) then
            DespawnMob( mobId );
            player:PrintToPlayer("Despawned the mob because of an error, see below.");
        end
        player:PrintToPlayer("Mob could not be moved to current pos - you are probably in the wrong zone.");
    end

end;