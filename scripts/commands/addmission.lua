---------------------------------------------------------------------------------------------------
-- func: addmission <logID> <missionID> <player>
-- desc: Adds a mission to the GM or target players log.
---------------------------------------------------------------------------------------------------

require("scripts/globals/missions");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function onTrigger(player, logId, missionId, target)
    
    local logName;
    logId = tonumber(logId) or _G[logId];
    if ((type(logId) == "table")) then
        logName = logId.full_name;
        logId = logId.mission_log;
    end

    missionId = tonumber(missionId) or _G[missionId];
    
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
        if (logName) then
            player:PrintToPlayer( string.format( "Added %s Mission with ID %u for %s", logName, missionId, target ) );
        else
            player:PrintToPlayer( string.format( "Added Mission for log %u with ID %u to %s", logId, missionId, target ) );
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@addmission <logID> <missionID> <player>" );
    end
end;