---------------------------------------------------------------------------------------------------
-- func: Merry Fu**ing Christmas!
-- auth: Tagban
-- desc: Opens Shop for Xmas 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- Gear'
15179,30, -- Dream Hat +1
10383,30, -- Dream Mittens +1
11968,30, -- Dream Pants +1
11966,30, -- Dream Trousers +1
14520,30, -- Dream Robe +1
15753,30, -- DREAM BOOTS!

-- Other
5543,5, -- N0mz
4218,1, -- AIR RIDER!!!
-- 18864,5, -- Bell
-- 3886,5, -- Bastok Case Kit
-- 3887,5, -- Other Kit Windy
-- 3885,5, -- SanD Kit
-- 21098,50, -- Leafkin Bopper +1
 
-- Prizes?
-- 3621,25, -- WINDY
-- 3620,25, -- Bastok
-- 3619,25, -- San D

	}
 
showShop(player, STATIC, stock);
end