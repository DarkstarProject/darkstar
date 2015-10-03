---------------------------------------------------------------------------------------------------
-- func:  @char
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};
function onTrigger(player)
            player:setPos('-189', '40', '-338', '247', '176');
end