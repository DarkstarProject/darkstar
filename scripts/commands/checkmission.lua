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

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!checkmission <logID> {player}");
end;

function onTrigger(player,logId,target)

    -- validate logId
    local logName;
    if (logId == nil) then
        error(player, "You must provide a logID.");
        return;
    elseif (tonumber(logId) ~= nil) then
        logId = tonumber(logId);
        logId = MISSION_LOGS[logId];
    end
    if (logId ~= nil) then
        logId = _G[string.upper(logId)];
    end
    if ((type(logId) == "table") and logId.mission_log ~= nil) then
        logName = logId.full_name;
        logId = logId.mission_log;
    else
        error(player, "Invalid logID.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player:getCursorTarget();
        if (targ == nil or not targ:isPC()) then
            targ = player;
        end
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- report mission
    local currentMission = targ:getCurrentMission(logId);

    if ((logId <= 3) and (currentMission == 255)) then
        player:PrintToPlayer( string.format( "No current %s mission for %s.", logName, targ:getName() ) );
    else
        player:PrintToPlayer( string.format( "Current %s Mission ID is %s for %s.", logName, currentMission, targ:getName() ) );
    end
end
