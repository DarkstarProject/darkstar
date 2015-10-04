---------------------------------------------------------------------------------------------------
-- func: tiamat
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (Fafnir).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
                player:setPos('-555', '-11', '-45', '201', '7');
end