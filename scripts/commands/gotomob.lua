---------------------------------------------------------------------------------------------------
-- func: gotomob
-- desc: Goes to the target mob.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
if (target == nil) then
	player:PrintToPlayer("You must enter a valid mobID.");
	return;
end

local targ = GetMobByID( target );
    if (targ ~= nil) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), 0, targ:getZoneID() );    
    else
        player:PrintToPlayer( string.format( "Mob with ID '%s' not found!", target ) );
    end
end