---------------------------------------------------------------------------------------------------
-- func: @pos <x> <y> <z> <optional zone> <optional target>
-- desc: Sets the players position. If none is given, prints out the position instead.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiis"
};

function onTrigger(player, x, y, z, zone, target)
    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ == nil) then
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        return
    end

    if (x == nil or y == nil or z == nil and zone == nil) then
        targ:showPosition();
    else
        if (zone == nil) then
            targ:setPos(x, y, z, 0);
        else
            targ:setPos(x, y, z, 0, zone);
        end
    end
end;