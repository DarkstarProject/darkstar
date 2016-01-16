---------------------------------------------------------------------------------------------------
-- func: @bring <player>
-- desc: Brings the target to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a target player name.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), 0, player:getZoneID() );
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end