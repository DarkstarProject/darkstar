---------------------------------------------------------------------------------------------------
-- func: changejob
-- desc: Changes the players current job.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, job, level)
    local jobList =
    {
        ["war"] =  1,
        ["mnk"] =  2,
        ["whm"] =  3,
        ["blm"] =  4,
        ["rdm"] =  5,
        ["thf"] =  6,
        ["pld"] =  7,
        ["drk"] =  8,
        ["bst"] =  9,
        ["brd"] = 10,
        ["rng"] = 11,
        ["sam"] = 12,
        ["nin"] = 13,
        ["drg"] = 14,
        ["smn"] = 15,
        ["blu"] = 16,
        ["cor"] = 17,
        ["pup"] = 18,
        ["dnc"] = 19,
        ["sch"] = 20,
        ["geo"] = 21,
        ["run"] = 22
    };

    if (job == nil) then
        player:PrintToPlayer("You must enter a job id or short-name.");
        return;
    end

    local jobId = 0;
    if (tonumber(job) ~= nil and tonumber(job) ~= 0) then
        jobId = job;
    else
        jobId = jobList[ string.lower( job ) ];
        if (jobId == nil) then
            player:PrintToPlayer( string.format( "Invalid job '%s' given. Use short name or id. e.g. WAR", job ) );
            return;
        end
    end

    -- Ensure player entered a valid id..
    if (jobId <= 0 or jobId > 22) then
        player:PrintToPlayer( "Invalid job id given; must be between 1 and 22. Or use a short name e.g. WAR" );
        return;
    end

    -- Change the players job..
    player:changeJob( jobId );

    -- Attempt to set the players level..
    if (level ~= nil and level > 0 and level <= 99) then
        player:setLevel( level );
    else
        player:PrintToPlayer( "Invalid level given. Level must be between 1 and 99!" );
    end
end