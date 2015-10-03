---------------------------------------------------------------------------------------------------
-- func: Shop for Gear
-- auth: <Unknown> :: Modded by Hiro
-- desc: Opens Shop for Gear
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
   
stock = {
16057,10000, -- Asir Pendent
15807,10000, -- Balrahn's Ring
15809,10000, -- Jalzahn's Ring
15808,10000, -- Ulthalam's Ring
11546,10000, -- Aesir Mantle
27774,10000, -- Whirlpool Mask
28402,50000, -- Asperity Necklace
16260,20000, -- Atheling Mantle
11651,30000, -- Epona Ring
28450,50000,
20618,30000,
28521,50000,
28520,50000,
28580,50000,
28401,50000,
11669,25000,
11798,75000, -- Twilight Helm
11362,75000, -- Twilight Mail
10398,75000, -- Weike Torque
28524,75000, -- lifestorm-earring
28525,75000, -- psystorm-earring
28643,75000, -- refraction-cape
18245,75000, -- aureole
10493,75000, -- iaso-bliaut
14808,75000, -- novio-earring
14812,75000, -- loquac-earring

   }
 
showShop(player, STATIC, stock);
end