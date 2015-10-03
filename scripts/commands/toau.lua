---------------------------------------------------------------------------------------------------
-- func: Shop for Mythic weapons
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Mythic weapons
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
3443,25000, -- cats tear
176,25000, -- Snowman Knight
177,25000, -- Snowman Miner
178,25000, -- Snowman Mage
3649,25000, -- Harvest Horror
3647,25000, -- Spook-a-Swirl
3648,25000, -- Chocolate Grumpkin


   }
 
showShop(player, STATIC, stock);
end