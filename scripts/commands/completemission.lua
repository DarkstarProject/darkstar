---------------------------------------------------------------------------------------------------
-- func: @completemission <logID> <missionID> <player>
-- auth: <Unknown>, modified by TeoTwawki
-- desc: Completes the given mission for the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, missionId, target)
    if (missionId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and mission id!" );
        player:PrintToPlayer( "@completemission <logID> <missionID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:completeMission( logId, missionId );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@completemission <logID> <missionID> <player>" );
    end
end;