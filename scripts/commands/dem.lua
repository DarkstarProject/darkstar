---------------------------------------------------------------------------------------------------
-- func: Teleport to Tel-holla
-- auth: <Unknown> :: Modded by VRTRA
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)  
            player:setPos('220', '19', '301', '195', '108');
end