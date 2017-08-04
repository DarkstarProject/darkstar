---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("@goto <player>");
end;

function onTrigger(player, target)

    -- validate target
    if (target == nil) then
        error(player, "You must enter a player name.");
        return;
    end
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        error(player, string.format( "Player named '%s' not found!", target ) );
        return;
    elseif (targ:getID() == player:getID()) then
        error(player, "You can't goto yourself.");
        return;
    end

    -- goto target
    if (targ:getZoneID() == player:getZoneID()) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos() );
    else
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID() );
    end
end