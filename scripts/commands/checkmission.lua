---------------------------------------------------------------------------------------------------
-- func: checkmission <Log ID> <Player>
-- desc: Prints current MissionID for the given LogID and target Player to the in game chatlog
---------------------------------------------------------------------------------------------------

require("scripts/globals/missions");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player,logId,target)
    
    local logName;
    logId = tonumber(logId) or _G[logId];
    if ((type(logId) == "table")) then
        logName = logId["full_name"];
        logId = logId["mission_log"];
    else
        local missionAreas = {SANDORIA, BASTOK, WINDURST, ZILART, TOAU, WOTG, COP, ASSAULT, CAMPAIGN, ACP, AMK, ASA, SOA, ROV};
        logName = missionAreas[logId + 1]["full_name"];
    end
    
    if (logId == nil) then
        player:PrintToPlayer( "You must enter a valid LogID!" );
        player:PrintToPlayer( "@checkmission <Log ID> <Player>" );
        return;
    end

    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName(target);
    local Log = targ:getCurrentMission(logId)
    -- Todo: loop through missionIDs and output mission name, not just a number.
    if (targ ~= nil) then
        if (logId <= 13) then
            if ((logId <= 3) and (Log == 255)) then
                player:PrintToPlayer( string.format( "No current %s mission.", logName ) );
            else
                player:PrintToPlayer( string.format( "Current %s Mission ID is: '%s' !", logName, Log ) );
            end
        else     -- Everything not valid or not currently handled
            player:PrintToPlayer("Invalid or unsupported LogID. The LogID must be 0-13.");
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        player:PrintToPlayer( "@checkmission <logID> <player>" );
    end
end
