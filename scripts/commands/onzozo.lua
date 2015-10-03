---------------------------------------------------------------------------------------------------
-- func:  @onzozo
-- auth: <Unknown> :: Modded by wadski
-- desc: Sets the players position to specific location 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};
function onTrigger(player)
            player:setPos('-29', '12', '-58', '145', '213');
end