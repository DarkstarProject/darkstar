---------------------------------------------------------------------------------------------------
-- func: Reforge gear for tank
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
26753,25000, -- Chev. Armet +1
26911,25000, -- Chev. Cuirass +1
27065,25000, -- Chev. Gauntlets +1
27250,25000, -- Chev. Cuisses +1
27424,25000, -- Chev. Sabatons +1
26763,25000, -- Kasuga Kabuto +1
26921,25000, -- Kasuga Domaru +1
27075,25000, -- Kasuga Kote +1
27260,25000, -- Kasuga Haidate +1
27434,25000, -- Kas. Sune-Ate +1
	}
 
showShop(player, STATIC, stock);
end