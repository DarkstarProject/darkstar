---------------------------------------------------------------------------------------------------
-- func: NIN Gear Purchase AF1/AF2/AF3
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
12000,40000, -- Ninja Shusa
17771,40000, -- Anju
17772,40000, -- Zushio
13869,60000, -- Ninja Hatsuburi
13782,60000, -- Ninja Chainmail
13973,60000, -- Ninja Tekko
14226,60000, -- Ninja Hakama
14101,60000, -- Ninja Kyahan
-- AF+1
15237,100000, -- Ninja Hatsuburi+1
14485,100000, -- Ninja Chainmail+1
14902,100000, -- Ninja Tekko+1
15573,100000, -- Ninja Hakama+1
15364,100000, -- Ninja Kyahan+1
-- Relic
15877,150000, -- Koga Sarashi
15084,180000, -- Koga Hatsuburi
15099,180000, -- Koga Chainmail
15114,180000, -- Koga Tekko
15129,180000, -- Koga Hakama
15144,180000, -- Koga Kyahan
-- Relic +1
15257,280000, -- Koga Hatsuburi+1
14512,280000, -- Koga Chainmail+1
14921,280000, -- Koga Tekko+1
15592,280000, -- Koga Hakama+1
15677,280000, -- Koga Kyahan+1
-- Relic +2
10662,380000, -- Koga Hatsuburi+2
10682,380000, -- Koga Chainmail+2
10702,380000, -- Koga Tekko+2
10722,380000, -- Koga Hakama+2
10742,380000, -- Koga Kyahan+2
	}
 
showShop(player, STATIC, stock);
end