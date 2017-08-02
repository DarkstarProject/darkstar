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

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("@addmission <logID> <missionID> {player}");
end;

function onTrigger(player, logId, missionId, target)
    local logName;

    -- validate logId
    if (logId ~= nil) then
        logId = tonumber(logId) or _G[string.upper(logId)];
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
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- validate missionId
    if (missionId == nil) then
        error(player, "Invalid missionID.");
        return;
    else
        missionId = tonumber(missionId) or _G[string.upper(missionId)];
    end

    -- add mission
    targ:addMission(logId, missionId);
    player:PrintToPlayer(string.format("Added %s Mission with ID %u for %s", logName, missionId, targ:getName()));
end;
