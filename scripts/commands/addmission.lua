---------------------------------------------------------------------------------------------------
-- func: @addmission <logID> <missionID> <player>
-- desc: Adds a mission to the GM or target players log.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, missionId, target)
    if (missionId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and mission id!" );
        player:PrintToPlayer( "@addmission <logID> <missionID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:addMission( logId, missionId );
        player:PrintToPlayer( string.format( "Added Mission for log %u with ID %u to %s", logId, missionId, target ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@addmission <logID> <missionID> <player>" );
    end
end;