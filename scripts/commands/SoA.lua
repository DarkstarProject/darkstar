---------------------------------------------------------------------------------------------------
-- func: SoA Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of SoA wares to aid you on your adventure!", 0xF);
stock = {
		27580, 7000000, -- Adoulin ring
		27582, 7000000, -- Weatherspoon Ring
		27584, 7000000, -- Renaye Ring
		27586, 7000000, -- Haverton Ring
		27588, 7000000, -- Vocane Ring
		27590, 7000000, -- Shneddick Ring
		27581, 7000000, -- Woltaris Ring
		27583, 7000000, -- Janniston Ring
		27585, 7000000, -- Gorney Ring
		27587, 7000000, -- Karieyh Ring
		27589, 7000000, -- Thurandaut Ring
		27591, 7000000, -- Orvail Ring
		-- 21015, 15000000, -- Amanomurakumo
		-- 21260, 15000000, -- Annihilator
		-- 20880, 15000000, -- Apocalypse
		-- 20835, 15000000, -- Bravura
		-- 21135, 15000000, -- Claustrum 
		-- 20645, 15000000, -- Excalibur
		-- 18840, 15000000, -- Gjallarhorn
		-- 20925, 15000000, -- Gungnir
		-- 20790, 15000000, -- Guttler
		-- 20970, 15000000, -- Kikoku
		-- 20583, 15000000, -- Mandau
		-- 21060, 15000000, -- Mjollnir
		-- 20745, 15000000, -- Ragnarok
		-- 20480, 15000000, -- Spharai
		-- 21210, 15000000, -- Youchinoyumi
		-- 27728, 5000000, -- Cizin Helm +1
		-- 27874, 5000000, -- Cizin Mail +1 
		-- 28018, 5000000, -- Cizin Mufflers +1 
		-- 28160, 15000000, -- Cizin Breeches +1 
		-- 28297, 15000000, -- Cizin Greaves +1 
		-- 27731, 5000000, -- Gendewitha Caubeen +1 
		-- 27877, 5000000, -- Gendewitha Bliaut +1
		-- 28021, 5000000, -- Gendewitha Gages +1 
		-- 28163, 15000000, -- Gendewitha Spats +1
		-- 28300, 15000000, -- Gendewitha Galoshes +1 
		-- 27732, 5000000, -- Hagondes Hat +1
		-- 27878, 5000000, -- Hagondes Coat +1
		-- 28022, 5000000, -- Hagondes Cuffs +1 
		-- 28164, 15000000, -- Hagondes Pants +1 
		-- 28301, 15000000, -- Hagondes Sabots +1 
		-- 27730, 5000000, -- Iuitl Headgear +1
		-- 27876, 5000000, -- Iuitl Vest +1 
		-- 28020, 5000000, -- Iuitl Wristbands +1
		-- 28162, 15000000, -- Iuitl Tights +1 
		-- 28299, 15000000, -- Iuitl Gaiters +1
		-- 27729, 5000000, -- Otronif Mask +1
		-- 27875, 5000000, -- Otronif Harness +1
		-- 28019, 5000000, -- Otronif Gloves +1
		-- 28161, 15000000, -- Otronif Brais +1
		-- 28298, 15000000, -- Otronif Boots +1 
		-- 26741, 15000000, -- Boii Mask +1
		-- 26899, 15000000, -- Boii Lorica +1
		-- 27053, 15000000, -- Boii Mufflers +1
		-- 27238, 5000000, -- Boii Cuissess +1
		-- 27412, 5000000, -- Boii Calliage +1
		-- 26743, 5000000, -- Bhikku Crown +1
		-- 26901, 15000000, -- Bhikku Cyclas +1
		-- 27055, 15000000, -- Bhikku Gloves +1
		-- 27240, 15000000, -- Bhikku Hose +1
		-- 27414, 15000000, -- Bhikku Gaiters +1
		-- 26745, 15000000, -- Ebers Cap +1
		-- 26903, 5000000, -- Ebers Bliaud +1
		-- 27057, 5000000, -- Ebers Mitts +1
		-- 27242, 5000000, -- Ebers Pantaloons +1
		-- 27416, 15000000, -- Ebers duckbills +1
		-- 26747, 15000000, -- Wicce Petasos + 1
		-- 26905, 15000000, -- Wicce Coat +1
		-- 27059, 5000000, -- Wicce gloves +1
		-- 27244, 5000000, -- Wicce chausses +1
		-- 27418, 5000000, -- Wicce Sabots +1
		-- 26749, 15000000, -- Lethargy chappel +1
		-- 26907, 15000000, -- Lethargy Sayon +1
		-- 27061, 15000000, -- Lethargy Gantherots+1
		-- 27246, 5000000, -- Lethargy Fuseau +1
		-- 27420, 5000000, -- Lethargy Houseaux +1
		-- 26751, 5000000, -- Skulker's Bonnet +1
		-- 26909, 15000000, -- Skulker's vest +1
		-- 27063, 15000000, -- Skulker's armlets +1
		-- 27248, 15000000, -- Skulker's culottes +1
		-- 27422, 5000000, -- Skulker's Poulaines +1
		-- 26753, 5000000, -- Chevalier armet +1
		-- 26911, 5000000, -- Chevalier cuirass +1
		-- 27065, 15000000, -- Chevalier gauntlets +1
		-- 27250, 15000000, -- Chevalier Cuissess +1
		-- 27424, 15000000, -- Chevalier sabatons +1
		-- 26755, 5000000, -- Heathen's burgonet +1
		-- 26913, 5000000, -- Heathen's cuirass+1
		-- 27067, 5000000, -- Heathen's gauntlets +1
		-- 27252, 15000000, -- Heathen's Flanchard +1
		-- 27426, 15000000, -- Heathen's Sollerets +1
		-- 26757, 15000000, -- Nukumi cabasset +1
		-- 26915, 5000000, -- Nukumi Gausape +1
		-- 27069, 5000000, -- Nukumi manoplas +1
		-- 27428, 5000000, -- Nukumi Ocreae +1
		-- 27254, 15000000, -- Nukumi Quijotes+1
		-- 26759, 15000000, -- Fili Calot +1
		-- 26917, 15000000, -- Fili Hongreline +1
		-- 27071, 5000000, -- Fili Manchettes +1
		-- 27256, 5000000, -- Fili Rhingrave +1
		-- 27430, 5000000, -- Fili Cothurnes +1
		-- 26761, 15000000, -- Amini Gapette +1
		-- 26919, 15000000, -- Amini Caban +1
		-- 27073, 15000000, -- Amini Glovelettes +1
		-- 27258, 5000000, -- Amini Brague +1
		-- 27432, 5000000, -- Amini Bottillons +1
		-- 26763, 5000000, -- Kasuga Kabuto +1
		-- 26921, 15000000, -- Kasuga Domaru +1
		-- 27075, 15000000, -- Kasuga Kote +1
		-- 27260, 15000000, -- Kasuga Haidate +1
		-- 27434, 5000000, -- Kasuga Sune-Ate +1
		-- 26765, 5000000, -- Hattori Zukin +1
		-- 26923, 5000000, -- Hattori Ningi +1
		-- 27077, 15000000, -- Hattori Tekko +1
		-- 27262, 15000000, -- Hattori Hakama +1
		-- 27436, 15000000, -- Hattori Kyahan +1
		-- 26767, 5000000, -- Peltast's Mezail +1
		-- 26925, 5000000, -- Peltast's Plackart +1
		-- 27079, 5000000, -- Peltast's Vambraces +1
		-- 27264, 15000000, -- Peltast's Cuissots +1
		-- 27438, 15000000, -- Peltast's Schynbalds +1
		-- 26769, 15000000, -- Beckoner's Horn+1
		-- 26927, 5000000, -- Beckoner's Doublet +1
		-- 27081, 5000000, -- Beckoner's Bracers +1
		-- 27266, 5000000, -- Beckoner's Spats +1
		-- 26771, 15000000, -- Hashishin Kavuk +1
		-- 26929, 15000000, -- Hashishin Mintan +1
		-- 27083, 15000000, -- Hashishin Bazubands +1
		-- 27268, 5000000, -- Hashishin Tayt +1
		-- 27442, 5000000, -- Hashishin Basmak +1
		-- 26773, 5000000, -- Chasseur's Tricorne +1
		-- 26931, 15000000, -- Chasseur's Frac +1
		-- 27085, 15000000, -- Chasseur's Gants +1
		-- 27270, 15000000, -- Chasseur's Culottes +1
		-- 27444, 5000000, -- Chasseur's Bottes +1
		-- 26775, 5000000, -- Karagoz capello +1
		-- 26933, 5000000, -- Karagoz Farsetto +1
		-- 27087, 15000000, -- Karagoz Guanti +1
		-- 27272, 15000000, -- Karagoz Pantaloni +1
		-- 27446, 15000000, -- Karagoz Scarpe +1
		-- 26777, 5000000, -- Maculele Tiara +1
		-- 26935, 5000000, -- Maculele Casaque +1
		-- 27089, 5000000, -- Maculele Bangles +1
		-- 27274, 15000000, -- Maculele Tights +1
		-- 27448, 15000000, -- Maculele Toeshoes +1
		-- 26779, 15000000, -- Arbatel Bonnet+1
		-- 26937, 5000000, -- Arbatel Gown +1
		-- 27091, 5000000, -- Arbatel Bracers +1
		-- 27276, 5000000, -- Arbatel Pants +1
		-- 27450, 15000000, -- Arbatel Loafers +1
		-- 26781, 15000000, -- Azimuth Hood +1
		-- 26939, 15000000, -- Azimuth Coat +1
		-- 27093, 5000000, -- Azimuth Gloves +1
		-- 27278, 5000000, -- Azimuth Tights +1
		-- 27452, 5000000, -- Azimuth Gaiters+1
		-- 26783, 15000000, -- Erilaz Galea +1
		-- 26941, 15000000, -- Erilaz Surcoat +1
		-- 27095, 15000000, -- Erilaz Gauntlets +1
		-- 27280, 5000000, -- Erilaz Leg Guards +1
		-- 27454, 5000000, -- Erilaz Greaves +1
    }

showShop(player, STATIC, stock);
end