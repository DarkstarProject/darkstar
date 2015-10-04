---------------------------------------------------------------------------------------------------
-- func: PLD Gear Purchase AF1/AF2/AF3
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Job Specific gear.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
-- AF1
11994,40000, -- Gallant Torque
17643,40000, -- War Hoop
12515,60000, -- Gallant Coronet
12644,60000, -- Gallant Surcoat
13967,60000, -- Gallant Gauntlets
14220,60000, -- Gallant Breeches
14095,60000, -- Gallant Leggings
-- AF+1
15231,100000, -- Gallant Coronet+1
14479,100000, -- Gallant Surcoat+1
14896,100000, -- Gallant Gauntlets+1
15567,100000, -- Gallant Breeches+1
15358,100000, -- Gallant Leggings+1
-- Relic
15481,150000, -- Valor Cape
15078,180000, -- Valor Coronet
15093,180000, -- Valor Surcoat
15108,180000, -- Valor Gauntlets
15123,180000, -- Valor Breeches
15138,180000, -- Valor Leggings
-- Relic +1
15251,280000, -- Valor Coronet+1
14506,280000, -- Valor Surcoat+1
14915,280000, -- Valor Gauntlets+1
15586,280000, -- Valor Breeches+1
15671,280000, -- Valor Leggings+1
-- Relic +2
10656,380000, -- Valor Coronet+2
10676,380000, -- Valor Surcoat+2
10696,380000, -- Valor Gauntlets+2
10716,380000, -- Valor Breeches+2
10736,380000, -- Valor Leggings+2
	}
 
showShop(player, STATIC, stock);
end