---------------------------------------------------------------------------------------------------
-- func: skirmish gear
-- auth: <Unknown> :: Wadski
-- desc: Opens Shop for skirmish gear
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
28160,25000, -- Cizin Breeches +1
28297,25000, -- Cizin Greaves +1
27728,25000, -- Cizin Helm +1
27874,25000, -- Cizin Mail +1
28018,25500, -- Cizin Mufflers +1
27877,25500, -- Gendewitha Bilaut +1
27731,25500, -- Gendewitha Caubeen +1
28300,25500, -- Gendewitha Galoshes +1
28021,25500, -- Gendewitha Gages +1
28163,25500, -- Gendewitha Spats +1
28301,25500, -- Hagondes Sabots +1
27878,25500, -- Hagondes Coat +1
28022,25500, -- Hagondes Cuffs +1
27732,25500, -- Hagondes Hat +1
28164,25500, -- Hagondes Pants +1
28299,25500, -- Iuitl Gaiters +1
27730,25500, -- Iuitl Headgear +1
28162,25500, -- Iuitl Tights +1
27876,25500, -- Iuitl Vest +1
28020,25500, -- Iuitl Wristbands +1
27875,25500, -- Otronif harness +1
28298,25500, -- Otronif Boots +1
28161,25500, -- Otronif Brais +1
28019,25500, -- Otronif Gloves +1
27729,25500, -- Otronif Mask +1
28654,25500, -- Beatific Shield +1
	}
 
showShop(player, STATIC, stock);
end

