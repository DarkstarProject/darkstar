---------------------------------------------------------------------------------------------------
-- func: addmission
-- auth: <Unknown>
-- desc: Adds a mission to the given targets log.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, missionId, target)
    if (missionId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and mission id!" );
        return;
    end
    
    if (target == nil) then
        target = player:getName();
    end
    
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:addMission( logId, missionId );
    end
end