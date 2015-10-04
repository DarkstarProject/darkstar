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
18264,50000, -- Spharai 
18270,50000, --  Mandau
18276,50000, -- Excalibur 
18282,50000, -- Ragnarok 
18288,50000, -- Guttler
18294,50000, -- Bravura 
18306,50000, -- Apocalypse
18300,50000, -- Gungnir
18312,50000, -- Kikoku
18318,50000, -- Amanomurakumo
18324,50000, -- Mjollnir
18330,50000, -- Claustrum
18336,50000, -- Annihilator
18348,50000, -- Yoichinoyumi
18342,50000, -- Gjallarhorn
15070,50000, -- Aegis


   }
 
showShop(player, STATIC, stock);
end