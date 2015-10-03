---------------------------------------------------------------------------------------------------
-- func: Twilight Gear Purchase
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Shinryu gear. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
11798,750000, -- Twilight Helm
11362,750000, -- Twilight Mail
11363,750000, -- Twilight Cloak
15959,750000, -- Twilight Belt
18551,750000, -- Twilight Scythe
11625,750000, -- Twilight Torque
19132,750000, -- Twilight Knife
16259,750000, -- Twilight Cape
	}
 
showShop(player, STATIC, stock);
end