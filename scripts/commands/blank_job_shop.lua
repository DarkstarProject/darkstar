---------------------------------------------------------------------------------------------------
-- func: shop template
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- itemid,price, -- description
-- itemid,price, -- description
-- itemid,price, -- description
-- itemid,price, -- description
-- itemid,price, -- description
	}
 
showShop(player, STATIC, stock);
end