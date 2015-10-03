---------------------------------------------------------------------------------------------------
-- func: Shop for Tanks
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
10280,75000, -- laeradr-breastplate
10442,75000, -- laeradr-helm
13566,75000, -- defending-ring
13658,75000, -- shadow-mantle
10798,75000, -- eihwaz-ring

   }
 
showShop(player, STATIC, stock);
end
