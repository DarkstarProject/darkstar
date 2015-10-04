---------------------------------------------------------------------------------------------------
-- func:  @sky2
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location escha-Ru'aun.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};
function onTrigger(player)
            player:setPos('2', '-44', '-141', '62', '289');
end