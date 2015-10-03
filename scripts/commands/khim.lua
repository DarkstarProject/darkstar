---------------------------------------------------------------------------------------------------
-- func:  @khim
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (near Khimaria pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('837','-7','394','54','79');
end

