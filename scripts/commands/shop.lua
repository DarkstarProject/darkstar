---------------------------------------------------------------------------------------------------
-- func: Shop for Random items
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Random items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
15793,500000, -- Anniversary Ring 
1875,20000,
1126,5000,
1127,5000,
5765,1500, --  Red Curry Buns +1
5718,1500,
4236,200000, 
4589,1500, -- bowl of wild stew




   }
 
showShop(player, STATIC, stock);
end