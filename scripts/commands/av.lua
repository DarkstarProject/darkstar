---------------------------------------------------------------------------------------------------
-- func: av
-- auth: <Unknown> :: Modded by Wadski
-- desc: Sets the players position to specific location (Absoulute Virtue).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};
function onTrigger(player, x, y, z, zone) 
            player:setPos('46', '-1', '25', '-581', '128');
end