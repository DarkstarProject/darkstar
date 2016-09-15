---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
if (player:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
else
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid player name.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad." ) );
    elseif (targ ~= nil) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), 0, targ:getZoneID() );    
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        end
    end
end