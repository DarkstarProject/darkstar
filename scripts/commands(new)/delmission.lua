---------------------------------------------------------------------------------------------------
-- func: @delmission <logID> <missionID> <player>
-- desc: Deletes the given mission from the GM or target player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/missions");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function onTrigger(player, logId, missionId, target)
    
    logId = tonumber(logId) or _G[logId];
    missionId = tonumber(missionId) or _G[missionId];
    
    if (missionId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and mission id!" );
        player:PrintToPlayer( "@delmission <logID> <missionID> <player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    if (targ ~= nil) then
        targ:delMission( logId, missionId );
        player:PrintToPlayer( string.format( "Deleted Mission for log %u with ID %u from %s", logId, missionId, target ) );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@delmission <logID> <missionID> <player>" );
    end
end;