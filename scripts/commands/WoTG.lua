---------------------------------------------------------------------------------------------------
-- func: WoTG Content Items
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
    player:PrintToPlayer("Welcome to BNET.cc's shop of WoTG wares to aid you on your adventure!", 0xF);
stock = {
		10806, 15000000, -- Adamas
		18626, 15000000, -- Plenitas Virga
		18909, 15000000, -- Sanus Ensis 
		10912, 15000000, -- Drachenhorn
		10913, 10000000, -- Hyaline Hat
		10485, 10000000, -- Tessera Saio 
		10397, 10000000, -- Ishtar's collar
		28530, 7000000, -- Dumakulem's Ring
		11012, 10000000, -- Gwyddion's Cape
		21340, 15000000, -- Halakaala
		11010, 10000000, -- Feline Mantle
		11007, 10000000, -- Letalis Mantle
		10396, 10000000, -- Rioter's collar
		10288, 10000000, -- Baalmuian Robe
		10845, 10000000, -- Elanid Belt
		21245, 15000000, -- Guglielmo's bow
		19302, 15000000, -- Uguisu
		10846, 10000000, -- Istio Belt 
		10290, 10000000, -- Laudan cuirass 
		10291, 10000000, -- Febro Kaftan
    }

showShop(player, STATIC, stock);
end