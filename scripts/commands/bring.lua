---------------------------------------------------------------------------------------------------
-- func: bring <player>
-- desc: Brings the target to the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("@bring <player>");
end;

function onTrigger(player, target)
    -- validate target
    if (target == nil) then
        error(player, "You must enter a target player name.");
        return;
    end
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        error(player, string.format( "Player named '%s' not found!", target ) );
    end
    
    -- bring target
    if (targ:getZoneID() == player:getZoneID()) then
        targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos() );
    else
        targ:setPos( player:getXPos(), player:getYPos(), player:getZPos(), player:getRotPos(), player:getZoneID() );
    end
end