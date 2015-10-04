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
            player:setPos('100', '35', '339', '29', '117');
end