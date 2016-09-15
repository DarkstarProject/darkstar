---------------------------------------------------------------------------------------------------
-- func: tools.lua
-- auth: Tagban
-- desc: Ninja Tools Shop Command
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};
function onTrigger(player)
	player:PrintToPlayer("All the ninja Tools you need for your adventure!");
stock = {
		5869, 500, -- Chonofuda
		5312, 500, -- Hiraishin
		5867, 500, -- Inoshishinofuda
		5864, 500, -- Jinko
		5315, 500, -- Jusatsu
		5863, 500, -- Kabenro
		5316, 500, -- Kaginawa
		5310, 500, -- Kawahori-Ogi
		5318, 500, -- Kodoku
		5311, 500, -- Makibishi
		5313, 500, -- Mizu-Deppo
		5866, 500, -- Mokukin
		5865, 500, -- Ryuno
		5317, 500, -- Sairui-Ran
		5417, 500, -- Sanjaku-Tenugui
		5314, 500, -- Shihei
		5868, 500, -- Shikanofuda
		5319, 500, -- Shinobi-Tabi
		5734, 500, -- Soshi
		5309, 500, -- Tsurara
		5308, 500, -- Uchitake
		
	}
 
showShop(player, STATIC, stock);
end