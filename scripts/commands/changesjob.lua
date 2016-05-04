---------------------------------------------------------------------------------------------------
-- func: changesjob
-- desc: Changes the players current subjob.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, job, level)
    
    job = tonumber(job) or _G[job];
    level = tonumber(level) or level;

    if (job == nil) then
        player:PrintToPlayer("You must enter a job id or short-name.");
        return;
    end

   if  job <= 0 or job > 22 then
       player:PrintToPlayer( string.format( "Invalid job '%s' given. Use enum or id. e.g. JOB_WAR", job ) );
       return;
   end

    -- Change the players subjob..
    player:changesJob(job);

    -- Attempt to set the players subjob level..
    if (level ~= nil and level > 0 and level <= 99) then
        player:setsLevel(level ;
    else
        player:PrintToPlayer( "Invalid level given. Level must be between 1 and 99!" );
    end
end