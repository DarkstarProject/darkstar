---------------------------------------------------------------------------------------------------
-- func: ah/auction
-- auth: <Unknown> :: Modded by Tagban
-- desc: Pops Auction House dialog anywhere in world. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
   player:sendMenu(3);
end
