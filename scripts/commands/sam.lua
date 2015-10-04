---------------------------------------------------------------------------------------------------
-- func: SAM Gear Purchase AF1/AF2/AF3
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
11999,40000, -- Myochin Torque
17812,40000, -- Magoroku
13868,60000, -- Myochin Kabuto
13781,60000, -- Myochin Domaru
13972,60000, -- Myochin Kote
14225,60000, -- Myochin Haidate
14100,60000, -- Myochin Sune-Ate
-- AF+1
15236,100000, -- Myochin Kabuto+1
14484,100000, -- Myochin Domaru+1
14901,100000, -- Myochin Kote+1
15572,100000, -- Myochin Haidate+1
15363,100000, -- Myochin Sune-Ate+1
-- Relic
15879,150000, -- Saotome Koshi-Ate
15083,180000, -- Saotome Kabuto
15098,180000, -- Saotome Domaru
15113,180000, -- Saotome Kote
15128,180000, -- Saotome Haidate
15143,180000, -- Saotome Sune-Ate
-- Relic +1
15256,280000, -- Saotome Kabuto+1
14511,280000, -- Saotome Domaru+1
14920,280000, -- Saotome Kote+1
15591,280000, -- Saotome Haidate+1
15676,280000, -- Saotome Sune-Ate+1
-- Relic +2
10661,380000, -- Saotome Kabuto+2
10681,380000, -- Saotome Domaru+2
10701,380000, -- Saotome Kote+2
10721,380000, -- Saotome Haidate+2
10741,380000, -- Saotome Sune-Ate+2
	}
 
showShop(player, STATIC, stock);
end