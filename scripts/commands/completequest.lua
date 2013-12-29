---------------------------------------------------------------------------------------------------
-- func: completequest
-- auth: <Unknown>
-- desc: Completes the given quest for the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function onTrigger(player, logId, questId, target)
    if (questId == nil or logId == nil) then
        player:PrintToPlayer( "You must enter a valid log id and quest id!" );
        return;
    end
    
    if (target == nil) then
        target = player:getName();
    end
    
    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:completeQuest( logId, questId );
    end
end