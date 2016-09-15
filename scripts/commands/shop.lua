---------------------------------------------------------------------------------------------------
-- func: ah/auction
-- auth: <Unknown> :: Modded by Tagban
-- desc: Sets the players position to specific location (can be added to later).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	player:PrintToPlayer("Welcome to BNET.cc's shop of wares to aid you on your adventure!", 0xF);
stock = {
		-- 15793, 100000, -- Anniversary Ring
		-- 15761, 10000, -- Chariot Band
		15762, 15000, -- Empress Band
		15763, 30000, -- Emperor Band
		5163, 1500, -- Sole Sushi +1
		5162, 1500, -- Squid Sushi 1
		5765, 1500, -- Red Curry Bun 1
		1126, 1000, -- Beastman Seals
		1127, 2500, -- Kindred Seals
		2955, 5000, -- Kindred Crests
		1455, 1000, -- One Byne Bill
		1456, 75000, -- 100 Byne Bill
		1457, 750000, -- 10,000 Byne
		1452, 1000, -- O. bronzepiece
		1453, 75000, -- M.Silverpiece
		1454, 750000, -- R.Goldpiece
		1449, 1000, -- T.Whiteshell
		1450, 75000, -- LNJadshell
		1451, 750000, -- RN Jadeshell
		1875, 35000, -- Ancient Beastcoin
        1550, 10000, -- Ark Pentsphere
	}
 
showShop(player, STATIC, stock);
end