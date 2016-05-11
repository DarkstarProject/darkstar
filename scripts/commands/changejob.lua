---------------------------------------------------------------------------------------------------
-- func: changejob
-- desc: Changes the players current job.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, jobId, level)
    jobId = tonumber(jobId) or JOBS[string.upper(jobId)];

    if (jobId == nil) then
        player:PrintToPlayer("You must enter a job ID or short-name.");
        return;
    end

   if (jobId <= 0 or jobId >= MAX_JOB_TYPE) then
       player:PrintToPlayer(string.format("Invalid job '%s' given. Use short-name or id. e.g. WAR", jobId));
       return;
   end

    -- Change the players job..
    player:changeJob(jobId);

    -- Attempt to set the players level..
    if (level ~= nil and level > 0 and level <= 99) then
        player:setLevel(level);
    else
        player:PrintToPlayer("Invalid level given. Level must be between 1 and 99!");
    end
end
