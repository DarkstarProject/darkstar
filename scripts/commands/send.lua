---------------------------------------------------------------------------------------------------
-- func: @send <player to be sent> <player to arrive at>
-- auth: TeoTwawki (at Nasomi's request).
-- desc: Sends first player specified to a second player's position
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, p1, p2)
    if (p1 == nil or p2 == nil) then
        player:PrintToPlayer("Must specify 2 players: @send <player to be sent> <player to arrive at>");
        return;
    end

    local targ2 = GetPlayerByName(p2);

    if (p1 ~= nil and p2 ~= nil) then
        local targ1 = GetPlayerByName(p1);
        local targ2 = GetPlayerByName(p2);
        if (targ1 == nil) then
            player:PrintToPlayer( string.format( "Player named '%s' not found!", p1 ) );
        end
        if (targ2 == nil) then
            player:PrintToPlayer( string.format( "Player named '%s' not found!", p2 ) );
        end
        if (targ1 == nil or targ2 == nil) then
            player:PrintToPlayer( "@send <player to be sent> <player to arrive at>" );
        else
            targ1:setPos( targ2:getXPos(), targ2:getYPos(), targ2:getZPos(), 0, targ2:getZone() );
        end
    end
end;
