---------------------------------------------------------------------------------------------------
-- func: BLU Gear Purchase AF1/AF2/AF3
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
12003,40000, -- Magus Torque
17717,40000, -- Immortal's Scimitar
15265,60000, -- Magus Keffiyeh
14521,60000, -- Magus Jubbah
14928,60000, -- Magus Bazubands
15600,60000, -- Magus Shalwar
15684,60000, -- Magus Charuqs
-- AF+1
11464,100000, -- Magus Keffiyeh+1
11291,100000, -- Magus Jubbah+1
15024,100000, -- Magus Bazubands+1
16345,100000, -- Magus Shalwar+1
11381,100000, -- Magus Charuqs+1
-- Relic
16244,150000, -- Mirage Mantle
11465,180000, -- Mirage Keffiyeh
11292,180000, -- Mirage Jubbah
15025,180000, -- Mirage Bazubands
16346,180000, -- Mirage Shalwar
11382,180000, -- Mirage Charuqs
-- Relic +1
11466,280000, -- Mirage Keffiyeh+1
11293,280000, -- Mirage Jubbah+1
15026,280000, -- Mirage Bazubands+1
16347,280000, -- Mirage Shalwar+1
11383,280000, -- Mirage Charuqs+1
-- Relic +2
10665,380000, -- Mirage Keffiyeh+2
10685,380000, -- Mirage Jubbah+2
10705,380000, -- Mirage Bazubands+2
10725,380000, -- Mirage Shalwar+2
10745,380000, -- Mirage Charuqs+2

	}
 
showShop(player, STATIC, stock);
end