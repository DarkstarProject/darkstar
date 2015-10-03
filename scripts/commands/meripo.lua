---------------------------------------------------------------------------------------------------
-- func: teleport to Kaznar
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location .
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
            player:setPos('-141', '-505', '339', '126', '276');
end