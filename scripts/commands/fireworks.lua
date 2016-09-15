---------------------------------------------------------------------------------------------------
-- func: Fireworks!
-- auth: Tagban
-- desc: FREAKING FIREWORKS!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "iiii"
};
function onTrigger(player)
	
stock = {
4186, 100, -- Airborne
5441, 100, -- Angelwing
4216, 100, -- Brilliant Snow
4167, 100, -- Cracker
4250, 100, -- Crackler
5361, 100, -- Datechochin
5883, 100, -- Falling Star (Not Working)
4251, 100, -- Festive Fan
5725, 100, -- Goshikitenge
4184, 100, -- Kongou Inaho
4183, 100, -- Konron Hassen
4169, 100, -- Little Comet
5882, 100, -- Marine Bliss (Not Working)
4185, 100, -- Meifu Goma
5360, 100, -- Muteppo
4256, 100, -- Ouka Ranman
4257, 100, -- Papillion
5769, 100, -- Popper (Congrats!)
4215, 100, -- Popstar (Not Working)
5881, 100, -- Shisai Kaboku (Not Working)
4217, 100, -- Sparkling Hand
4253, 100, -- Spirit Masque
4252, 100, -- Summer Fan
4168, 100, -- Twinkle Shower
	}
 
showShop(player, STATIC, stock);
end