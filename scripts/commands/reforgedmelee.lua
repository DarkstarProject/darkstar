---------------------------------------------------------------------------------------------------
-- func: Reforge gear for melee
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
26741,25000, -- Boii Mask +1
26899,25000, -- Boii Lorica +1
27238,25000, -- Boii Cuisses +1
27412,25000, -- Boii Calligae +1
27053,25000, -- Boii Mufflers +1
26743,25000, -- Bhikku Crown +1
26901,25000, -- Bhikku Cyclas +1
27414,25000, -- Bhikku Gaiters +1
27055,25000, -- Bhikku Gloves +1
27240,25000, -- Bhikku Hose +1
26751,25000, -- Skulker's Bonnet +1
26909,25000, -- Skulker's Vest +1
27063,25000, -- Skulk. Armlets +1
27248,25000, -- Skulk. Culottes +1
27422,25000, -- Skulk. Poulaines +1
26755,25000, -- Heath. Burgonet +1
26913,25000, -- Heath. Cuirass +1
27067,25000, -- Heath. Gauntlets +1
27252,25000, -- Heath. Flanchard +1
27426,25000, -- Heath. Sollerets +1
26757,25000, -- Nuk. Cabasset +1
26915,25000, -- Nukumi Gausape +1
27069,25000, -- Nukumi Manoplas +1
27254,25000, -- Nukumi Quijotes +1
27428,25000, -- Nukumi Ocreae +1
26761,25000, -- Amini Gapette +1
26919,25000, -- Amini Caban +1
27073,25000, -- Amini Glove. +1
27258,25000, -- Amini Brague +1
27432,25000, -- Amini Bottillons +1
26765,25000, -- Hattori Zukin +1
26923,25000, -- Hattori Ningi +1
27077,25000, -- Hattori Tekko +1
27262,25000, -- Hattori Hakama +1
27436,25000, -- Hattori Kyahan +1
26767,25000, -- Peltast's Mezail +1
26925,25000, -- Pelt. Plackart +1
27079,25000, -- Pel. Vambraces +1
27264,25000, -- Pelt. Cuissots +1
27438,25000, -- Pelt. Schyn. +1
26775,25000, -- Karagoz Capello +1
26933,25000, -- Kara. Farsetto +1
27087,25000, -- Karagoz Guanti +1
27272,25000, -- Kara. Pantaloni +1
27446,25000, -- Karagoz Scarpe +1
26777,25000, -- Maculele Tiara +1
26935,25000, -- Macu. Casaque +1
27089,25000, -- Macu. Bangles +1
27274,25000, -- Maculele Tights +1
27448,25000, -- Macu. Toeshoes +1
26781,25000, -- Azimuth Hood +1
26939,25000, -- Azimuth Coat +1
27093,25000, -- Azimuth Gloves +1
27278,25000, -- Azimuth Tights +1
27452,25000, -- Azimuth Gaiters +1
26783,25000, -- Erilaz Galea +1
26941,25000, -- Erilaz Surcoat +1
27095,25000, -- Erilaz Gauntles +1
27280,25000, -- Eri. Leg Guards +1
27454,25000, -- Erilaz Greaves +1

	}
 
showShop(player, STATIC, stock);
end