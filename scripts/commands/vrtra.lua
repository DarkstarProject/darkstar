---------------------------------------------------------------------------------------------------
-- func:  @vrtra
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (near vrtra pop).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone)
            player:setPos('184','7','-300','255','190');
end
