---------------------------------------------------------------------------------------------------
-- func: level 99 weapon
-- auth: <Unknown> :: Wadski
-- desc: Opens Shop for weapon
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
16199,25000, -- Ochain
21265,25000, -- Armageddon
18839,25000, -- Daurdabla
21213,25000, -- Gandiva
20564,25000, -- Twashtar
20487,25000, -- Verethragna
20748,25000, -- Caladbolg
20654,25000, -- Almace
20795,25000, -- Farsha
20885,25000, -- Redemption
20975,25000, -- Kannagi
21020,25000, -- Masamune
21065,25000, -- Gambanteinn
21144,25000, -- Hvergelmir
20930,25000, -- Rhongomiant
20840,25000, -- Ukonvasara

	}
 
showShop(player, STATIC, stock);
end