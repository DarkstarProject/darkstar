---------------------------------------------------------------------------------------------------
-- func: @mobhere <mobId>
-- desc: Spawns a MOB and then moves it to the current position, if in same zone.
--       Errors will despawn the mobID unless "noDepop" was specified (any value works).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, mobId, noDepop)
    if (mobId == nil) then
        player:PrintToPlayer("You must enter a valid MobID.");
        return;
    end

    local mob = GetMobByID(mobId);
    if (mob == nil) then
        player:PrintToPlayer( string.format( "Mob with ID '%i' not found!", mobId ) );
        return;
    end

    SpawnMob( mobId );
    if (player:getZoneID() == mob:getZoneID()) then
        mob:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
    else
        if (noDepop == nil or noDepop == 0) then
            DespawnMob( mobId );
            player:PrintToPlayer("Despawned the mob because of an error.");
        end
        player:PrintToPlayer("Mob could not be moved to current pos - you are probably in the wrong zone.");
    end
end;