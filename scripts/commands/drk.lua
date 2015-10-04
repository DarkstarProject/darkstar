---------------------------------------------------------------------------------------------------
-- func: DRK Gear Purchase AF1/AF2/AF3
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
11995,40000, -- Chaos Torque
16798,40000, -- Raven Scythe
12516,60000, -- Chaos Burgeonet
12645,60000, -- Chaos Cuirass
13968,60000, -- Chaos Gauntlets
14221,60000, -- Chaos Flanchard
14096,60000, -- Chaos Sollerets
-- AF+1
15232,100000, -- Chaos Burgeonet+1
14480,100000, -- Chaos Cuirass+1
14897,100000, -- Chaos Gauntlets+1
15568,100000, -- Chaos Flanchard+1
15359,100000, -- Chaos Sollerets+1
-- Relic
15479,150000, -- Abyss Cape
15079,180000, -- Abyss Burgeonet
15094,180000, -- Abyss Cuirass
15109,180000, -- Abyss Gauntlets
15124,180000, -- Abyss Flanchard
15139,180000, -- Abyss Sollerets
-- Relic +1
15252,280000, -- Abyss Burgeonet+1
14507,280000, -- Abyss Cuirass+1
14916,280000, -- Abyss Gauntlets+1
15587,280000, -- Abyss Flanchard+1
15672,280000, -- Abyss Sollerets+1
-- Relic +2
10657,380000, -- Abyss Burgeonet+2
10677,380000, -- Abyss Cuirass+2
10697,380000, -- Abyss Gauntlets+2
10717,380000, -- Abyss Flanchard+2
10737,380000, -- Abyss Sollerets+2
	}
 
showShop(player, STATIC, stock);
end