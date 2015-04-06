---------------------------------------------------------------------------------------------------
-- func: gotonpc
-- auth: Chronos77
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
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
        player:PrintToPlayer( string.format( "NPC named '%s' not found!", target ) );
    end
end