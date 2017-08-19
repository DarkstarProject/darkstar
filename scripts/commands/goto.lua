---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "si"
};

function onTrigger(player, target)
function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("@goto <player> {forceZone}");
end;

function onTrigger(player, target, forceZone)

    -- validate target
    if (targ:getVar("inJail") ~= 0) then
        player:PrintToPlayer( string.format( "You've been bad, (Probably). Please contact a GM in game or on Slack for help." ) );
    elseif (target == nil) then
        error(player, "You must enter a player name.");
        return;
    end
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        error(player, string.format( "Player named '%s' not found!", target ) );
        return;
    end

    -- validate forceZone
    if (forceZone ~= nil) then
        if (forceZone ~= 0 and forceZone ~= 1) then
            error(player, "If provided, forceZone must be 1 (true) or 0 (false).");
            return;
        end
    else
        forceZone = 1;
    end
    
    -- goto target
    if (targ:getZoneID() ~= player:getZoneID() or forceZone == 1) then
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos(), targ:getZoneID() );
    else
        player:setPos( targ:getXPos(), targ:getYPos(), targ:getZPos(), targ:getRotPos() );
    end
end