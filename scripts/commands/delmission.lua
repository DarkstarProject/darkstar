---------------------------------------------------------------------------------------------------
-- func: delmission <logID> <missionID> <player>
-- desc: Deletes the given mission from the GM or target player.
---------------------------------------------------------------------------------------------------

require("scripts/globals/missions");

cmdprops =
{
    permission = 1,
    parameters = "sss"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!delmission <logID> <missionID> {player}");
end;

function onTrigger(player, logId, missionId, target)
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
    
    -- validate missionId
    if (missionId ~= nil) then
        missionId = tonumber(missionId) or _G[string.upper(missionId)];
    end
    if (missionId == nil or missionId < 0) then
        error(player, "Invalid missionID.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- delete mission
    targ:delMission(logId, missionId);
    player:PrintToPlayer(string.format("Deleted %s mission %i from %s.", logName, missionId, targ:getName()));
end;
