---------------------------------------------------------------------------------------------------
-- func: tiamat
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Fafnir).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
            player:setPos('272', '0', '-695', '180', '51');
end