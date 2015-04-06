---------------------------------------------------------------------------------------------------
-- func: gotonpc
-- auth: Chronos77
-- desc: Goes to the npc with ID.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid npc id.");
        return;
    end

    local targ = GetNPCByID( target );
    if (targ ~= nil) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), 0, targ:getZoneID() );    
    else
        player:PrintToPlayer( string.format( "NPC id '%i' not found!", target ) );
    end
end