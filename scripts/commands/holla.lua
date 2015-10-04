---------------------------------------------------------------------------------------------------
-- func: Teleport to Tele-Holla
-- auth: <Unknown> :: Modded by VRTRA
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)  
            player:setPos('421', '19', '18', '23', '102');
end