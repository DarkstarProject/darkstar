---------------------------------------------------------------------------------------------------
-- func: COR Gear Purchase AF1/AF2/AF3
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
12004,40000, -- Corsair's Torque
18702,40000, -- Trump Gun
15266,60000, -- Corsair's Tricorne
14522,60000, -- Corsair's Frac
14929,60000, -- Corsair's Gants
15601,60000, -- Corsair's Culottes
15685,60000, -- Corsair's Bottes
-- AF+1
11467,100000, -- Corsair's Tricorne+1
11294,100000, -- Corsair's Frac+1
15027,100000, -- Corsair's Gants+1
16348,100000, -- Corsair's Culottes+1
11384,100000, -- Corsair's Bottes+1
-- Relic
15920,150000, -- Commodore Belt
11468,180000, -- Commodore Tricorne
11295,180000, -- Commodore Frac
15028,180000, -- Commodore Gants
16349,180000, -- Commodore Culottes
11385,180000, -- Commodore Bottes
-- Relic +1
11469,280000, -- Commodore Tricorne+1
11296,280000, -- Commodore Frac+1
15029,280000, -- Commodore Gants+1
16350,280000, -- Commodore Culottes+1
11386,280000, -- Commodore Bottes+1
-- Relic +2
10666,380000, -- Commodore Tricorne+2
10686,380000, -- Commodore Frac+2
10706,380000, -- Commodore Gants+2
10726,380000, -- Commodore Culottes+2
10746,380000, -- Commodore Bottes+2
	}
 
showShop(player, STATIC, stock);
end