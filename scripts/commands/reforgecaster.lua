---------------------------------------------------------------------------------------------------
-- func: Reforge gear for casters
-- auth: <Unknown> :: Wadski
-- desc: Opens Shop for reforged gear
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
26745,25000, -- Ebers Cap +1
26903,25000, -- Ebers Briault +1
27057,25000, -- Ebers Mitts +1
27242,25000, -- Ebers Pant. +1
27416,25000, -- Ebers Duckbills +1
26747,25000, -- Wicce Petasos +1
26905,25000, -- Wicce Coat +1
27059,25000, -- Wicce Gloves +1
27244,25000, -- Wicce Chausses +1
27418,25000, -- Wicce Sabots +1
26749,25000, -- Leth. Chappel +1
26907,25000, -- Lethargy Sayon +1
27061,25000, -- Leth. Gantherots +1
27246,25000, -- Leth. Fuseau +1
27420,25000, -- Leth. Houseaux +1
26759,25000, -- Fili Calot +1
26917,25000, -- Fili Hongreline +1
27071,25000, -- Fili Manchettes +1
27256,25000, -- Fili Rhingrave +1
27430,25000, -- Fili Cothurnes +1
26769,25000, -- Beckoner's Horn +1
26927,25000, -- Beck. Doublet +1
27081,25000, -- Beck. Bracers +1
27266,25000, -- Beck. Spats +1
27440,25000, -- Beck. Pigaches +1
26771,25000, -- Hashishin Kavuk +1
26929,25000, -- Hashishin Mintan +1
27083,25000, -- Hashi. Bazu. +1
27268,25000, -- Hashishin Tayt +1
27442,25000, -- Hashi. Basmak +1
26773,25000, -- Chass. Tricorne +1
26931,25000, -- Chasseur's Frac +1
27085,25000, -- Chasseur's Gants +1
27270,25000, -- Chas. Culottes +1
27444,25000, -- Chass. Bottes +1
26779,25000, -- Arbatel Bonnet +1
26937,25000, -- Arbatel Gown +1
27091,25000, -- Arbatel Bracers +1
27276,25000, -- Arbatel Pants +1
27450,25000, -- Arbatel Loafers +1


	}
 
showShop(player, STATIC, stock);
end