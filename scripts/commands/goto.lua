---------------------------------------------------------------------------------------------------
-- func: goto
-- desc: Goes to the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!goto <player> {forceZone}");
end;

function onTrigger(player, target, forceZone)

    -- validate target
    if (target == nil) then
        error(player, "You must enter a player name.");
        return;
    end
    local targ = GetPlayerByName( target );
    if (targ == nil) then
        if not player:gotoPlayer( target ) then
            error(player, string.format( "Player named '%s' not found!", target ) );
        end
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