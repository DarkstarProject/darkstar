---------------------------------------------------------------------------------------------------
-- func: Nyzul Isle Armor Purchase 
-- auth: <Unknown> :: Modded by Tagban + Ninjistix
-- desc: Opens Shop for Nyzul Armor. 
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)

stock = {
-- Askar
16106,150000, -- Askar Zucchetto
14568,150000, -- Askar Korazin
14983,150000, -- Askar Manopolas
15647,150000, -- Askar Dirs
15733,150000, -- Askar Gambieras
-- Phorcys
10901,300000, -- Phorcys Salade
10474,300000, -- Phorcys Korazin
10523,300000, -- Phorcys Mitts
10554,300000, -- Phorcys Dirs
10620,300000, -- Phorcys Schuhs
-- Denali
16107,150000, -- Denali Bonnet
14569,150000, -- Denali Jacket
14984,150000, -- Denali Wristbands
15648,150000, -- Denali Kecks
15734,150000, -- Denali Gamashes
-- Thaumas
10906,300000, -- Thaumas Hat
10479,300000, -- Thaumas Coat
10528,300000, -- Thaumas Gloves
10559,300000, -- Thaumas Kecks
10625,300000, -- Thaumas Nails
-- Goliard
16108,150000, -- Goliard Chapeau
14570,150000, -- Goliard Saio
14985,150000, -- Goliard Cuffs
15649,150000, -- Goliard Trews
15735,150000, -- Goliard Clogs
-- Nares
10911,300000, -- Nares Cap
10484,300000, -- Nares Saio
10533,300000, -- Nares Cuffs
10564,300000, -- Nares Trews
10630,300000, -- Nares Clogs
	}
 
showShop(player, STATIC, stock);
end