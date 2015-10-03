---------------------------------------------------------------------------------------------------
-- func: PUP Gear Purchase AF1/AF2/AF3
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
12005,40000, -- Puppetry Torque
17858,40000, -- Turbo Animator
15267,60000, -- Puppetry Taj
14523,60000, -- Puppetry Tobe
14930,60000, -- Puppetry Dastanas
15602,60000, -- Puppetry Churidars
15686,60000, -- Puppetry Babouches
-- AF+1
11470,100000, -- Puppetry Taj+1
11297,100000, -- Puppetry Tobe+1
15030,100000, -- Puppetry Dastanas+1
16351,100000, -- Puppetry Churidars+1
11387,100000, -- Puppetry Babouches+1
-- Relic
16245,150000, -- Pantin Cape
11471,180000, -- Pantin Taj
11298,180000, -- Pantin Tobe
15031,180000, -- Pantin Dastanas
16352,180000, -- Pantin Churidars
11388,180000, -- Pantin Babouches
-- Relic +1
11472,280000, -- Pantin Taj+1
11299,280000, -- Pantin Tobe+1
15032,280000, -- Pantin Dastanas+1
16353,280000, -- Pantin Churidars+1
11389,280000, -- Pantin Babouches+1
-- Relic +2
10667,380000, -- Pantin Taj+2
10687,380000, -- Pantin Tobe+2
10707,380000, -- Pantin Dastanas+2
10727,380000, -- Pantin Churidars+2
10747,380000, -- Pantin Babouches+2
	}
 
showShop(player, STATIC, stock);
end