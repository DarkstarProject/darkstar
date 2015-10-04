---------------------------------------------------------------------------------------------------
-- func: RNG Gear Purchase AF1/AF2/AF3
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
11998,40000, -- Hunter's Torque
17188,40000, -- Sniping Bow
12518,60000, -- Hunter's Beret
12648,60000, -- Hunter's Jerkin
13971,60000, -- Hunter's Bracers
14224,60000, -- Hunter's Braccae
14099,60000, -- Hunter's Socks
-- AF+1
15235,100000, -- Hunter's Beret+1
14483,100000, -- Hunter's Jerkin+1
14900,100000, -- Hunter's Bracers+1
15571,100000, -- Hunter's Braccae+1
15362,100000, -- Hunter's Socks+1
-- Relic
15876,150000, -- Scout's Belt
15082,180000, -- Scout's Beret
15097,180000, -- Scout's Jerkin
15112,180000, -- Scout's Bracers
15127,180000, -- Scout's Braccae
15142,180000, -- Scout's Socks
-- Relic +1
15255,280000, -- Scout's Beret+1
14510,280000, -- Scout's Jerkin+1
14919,280000, -- Scout's Bracers+1
15590,280000, -- Scout's Braccae+1
15675,280000, -- Scout's Socks+1
-- Relic +2
10660,380000, -- Scout's Beret+2
10680,380000, -- Scout's Jerkin+2
10700,380000, -- Scout's Bracers+2
10720,380000, -- Scout's Braccae+2
10740,380000, -- Scout's Socks+2

	}
 
showShop(player, STATIC, stock);
end