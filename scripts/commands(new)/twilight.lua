---------------------------------------------------------------------------------------------------
-- func: Twilight Gear Purchase
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Shinryu gear. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
	
stock = {
11798,111111, -- Twilight Helm
11362,111111, -- Twilight Mail
19132,111111, -- Twilight Dagger
15959,111111, -- Twilight Belt

	}
 
showShop(player, STATIC, stock);
end