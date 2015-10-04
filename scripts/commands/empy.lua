---------------------------------------------------------------------------------------------------
-- func: Shop for Relic Weapons
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Relic Weapons
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
21020,700000000, -- Masamune 
20930,700000000, --  Rhongomiant
21265,700000000, -- Armageddon 
20654,700000000, -- Almace
20748,700000000, -- Caladblog
20795,700000000, -- Farsha
20885,700000000, -- Redemption
20487,700000000, -- Verethragna
20975,700000000, -- Kannqgi
20840,700000000, -- Ukonvasara
20564,700000000, -- Twashter
21065,700000000, -- Gambanteinn
21144,700000000, -- Hvergrlmir
21213,700000000, -- Gandiva
18839,700000000, -- Daurdbala
16199,700000000, -- Ochain


   }
 
showShop(player, STATIC, stock);
end