---------------------------------------------------------------------------------------------------
-- func: @return <player>
-- auth: TeoTwawki
-- desc: Warps GM or target player to their previous zone
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "s"
};

function onTrigger(player, target)
    local ZoneID = 0
    if (target == nil or player:getGMLevel() == 0) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        ZoneID = targ:getPreviousZone();
        if (ZoneID == nil or ZoneID == 0) then
            player:PrintToPlayer( "Previous Zone was a Mog House or there was a problem fetching the ID.");
        else
            targ:setPos( 0, 0, 0, 0, ZoneID );
        end
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end;