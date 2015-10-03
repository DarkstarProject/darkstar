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
18991,75000, -- Conqueror 
18992,75000, --  Glanzfaust  
18993,75000, -- Yagrush 
18994,75000, -- Laevateinn 
18995,75000, -- Murgleis 
18996,75000, -- Vajra 
18997,75000, -- Burtgang 
18998,75000, -- Liberator 
18999,75000, -- Aymur 
19000,75000, -- Carnwenhan 
19001,75000, -- Gastraphetes 
19002,75000, -- Kogarasumaru 
19003,75000, --  Nagi 
19004,75000, -- Ryunohige 
19005,75000, -- Nirvana 
19006,75000, -- Tizona
19007,75000, -- Death Penalty
19008,75000, -- Kenkonken
18989,75000, -- Terpsichore
18990,75000, -- Tupsimati


   }
 
showShop(player, STATIC, stock);
end