---------------------------------------------------------------------------------------------------
-- func:  @purgo
-- auth: <Unknown> :: Modded by wadski
-- desc: Sets the players position to specific location (purgo isle).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
            player:setPos('-382', '-2', '-431', '64', '4');
end