---------------------------------------------------------------------------------------------------
-- func: Shop for statue
-- auth: <Unknown> :: Modded by Wadski
-- desc: Opens Shop for Tanks
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
270,75000, -- 
266,75000, -- 
267,75000, -- 
1750,25000, --
1752,25000, --
1753,25000, --
1754,25000,
1751,25000

   }
 
showShop(player, STATIC, stock);
end
