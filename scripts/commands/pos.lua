---------------------------------------------------------------------------------------------------
-- func: pos
-- auth: <Unknown> :: Modded by atom0s
-- desc: Sets the players position. If none is given, prints out the position instead.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};

function onTrigger(player, x, y, z, zone)
    if (x == nil or y == nil or z == nil and zone == nil) then
        player:showPosition();
    else    
        if (zone == nil) then
            player:setPos(x, y, z, 0);
        else
            player:setPos(x, y, z, 0, zone);
        end
    end
end